namespace OpenCBS.CoreDomain.Events.Loan
{
    public class StopPenaltyLoanEvent : Event
    {
        public override string Code
        {
            get { return "SPLE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (StopPenaltyLoanEvent)MemberwiseClone();
        }
    }
}