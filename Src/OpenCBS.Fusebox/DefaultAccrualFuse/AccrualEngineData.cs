using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Events;
using OpenCBS.CoreDomain.Products;
using OpenCBS.Services;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public static class AccrualEngineData
    {
        public static int[] GetActiveLoansIds(DateTime date, IDbTransaction tx = null)
        {
            const string sql = @"select id from dbo.ActiveLoans(@date, 0)";
            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                return connection.Query<int>(sql, new { date }, tx).ToArray();
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }

        public static DateTime GetLastInterestAccrualDate(int loanId, IDbTransaction tx = null)
        {
            const string sql = @"
                select 
	                max(event_date)
                from 
	                dbo.ContractEvents
                where
	                is_deleted = 0
	                and contract_id = @loanId
	                and 
                    (
                        event_type = 'LODE'
                        or (event_type = 'AILE' and comment is null)
                    )
            ";
            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                return connection.Query<DateTime>(sql, new { loanId }, tx).First();
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }

        private class LoanRow
        {
            public int Id { get; set; }
            public string Code { get; set; }
            public DateTime LoanStartDate { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            public DateTime ExpectedDate { get; set; }
            public DateTime? TrancheFirstRepaymentDate { get; set; }
            public int Number { get; set; }
            public decimal Principal { get; set; }
            public decimal PaidPrincipal { get; set; }
            public decimal Interest { get; set; }
            public decimal PaidInterest { get; set; }
            public decimal InterestRate { get; set; }
            public int ProductId { get; set; }
            public int BranchId { get; set; }
        }

        public static AccrualLoan GetLoan(DateTime date, int loanId, IDbTransaction tx = null)
        {
            const string sql = @"
                declare @_loanId int = @loanId
                declare @_date datetime = @date
                select
	                i.contract_id Id,
                    c.contract_code Code,
                    c.start_date LoanStartDate,
	                i.number Number,
	                i.start_date StartDate,
                    i.expected_date EndDate,
	                i.principal Principal,
	                i.paid_principal PaidPrincipal,
                    i.interest Interest,
                    i.paid_interest PaidInterest,
                    cr.interest_rate InterestRate,
                    i.expected_date ExpectedDate,
	                case
		                when i.start_date = t.start_date then t.first_repayment_date
		                else null
	                end TrancheFirstRepaymentDate,
                    cr.package_id ProductId,
                    ti.branch_id BranchId,
                    p.interest_scheme InterestScheme                    
                from 
	                dbo.InstallmentSnapshotForLoan(@_date, @_loanId) i
                left join
	                dbo.Contracts c on c.id = i.contract_id
                left join
                    dbo.Credit cr on cr.id = c.id
                left join
                    dbo.Projects pr on pr.id = c.project_id
                left join
                    dbo.Tiers ti on ti.id = pr.tiers_id
                left join
                    dbo.Packages p on p.id = cr.id
                left join
                (
	                select 
		                ce.contract_id,
		                cast(max(te.start_date) as date) start_date,
		                cast(max(te.first_repayment_date) as date) first_repayment_date
	                from
		                dbo.ContractEvents ce
	                inner join
		                dbo.TrancheEvents te on te.id = ce.id
	                where
		                ce.is_deleted = 0
		                and cast(ce.event_date as date) <= @_date
	                group by
		                ce.contract_id
                ) t on t.contract_id = c.id
                where c.id = @_loanId
                order by
                i.contract_id, i.number
            ";
            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                var rows = connection.Query<LoanRow>(sql, new { date, loanId }, tx);
                AccrualLoan loan = null;
                foreach (var row in rows)
                {
                    if (loan == null)
                    {
                        loan = new AccrualLoan(row.Id, row.InterestRate, row.Code, row.LoanStartDate, row.ProductId, row.BranchId);
                    }
                    var installment = new AccrualInstallment();
                    installment.StartDate = row.StartDate;
                    installment.EndDate = row.EndDate;
                    installment.TrancheFirstRepaymentDate = row.TrancheFirstRepaymentDate;
                    installment.Number = row.Number;
                    installment.Principal = row.Principal;
                    installment.PaidPrincipal = row.PaidPrincipal;
                    installment.Interest = row.Interest;
                    installment.PaidInterest = row.PaidInterest;
                    installment.ExpectedDate = row.ExpectedDate;
                    loan.AddInstallment(installment);
                }
                if (loan != null)
                {
                    loan.AdjustDates();
                }
                return loan;
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }

        public static decimal GetAccruedAmount(AccrualLoan loan, AccrualInstallment installment, IDbTransaction transaction = null)
        {
            const string query = @"
                    declare @_startDate datetime = @startDate
                    declare @_endDate datetime = @endDate
                    declare @_loanId int = @loanId
                    select 
                        isnull(sum(aile.interest), 0)
                    from
                        dbo.ContractEvents ce
                    inner join
                        dbo.AccrualInterestLoanEvents aile on aile.id = ce.id
                    where
                        ce.contract_id = @_loanId
                        and ce.is_deleted = 0
                        and cast(ce.event_date as date) > @_startDate
                        and cast(ce.event_date as date) <= @_endDate
                ";
            var connection = transaction == null ? DatabaseConnection.GetConnection() : transaction.Connection;
            try
            {
                var startDate = installment.Number == 1
                    ? loan.StartDate.Date.AddDays(-15)
                    : loan.GetInstallment(installment.Number - 1).EndDate;
                return connection.Query<decimal>(query, new { loanId = loan.Id, startDate, endDate = installment.EndDate }, transaction).First();
            }
            finally
            {
                if (transaction == null) connection.Dispose();
            }
        }

        public static void DeleteAccruedInterest(int loanId, DateTime date, IDbTransaction tx)
        {
            const string query = @"
                update
                    dbo.ContractEvents
                set
                    is_deleted = 1
                where
                    event_date > @date
                    and contract_id = @loanId
                    and event_type = 'AILE'
                    and comment is null
            ";
            tx.Connection.Execute(query, new { date, loanId }, tx);
        }

        public static void DeleteAccruedPenalty(int loanId, DateTime date, IDbTransaction tx)
        {
            const string query = @"
                update
                    dbo.ContractEvents
                set
                    is_deleted = 1
                where
                    event_date > @date
                    and contract_id = @loanId
                    and event_type = 'LPAE'
                    and comment is null";
            tx.Connection.Execute(query, new { date, loanId }, tx);
        }

        public static decimal GetInterestRate(AccrualLoan loan, DateTime date, IDbTransaction transaction)
        {
            const string query = @"
                select
                    t.interest_rate
                from
                (
                    -- Rank by date (desc)
                    select
                        *
                        , row_number() over (order by event_date desc) num
                    from
                    (
                        -- Disbursement
                        select
                            cr.interest_rate
                            , ce.event_date
                        from
                            dbo.Credit cr
                        left join
                            dbo.ContractEvents ce on ce.contract_id = cr.id
                        where
                            cr.id = @loanId
                            and ce.event_type = 'LODE'
                            and ce.is_deleted = 0

                        union all

                        -- Reschedulings
                        select
                            role.interest / 100
                            , ce.event_date
                        from
                            dbo.ReschedulingOfALoanEvents role
                        inner join
                            dbo.ContractEvents ce on ce.id = role.id
                        where
                            ce.is_deleted = 0
                            and ce.contract_id = @loanId
                    ) t
                    where
                        t.event_date <= @date
                ) t
                where t.num = 1
            ";
            var connection = transaction == null ? DatabaseConnection.GetConnection() : transaction.Connection;
            try
            {
                return connection.Query<decimal>(query, new { loanId = loan.Id, date }, transaction).First();
            }
            finally
            {
                if (transaction == null) connection.Dispose();
            }
        }

        public static decimal GetPartiallyEarlyPaidAmount(AccrualLoan loan, AccrualInstallment installment, DateTime date, IDbTransaction transaction = null)
        {
            // IMPORTANT: now we have to reduce the portfolio if there was an APR event
            // between the installment's start date and the given date.
            var connection = transaction == null ? DatabaseConnection.GetConnection() : transaction.Connection;
            try
            {
                const string query = @"
                        declare @_startDate datetime = @startDate
                        declare @_endDate datetime = @endDate
                        declare @_loanId int = @loanId

                        declare @lastEventId int
                        declare @lastEventType varchar(4)

                        select
                            @lastEventId = id
                            , @lastEventType = event_type
                        from
                        (
                            select
                                id, event_type, ROW_NUMBER() over (partition by contract_id order by event_date desc) num
                            from
                                dbo.ContractEvents
                            where
                                contract_id = @_loanId
                                and event_type in ('TEET', 'ROLE', 'APR')
                                and event_date > @_startDate and event_date <= @_endDate
                                and is_deleted = 0
                        ) t
                        where
                            num = 1

                        if @lastEventType = 'APR'
                        begin
                            select
                                principal
                            from
                                dbo.RepaymentEvents
                            where
                                id = @lastEventId
                        end
                        else
                        begin
                            select cast(0 as decimal)
                        end
                    ";
                var apr = connection.Query<decimal>(
                    query,
                    new
                    {
                        loanId = loan.Id,
                        startDate = installment.StartDate,
                        endDate = date
                    },
                    transaction).First();
                return apr;

            }
            finally
            {
                if (transaction == null) connection.Dispose();
            }
        }

        public static DateTime GetLastPenaltyAccrualDate(DateTime date, int loanId, IDbTransaction tx = null)
        {
            const string sql = @"
                select
	                isnull(max(last_accrual_date), @date) last_accrual_date
                from
                (
	                select 
		                min(cast(expected_date as date)) last_accrual_date
	                from 
		                dbo.InstallmentSnapshotForLoan(@date, @loanId)
	                where
		                principal > paid_principal or interest > paid_interest

	                union all

	                select
		                max(cast(event_date as date))
	                from
		                dbo.ContractEvents
	                where
		                is_deleted = 0
		                and contract_id = @loanId
		                and event_type = 'LPAE'
		                and cast(event_date as date) <= @date
                ) t
            ";
            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                return connection.Query<DateTime>(sql, new { date, loanId }, tx).First();
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }

        public static int[] GetLateLoansIds(DateTime date, IDbTransaction tx = null)
        {
            const string sql = @"select id from dbo.ActiveLoans(@date, 0) where late_days > 0";
            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                return connection.Query<int>(sql, new { date }, tx).ToArray();
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }

        public static void CallInterceptor(LoanInterestAccrualEvent accrualEvent, AccrualLoan loan, LoanProduct product, IDbTransaction transaction)
        {
            var parameters = new Dictionary<string, object>
            {
                {"Product", product},
                {"LoanId", loan.Id},
                {"ClientId", loan.ClientId},
                {"BranchId", loan.BranchId},
                {"ProductId", loan.PackageId},
                {"ContractCode", loan.Code},
                {"Event", accrualEvent},
                {"SqlTransaction",transaction}
            };
            ServicesProvider.GetInstance().GetContractServices().CallInterceptor(parameters);
        }
    }
}
