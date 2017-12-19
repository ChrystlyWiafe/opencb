using System.ComponentModel;
using System.Data;
using OpenCBS.Fusebox.Interfaces;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultTransitFuse
{
    public class DefaultLatePrincipalTransitionFuse:IAdvancedFuse
    {
        public void Activate(IDbTransaction transaction)
        {
            var fuseService = new FusePrincipalTransitService(transaction, ProgressChangedEventHandler);
            var date = fuseService.GetLastFuseRunningDate(GetType().Name);
            while (date <= TimeProvider.Today)
            {
                fuseService.RunPrincipalTransit(date);
                date = date.AddDays(1);
            }
        }

        public int Order { get { return 79; } }
        public string FuseName { get { return "Transit principal"; } }
        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}
