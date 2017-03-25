using System;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Interface.Service;
using OpenCBS.CoreDomain.Clients;
using OpenCBS.Enums;

namespace OpenCBS.ArchitectureV2.Interface
{
    public interface ISearchClientForm : IDisposable
    {
        void Initialize(Control pMdiForm);

        void Initialize(OClientTypes pTiersEnum, bool includeNotactiveOnly);

        void ShowForm();

        IClient Client { get; }

        DialogResult DialogResult { get; }

        bool IsDefaultForm { get; }

    }
}
