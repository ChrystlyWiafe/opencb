using System;
using System.ComponentModel;
using System.Data;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.Services;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class FuseInterestTransitService
    {
        private readonly IDbTransaction _transaction;
        private readonly int[] _activeLoanIds;
        private readonly ProgressChangedEventHandler _progressChangedEventHandler;

        public FuseInterestTransitService(IDbTransaction transaction, ProgressChangedEventHandler progressChangedEventHandler)
        {
            _transaction = transaction;
            _progressChangedEventHandler = progressChangedEventHandler;
            _activeLoanIds = GetActiveLoansIds(TimeProvider.Now);
        }

        public void RunInterestTransit()
        {
            var date = TimeProvider.Today;
            var index = 1;
            foreach (var id in _activeLoanIds)
            {
                var lateInterest = GetLateInterest(id, date);
                var currentInterest = GetCurrentInterest(id, date);
                var loanDetails = GetLoanDetailsForTransitInterest(id);
                if (lateInterest > 0m)
                {
                    ServicesProvider.GetInstance()
                        .GetBookingService()
                        .SaveBooking(CreateLateTransitBooking(loanDetails, lateInterest), _transaction);
                }
                if (currentInterest > 0m)
                {
                    ServicesProvider.GetInstance()
                        .GetBookingService()
                        .SaveBooking(
                            CreateCurrentTransitBooking(loanDetails, currentInterest));
                }
                _progressChangedEventHandler(this, new ProgressChangedEventArgs(index/_activeLoanIds.Length*100, null));
            }
        }

        private Booking CreateLateTransitBooking(LoanDetailsForInterestTransitModel model,decimal amount)
        {
            if (model == null) return null;
            var user = User.CurrentUser.Id != 0 ? User.CurrentUser : new User {Id = 1};

            return new Booking
            {
                Debit = new Account { AccountNumber = model.InterestAccruedButNotDueAccountNumber},
                Credit = new Account {AccountNumber = model.InterestDueAccountNuber},
                Amount = amount,
                Description = "Interest due but not received for "+model.ContractCode,
                Date = TimeProvider.Now,
                ClientId = model.ClientId,
                User = user,
                Branch = new Branch { Id = model.BranchId },
                LoanId = model.LoanId,
                SavingEventId = 0,
                IsManualEditable = false
            };
        }

        private Booking CreateCurrentTransitBooking(LoanDetailsForInterestTransitModel model, decimal amount)
        {
            if (model == null) return null;
            var user = User.CurrentUser.Id != 0 ? User.CurrentUser : new User { Id = 1 };

            return new Booking
            {
                Debit = new Account { AccountNumber = model.InterestAccruedButNotDueAccountNumber },
                Credit = new Account { AccountNumber = model.InterestDueAccountNuber },
                Amount = amount,
                Description = "Interest due for " + model.ContractCode,
                Date = TimeProvider.Now,
                ClientId = model.ClientId,
                User = user,
                Branch = new Branch { Id = model.BranchId },
                LoanId = model.LoanId,
                SavingEventId = 0,
                IsManualEditable = false
            };
        }

        private int[] GetActiveLoansIds(DateTime date)
        {
            const string sql = @"select id from dbo.ActiveLoans(@date, 0)";
            var connection = _transaction == null ? DatabaseConnection.GetConnection() : _transaction.Connection;
            try
            {
                return connection.Query<int>(sql, new { date }, _transaction).ToArray();
            }
            finally
            {
                if (_transaction == null) connection.Close();
            }
        }

        private decimal GetLateInterest(int loanId, DateTime date)
        {
            const string query =
                @"
                    DECLARE @_date DATETIME =  CAST(@date AS DATE)

                    SELECT
	                    CASE
		                    WHEN 
			                    (ISNULL(i2.interest_repayment,0) - ISNULL(i2.paid_interest,0)) > 0
		                    THEN 
			                    (ISNULL(i2.interest_repayment,0) - ISNULL(i2.paid_interest,0))
		                    ELSE 
			                    0
	                    END UnpaidAmount
                    FROM
	                    dbo.Installments i
                    LEFT JOIN
	                    dbo.Installments i2 ON i2.contract_id = i.contract_id AND i2.number = i.number - 1 
                    WHERE
	                    i.contract_id = @loanId
	                    AND @_date >= CAST(i.start_date AS DATE)
	                    AND @_date <= CAST(i.expected_date AS DATE)
                ";
            return _transaction.Connection.Query<decimal?>(query, new { date, loanId }, _transaction).FirstOrDefault() ??
                   0m;
        }
       private decimal GetCurrentInterest(int loanId, DateTime date)
        {
            const string query =
                @"
                    DECLARE @_date DATE = CAST(@date AS DATE)

                    SELECT
	                    CASE
		                    WHEN 
			                    (ISNULL(i.interest_repayment,0) - ISNULL(i.paid_interest,0)) > 0
		                    THEN 
			                    (ISNULL(i.interest_repayment,0) - ISNULL(i.paid_interest,0))
		                    ELSE 
			                    0
	                    END UnpaidAmount
                    FROM
	                    dbo.Installments i
                    WHERE
	                    i.contract_id = @loanId
	                    AND @_date = CAST(i.expected_date AS DATE) 
                ";
            return _transaction.Connection.Query<decimal?>(query, new { date, loanId }, _transaction).FirstOrDefault() ??
                   0m;
        }

        private LoanDetailsForInterestTransitModel GetLoanDetailsForTransitInterest(int loanId)
        {
            const string query =
                @"
                    SELECT
	                    c.id LoanId
	                    , cr.interest_accrued_but_not_due_account InterestAccruedButNotDueAccountNumber
	                    , cr.interest_due_account InterestDueAccountNuber
	                    , cr.interest_due_but_not_received_account InterestDueButNotReceived
	                    , pr.tiers_id ClientId
	                    , t.branch_id BranchId
                        , c.contract_code ContractCode
                    FROM
	                    dbo.Contracts c
                    LEFT JOIN
	                    dbo.Credit cr ON cr.id = c.id
                    LEFT JOIN
	                    dbo.Projects pr ON pr.id = c.project_id
                    LEFT JOIN
	                    dbo.Tiers t ON t.id = pr.tiers_id
                    WHERE
	                    @loanId = c.id
                ";
            return
                _transaction.Connection.Query<LoanDetailsForInterestTransitModel>(query, new { loanId }, _transaction)
                    .FirstOrDefault();
        }
    }
}
