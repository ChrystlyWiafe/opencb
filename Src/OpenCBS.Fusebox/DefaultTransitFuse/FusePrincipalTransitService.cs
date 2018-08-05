using System;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.CoreDomain.Events.Loan;
using OpenCBS.Services;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class FusePrincipalTransitService
    {
        private readonly IDbTransaction _transaction;
        private LoanDetailsForTransitModel[] _activeLoans;
        private readonly ProgressChangedEventHandler _progressChangedEventHandler;

        public FusePrincipalTransitService(IDbTransaction transaction, ProgressChangedEventHandler progressChangedEventHandler)
        {
            _transaction = transaction;
            _progressChangedEventHandler = progressChangedEventHandler;
        }

        public void RunPrincipalTransit(DateTime date)
        {
            _activeLoans = GetActiveLoans(date);
            var index = 0;
            foreach (var loan in _activeLoans)
            {
                index++;

                var transitEvent = new LoanTransitionEvent
                {   
                    Date = date,
                    EntryDate = TimeProvider.Now,
                    Branch = new Branch { Id = loan.BranchId},
                    Deleted = false,
                    User = User.CurrentUser,
                    ContracId = loan.LoanId,
                    Amount = loan.Olb
                };

                if (loan.LateDays == 3)
                {
                    transitEvent.Code = "GLLL";
                }
                else if (loan.LateDays == 181)
                {
                    transitEvent.Code = "LLBL";
                }

                if (!string.IsNullOrEmpty(transitEvent.Code))
                    ServicesProvider.GetInstance()
                        .GetContractServices()
                        .FireEvent(transitEvent, new Loan {Id = loan.LoanId}, (SqlTransaction) _transaction);

                _progressChangedEventHandler(this, new ProgressChangedEventArgs(GetPercentageValue(index, _activeLoans.Length), null));
            }
        }

        private LoanDetailsForTransitModel[] GetActiveLoans(DateTime date)
        {
            const string sql = @"
                                SELECT
	                                al.id LoanId
	                                , al.late_days LateDays
	                                , al.olb Olb
	                                , al.interest Interest
	                                , c.contract_code ContratcCode
                                    , cr.principal_account PrincipalAccount
	                                , cr.interest_accrued_but_not_due_account InterestAccruedButNotDueAccountNumber
	                                , cr.interest_due_account InterstDueAccountNumber
	                                , cr.interest_due_but_not_received_account InterestDueButNotReceivedAccountNumber
                                    , cr.late_principal_account LatePrincipalAccount
                                    , cr.unrecoverable_principal_account UnrecoverablePrincipalAccountNumber
                                    , cr.current_principal_account CurrentPrincipalAccountNumber
	                                , t.id ClientId
	                                , t.branch_id BranchId
                                FROM
	                                dbo.ActiveLoans(@date,0) al
                                LEFT JOIN
	                                dbo.Contracts c ON c.id = al.id
                                LEFT JOIN
	                                dbo.Credit cr ON cr.id = al.id
                                LEFT JOIN
	                                dbo.Projects pr ON pr.id = c.project_id
                                LEFT JOIN
	                                dbo.Tiers t ON t.id = pr.tiers_id
                                ";
            var connection = _transaction == null ? DatabaseConnection.GetConnection() : _transaction.Connection;
            try
            {
                return connection.Query<LoanDetailsForTransitModel>(sql, new { date }, _transaction).ToArray();
            }
            finally
            {
                if (_transaction == null) connection.Close();
            }
        }

        private int GetPercentageValue(int value, int max)
        {
            return value/max*100;
        }

        public DateTime GetLastFuseRunningDate(string fuseName)
        {
            const string sql = @"
                                SELECT TOP 1 
	                                ended_at
                                FROM
	                                dbo.FuseboxLogs
                                WHERE
	                                fuse_name = cast(@fuseName AS NVARCHAR(50))
                                ORDER BY
	                                ended_at DESC
                                ";
            var connection = _transaction == null ? DatabaseConnection.GetConnection() : _transaction.Connection;
            try
            {
                return connection.Query<DateTime?>(sql, new {fuseName}, _transaction).FirstOrDefault() ??
                       TimeProvider.Now;
            }
            finally
            {
                if (_transaction == null) connection.Close();
            }
        }
    }
}
