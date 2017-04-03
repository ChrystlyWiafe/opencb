using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OpenCBS.Controls.Models
{
    public class ListViewButtonModel
    {
        public string Title { get; set; }
        public EventHandler EventHandler { get; set; }
        public bool Enabled { get; set; }
    }
}
