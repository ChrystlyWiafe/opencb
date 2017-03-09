using OpenCBS.Shared;

namespace OpenCBS.CoreDomain.Events.Loan
{
    public class NonAccrualInterestEvent : Event
    {
        public override string Code
        {
            get { return "NAIE"; }
            set { _code = value; }
        }
        public OCurrency Interest { get; set; }
        public override string Description { get; set; }
        public override Event Copy()
        {
            return (NonAccrualInterestEvent)MemberwiseClone();
        }
    }
}