using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OpenCBS.Fusebox
{
    public class FuseChangedEventArgs:EventArgs
    {
        public FuseChangedEventArgs(string fuseName,int percentageValue)
        {
            FuseName = fuseName;
            PercentageValue = percentageValue;
        }
        public string FuseName { get; set; }
        public int PercentageValue { get; set; }
    }
}
