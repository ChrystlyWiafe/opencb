using System;
namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class AccrualInstallment
    {
        public int Number { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime? ExpectedDate { get; set; }
        public DateTime? TrancheFirstRepaymentDate { get; set; }
        public decimal Principal { get; set; }
        public decimal PaidPrincipal { get; set; }
        public decimal Interest { get; set; }
        public decimal PaidInterest { get; set; }

        public bool IsRepaid
        {
            get { return Principal + Interest == PaidPrincipal + PaidInterest; }
        }
    }
}