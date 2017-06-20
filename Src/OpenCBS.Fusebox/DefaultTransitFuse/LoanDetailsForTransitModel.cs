namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class LoanDetailsForTransitModel
    {
        public int LoanId { get; set; }
        public string PrincipalAccount { get; set; }
        public string InterestAccruedButNotDueAccountNumber { get; set; }
        public string InterestDueAccountNumber { get; set; }
        public string InterestDueButNotReceived { get; set; }
        public string LatePrincipalAccountNumber { get; set; }
        public string UnrecoverablePrincipalAccountNumber { get; set; }
        public string CurrentPrincipalAccountNumber { get; set; }
        public int ClientId { get; set; }
        public int BranchId { get; set; }
        public string ContractCode { get; set; }
        public int LateDays { get; set; }
        public decimal Olb { get; set; }
    }
}
