using System;
using System.Windows.Forms;
using OpenCBS.Shared;

namespace OpenCBS.GUI.UserControl
{
    public partial class AccrualStateOkCancelForm : Form
    {
        public AccrualStateOkCancelForm()
        {
            InitializeComponent();
            _dtPickerEventDate.Value = TimeProvider.Now;
        }

        public string Comment
        {
            get { return _commentTextBox.Text ?? ""; }
        }

        public DateTime EventDate
        {
            get
            {
                return
                    _dtPickerEventDate.Value.AddSeconds(-_dtPickerEventDate.Value.Second)
                        .AddMilliseconds(-_dtPickerEventDate.Value.Millisecond);
            }
        }

    }
}
