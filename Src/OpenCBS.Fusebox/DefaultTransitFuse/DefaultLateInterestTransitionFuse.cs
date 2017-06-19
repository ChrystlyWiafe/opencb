using System.ComponentModel;
using System.Data;
using OpenCBS.Fusebox.Interfaces;

namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class DefaultLateInterestTransitionFuse:IAdvancedFuse
    {
        public void Activate(IDbTransaction transaction)
        {
            var fuseService = new FuseInterestTransitService(transaction, ProgressChangedEventHandler);
            fuseService.RunInterestTransit();
        }

        public int Order { get { return 78; } }
        public string FuseName { get { return "Transit interest"; } }
        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}
