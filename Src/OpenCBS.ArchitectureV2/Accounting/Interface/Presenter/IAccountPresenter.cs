using OpenCBS.ArchitectureV2.Interface.Presenter;
using OpenCBS.CoreDomain.Accounting.Model;

namespace OpenCBS.ArchitectureV2.Accounting.Interface.Presenter
{
    public interface IAccountPresenter : IPresenter
    {
        void Run(Account account = null);
    }
}
