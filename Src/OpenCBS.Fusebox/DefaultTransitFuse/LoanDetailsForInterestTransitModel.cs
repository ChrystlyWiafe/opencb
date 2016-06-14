namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class LoanDetailsForInterestTransitModel
    {
        public int LoanId { get; set; }
        public string InterestAccruedButNotDueAccountNumber { get; set; }
        public string InterestDueAccountNuber { get; set; }
        public string InterestDueButNotReceived { get; set; }
        public int ClientId { get; set; }
        public int BranchId { get; set; }
        public string ContractCode { get; set; }
    }
}
