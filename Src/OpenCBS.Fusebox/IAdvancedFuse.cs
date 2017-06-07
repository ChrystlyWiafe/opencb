using System;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using OpenCBS.CoreDomain.Events.Loan;

namespace OPENCBS.Fusebox
{
    public interface IAdvancedFuse:IFuse
    {
        string FuseName { get; }
        ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}
