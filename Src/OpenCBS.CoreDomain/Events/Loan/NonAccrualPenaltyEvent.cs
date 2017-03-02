namespace OpenCBS.CoreDomain.Events.Loan
{
    public class NonAccrualPenaltyEvent : Event
    {
        public override string Code
        {
            get { return "NALE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (NonAccrualPenaltyEvent)MemberwiseClone();
        }
    }
}