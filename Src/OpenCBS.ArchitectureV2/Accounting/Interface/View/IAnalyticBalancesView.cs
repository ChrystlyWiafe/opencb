using System.Collections.Generic;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Accounting.Interface.Presenter;
using OpenCBS.ArchitectureV2.Interface.View;
using OpenCBS.CoreDomain.Accounting.Model;

namespace OpenCBS.ArchitectureV2.Accounting.Interface.View
{
    public interface IAnalyticBalancesView : IView<IAnalyticBalancesPresenterCallbacks>
    {
        void SetBalances(List<Balance> balances);
        void ShowBalancesOnly();
        Control Control { get; }
    }
}
