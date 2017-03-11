using System.Collections.Generic;
using OpenCBS.Controls.Models;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.Shared;

namespace OpenCBS.Extensions
{
    public interface IActionsButtonInitializer
    {
        List<ListViewButtonModel> GetActions(Loan loan);
    }
}
