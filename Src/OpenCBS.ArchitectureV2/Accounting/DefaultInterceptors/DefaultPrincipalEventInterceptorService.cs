using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.CoreDomain.Events;
using OpenCBS.CoreDomain.Events.Loan;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Shared;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public class DefaultPrincipalEventInterceptorService
    {
        private readonly LoanDetails _loanDetails;
        private readonly CoreDomain.Events.Loan.Event _event;
        private readonly SqlTransaction _transaction;

        public DefaultPrincipalEventInterceptorService(IDictionary<string, object> parameters)
        {
            try
            {
                _event = (CoreDomain.Events.Loan.Event)parameters["Event"];
                _transaction = (SqlTransaction)parameters["SqlTransaction"];

                if (parameters.ContainsKey("Loan"))
                {
                    var coreLoan = (Loan) parameters["Loan"];
                    _loanDetails = new LoanDetails(coreLoan);
                }
                else
                {
                    var loanId = (int) parameters["LoanId"];
                    _loanDetails = EventInterceptorData.GetLoanDetails(loanId, _transaction);
                }
            }
            catch(Exception ex)
            {
                throw new OpenCbsException("Error while intialize interceptor parameters");
            }
        }

        public LoanTransitionEvent GetPrincipalTransitEvent()
        {
            //Repayment Event
            if (_event.Code == "RBLE")
            {
                var repayment = (RepaymentEvent) _event;

                if (repayment.Principal.Value > 0m && GetLateDays(_event.ContracId,_transaction) == 0)
                {
                    var code = GetLastPrincipalTransition(_event.ContracId, _transaction);

                    return  new LoanTransitionEvent
                    {
                        Code = code == "GLLL" ? "LLGL" : code == "GLBL" ? "BLGL" : "",
                        EntryDate = TimeProvider.Now,
                        Branch = new Branch { Id = repayment.Branch.Id },
                        Deleted = false,
                        User = User.CurrentUser,
                        ContracId = repayment.ContracId,
                    };
                }
            }

            return null;
        }

        public int GetLateDays(int loanId, IDbTransaction transaction)
        {
            const string query =
                @"
                    SELECT
	                    late_days
	                    , olb
                    FROM
	                    dbo.ActiveLoans(@date,0) al
                    WHERE
	                    al.id = @loanId
                ";
            return transaction.Connection.Query<int>(query, new { loanId }, transaction).FirstOrDefault();
        }

        public string GetLastPrincipalTransition(int loanId, IDbTransaction transaction)
        {
            const string query =
                @"
                    SELECT TOP 1
	                    event_type
                    FROM
	                    dbo.ContractEvents ce
                    WHERE
	                    ce.id = @loanId
	                    AND event_type in ('GLLL', 'LLBL', 'BLGL', 'LLGL')
                    ORDER BY
	                    event_date 
                ";
            return transaction.Connection.Query<string>(query, new { loanId }, transaction).FirstOrDefault();
        }
    }
}
