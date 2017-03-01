namespace OpenCBS.CoreDomain.Events.Loan
{
    public class StopAccrualLoanEvent : Event
    {
        public override string Code
        {
            get { return "SALE"; }
            set { _code = value; }
        }
        public override string Description { get; set; }

        public override Event Copy()
        {
            return (StopAccrualLoanEvent)MemberwiseClone();
        }
    }
}