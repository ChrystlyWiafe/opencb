namespace OpenCBS.CoreDomain.Events.Loan
{
    public class StopInterestLoanEvent : Event
    {
        public override string Code
        {
            get { return "SILE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (StopInterestLoanEvent)MemberwiseClone();
        }
    }
}