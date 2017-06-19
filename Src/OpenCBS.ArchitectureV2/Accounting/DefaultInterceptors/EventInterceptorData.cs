using System.Data;
using System.Linq;
using Dapper;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public static class EventInterceptorData
    {
        public static LoanDetails GetLoanDetails(int loanId,IDbTransaction transaction)
        {
            const string query =
                @"
                    SELECT
	                    c.id Id
	                    , c.contract_code ContractCode
	                    , t.id ClientId
	                    , t.branch_id BranchId
	                    , cr.principal_account PrincipalAccountNumber
	                    , cr.interest_accrued_but_not_due_account InterestAccruedButNotDueAccountNumber
	                    , cr.interest_due_account InterestDueAccountNumber
	                    , cr.interest_due_but_not_received_account InterestDueButNotReceivedAccountNumber
	                    , cr.interest_income_account InterestIncomeAccountNumber
	                    , cr.accrued_penalty_account AccruedPenaltyAccountNumber
	                    , cr.penalty_income_account PenaltyIncomeAccountNumber
	                    , cr.reschedule_account RescheduleAccountNumber
                        , cr.late_principal_account LatePrincipalAccount
                        , cr.unrecoverable_principal_account UnrecoverablePrincipalAccount
                    FROM
	                    dbo.Contracts c
                    LEFT JOIN
	                    dbo.Credit cr ON cr.id = c.id
                    LEFT JOIN 
	                    dbo.Projects pr ON pr.id = c.project_id
                    LEFT JOIN
	                    dbo.Tiers t ON t.id = pr.tiers_id
                    WHERE
	                    c.id = @loanId
                ";
            return transaction.Connection.Query<LoanDetails>(query, new { loanId }, transaction).FirstOrDefault();
        }
    }
}
