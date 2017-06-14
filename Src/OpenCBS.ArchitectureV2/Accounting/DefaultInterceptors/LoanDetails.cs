using OpenCBS.CoreDomain.Contracts.Loans;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public class LoanDetails
    {
        public LoanDetails() { }
        public LoanDetails(Loan loan)
        {
            Id = loan.Id;
            ClientId = loan.Project.Client.Id;
            BranchId = loan.Project.Client.Branch.Id;
            ContractCode = loan.Code;
            PrincipalAccountNumber = loan.PrincipalAccountNumber;
            InterestDueButNotReceivedAccountNumber = loan.InterestDueButNotReceivedAccountNumber;
            InterestDueAccountNumber = loan.InterestDueAccountNumber;
            PenaltyIncomeAccountNumber = loan.PenaltyIncomeAccountNumber;
            InterestAccruedButNotDueAccountNumber = loan.InterestAccruedButNotDueAccountNumber;
            InterestIncomeAccountNumber = loan.InterestIncomeAccountNumber;
            AccruedPenaltyAccountNumber = loan.AccruedPenaltyAccountNumber;
            RescheduleAccountNumber = loan.RescheduleAccountNumber;
        }

        public int Id { get; set; }
        public int ClientId { get; set; }
        public int BranchId { get; set; }
        public string ContractCode { get; set; }
        public string PrincipalAccountNumber { get; set; }
        public string InterestDueButNotReceivedAccountNumber { get; set; }
        public string InterestDueAccountNumber { get; set; }
        public string PenaltyIncomeAccountNumber { get; set; }
        public string InterestAccruedButNotDueAccountNumber { get; set; }
        public string InterestIncomeAccountNumber { get; set; }
        public string AccruedPenaltyAccountNumber { get; set; }
        public string RescheduleAccountNumber { get; set; }
    }
}
