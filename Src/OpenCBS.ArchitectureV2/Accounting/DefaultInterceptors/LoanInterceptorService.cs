using System.ComponentModel;
using System.Data;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.Services.Accounting;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public class LoanInterceptorService
    {
        private readonly AccountService _service;

        public LoanInterceptorService()
        {
            _service = new AccountService(User.CurrentUser);
        }

        public void SetAccountsToCredit(Loan loan,IDbTransaction transaction)
        {
            if(loan==null || loan.Product == null) throw new InvalidEnumArgumentException();

            const string query =
            @"
                UPDATE
	                dbo.Credit
                SET
	                accrued_penalty_account = @accruedPenaltyAccount
	                , interest_accrued_but_not_due_account = @interestAccruedButNotDueAccount
	                , interest_due_account = @interestDueAccount
	                , interest_due_but_not_received_account = @interestDueButNotReceivedAccount
	                , interest_income_account = @interestIncomeAccount
	                , penalty_income_account = @penaltyIncomeAccount
	                , principal_account = @principalAccount
	                , reschedule_account = @rescheduleAccount
                    , late_principal_account = @latePrincipalAccount
                    , unrecoverable_principal_account = @unrecoverablePrincipalAccount
            ";
            transaction.Connection.Execute(query, new
            {
                @accruedPenaltyAccount = loan.Product.AccruedPenaltyAccountNumber,
                @interestAccruedButNotDueAccount = loan.Product.InterestAccruedButNotDueAccountNumber,
                @interestDueAccount = loan.Product.InterestDueAccountNumber,
                @interestDueButNotReceivedAccount = loan.Product.InterestDueButNotReceivedAccountNumber,
                @interestIncomeAccount = loan.Product.InterestIncomeAccountNumber,
                @penaltyIncomeAccount = loan.Product.PenaltyIncomeAccountNumber,
                @principalAccount = loan.Product.PrincipalAccountNumber,
                @latePrincipalAccount = loan.Product.LatePrincipalAccountNumber,
                @unrecoverablePrincipalAccount = loan.Product.UnrecoverablePrincipalAccountNumber,
                @rescheduleAccount = loan.Product.RescheduleAccountNumber
            }, transaction);
        }

        public void SetPrincipalAccount(int loanId,string accountNumber,IDbTransaction transaction)
        {
            const string query =
            @"
                UPDATE
	                dbo.Credit
                SET
	                principal_account = @principalAccountNumber
            ";
            transaction.Connection.Execute(query, new
            {
                @principalAccountNumber = accountNumber
            }, transaction);
        }
    }
}
