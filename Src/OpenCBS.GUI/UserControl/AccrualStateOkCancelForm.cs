using System.Windows.Forms;

namespace OpenCBS.GUI.UserControl
{
    public partial class AccrualStateOkCancelForm : Form
    { 
        public string Comment
        {
            get { return _commentTextBox.Text; }
        }

        public AccrualStateOkCancelForm()
        {
            InitializeComponent();
        }
    }
}
