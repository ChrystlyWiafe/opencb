namespace OpenCBS.CoreDomain.Events.Loan
{
    public class RecoveryPenaltyLoanEvent : Event
    {
        public override string Code
        {
            get { return "RPLE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (RecoveryPenaltyLoanEvent)MemberwiseClone();
        }
    }
}