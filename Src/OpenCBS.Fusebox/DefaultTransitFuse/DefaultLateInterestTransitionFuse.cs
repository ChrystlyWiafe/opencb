using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using OpenCBS.Fusebox.Interfaces;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class DefaultLateInterestTransitionFuse:IAdvancedFuse
    {
        public void Activate(IDbTransaction transaction)
        {
            var fuseService = new FuseInterestTransitService(transaction, ProgressChangedEventHandler);
            var startDate = fuseService.GetLastFuseRunningDate(GetType().Name);
            var date = startDate;
            while (date <= TimeProvider.Today)
            {
                fuseService.RunInterestTransit(date);
                date = date.AddDays(1);
                ProgressChangedEventHandler(this,
                    new ProgressChangedEventArgs((date - startDate).Days*100/(TimeProvider.Today - startDate).Days, null));
            }
        }

        public int Order { get { return 4; } }
        public string FuseName { get { return "Transit interest"; } }
        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}
