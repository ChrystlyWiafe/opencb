using System;
using System.Windows.Forms;

namespace OpenCBS.Fusebox.Fusebox
{
    public partial class FuseBoxExecutingForm : Form
    {
        private readonly Fusebox _fusebox;

        public FuseBoxExecutingForm()
        {
            _fusebox = new Fusebox();
            InitializeComponent();
        }

        private void FuseBoxExecutingForm_Load(object sender, EventArgs e)
        {
            Attach();
        }

        private void Attach()
        {
            _fusebox.FuseChanged += (o, args) =>
            {
                var fuseArgs = (FuseChangedEventArgs) args;
                progressBarFuses.Value = fuseArgs.PercentageValue;
                label2.Text = fuseArgs.FuseName;
            };
            _fusebox.LoansProgressChanged += (o, args) => { progressBarLoans.Value = args.ProgressPercentage; };
            _fusebox.FuseboxComplited += (sender, args) => { this.Close(); };
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            var confirmResult =
                MessageBox.Show(
                    "Are you sure you want to close day? All further operation for given date will be forbiden",
                    "Confirm", MessageBoxButtons.YesNo);

            if (confirmResult != DialogResult.Yes) return;

            _fusebox.Run();
            btnStart.Enabled = false;
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            _fusebox.Stop();
            progressBarLoans.Value = 0;
            progressBarFuses.Value = 0;
            btnStart.Enabled = true;
        }

        private void FuseBoxExecutingForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            _fusebox.Stop();
        }
    }
}
