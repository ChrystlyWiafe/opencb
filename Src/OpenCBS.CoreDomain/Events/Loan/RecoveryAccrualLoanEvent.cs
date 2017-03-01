namespace OpenCBS.CoreDomain.Events.Loan
{
    public class RecoveryAccrualLoanEvent : Event
    {
        public override string Code
        {
            get { return "RALE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (RecoveryAccrualLoanEvent)MemberwiseClone();
        }
    }
}