using System;
using OpenCBS.CoreDomain.Contracts.Loans;

namespace OpenCBS.ArchitectureV2.CommandData
{
    public class ShowWriteOffViewCommandData
    {
        public Loan Loan { get; set; }
        public Action DefaultAction { get; set; }  
        public Action RefreshAction { get; set; }
    }
}
