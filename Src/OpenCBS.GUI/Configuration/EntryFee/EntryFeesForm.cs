using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Windows.Forms;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.GUI.UserControl;
using OpenCBS.Services;
using Fee = OpenCBS.CoreDomain.EntryFee;

namespace OpenCBS.GUI.Configuration.EntryFee
{
    public partial class EntryFeesForm : SweetBaseForm
    {
        private List<Fee> _entryFees;

        private bool ShowDeleted {
            get { return _checkBoxShowDeleted.Checked; }
        }

        public EntryFeesForm()
        {
            InitializeComponent();

            DisplayEntryFee();
        }

        private void DisplayEntryFee()
        {
            _listViewEntryFee.Items.Clear();

            UpdateLocalEntryFees();

            SetEntryFeesToListView();
        }

        private void UpdateLocalEntryFees()
        {
            _entryFees = Services.GetEntryFeeServices().SelectAllEntryFee();
        }

        private void SetEntryFeesToListView()
        {
            ClearListView();
            var accountService = ServicesProvider.GetInstance().GetAccountService();

            foreach (var fee in _entryFees)
            {
                if (!ShowDeleted && fee.IsDeleted)
                    continue;

                var item = new ListViewItem(fee.Id.ToString()) { Tag = fee };
                item.SubItems.Add(fee.Name);
                item.SubItems.Add(fee.Min.HasValue ? fee.Min.Value.ToString(CultureInfo.CurrentCulture).TrimEnd('0').TrimEnd(',').TrimEnd('.') : "");
                item.SubItems.Add(fee.Max.HasValue ? fee.Max.Value.ToString(CultureInfo.CurrentCulture).TrimEnd('0').TrimEnd(',').TrimEnd('.') : "");
                item.SubItems.Add(fee.IsRate.ToString());
                item.SubItems.Add(fee.MaxSum.ToString().TrimEnd('0').TrimEnd(',').TrimEnd('.'));
                var account = accountService.SelectAccountByNumber(fee.AccountNumber);
                item.SubItems.Add(account != null ? account.ToString() : (new Account()).ToString());

                if (fee.IsDeleted)
                {
                    item.BackColor = Color.FromArgb(188, 209, 199);
                    item.ForeColor = Color.White;
                }

                _listViewEntryFee.Items.Add(item);
            }
        }

        private void ClearListView()
        {
            _listViewEntryFee.Items.Clear();
        }

        private void CloseClick(object sender, System.EventArgs e)
        {
            Close();
        }

        private void AddClick(object sender, System.EventArgs e)
        {
            var addEntryFeeForm = new EntryFeeAddEdit();
            addEntryFeeForm.ShowDialog();

            DisplayEntryFee();
        }

        private void EditClick(object sender, System.EventArgs e)
        {
            if (_listViewEntryFee.SelectedItems.Count != 0)
            {
                EditSelectedEntryFee();
                return;
            }

            MessageBox.Show(GetString("needToSelectFee"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void _listViewEntryFee_DoubleClick(object sender, System.EventArgs e)
        {
            EditSelectedEntryFee();
        }

        private void EditSelectedEntryFee()
        {
            var addEntryFeeForm = new EntryFeeAddEdit((Fee)_listViewEntryFee.SelectedItems[0].Tag);
            addEntryFeeForm.ShowDialog();

            DisplayEntryFee();
        }

        private void _checkBoxShowDeleted_CheckedChanged(object sender, System.EventArgs e)
        {
            DisplayEntryFee();
        }

        private void DeleteClick(object sender, System.EventArgs e)
        {
            if (_listViewEntryFee.SelectedItems.Count != 0)
            {
                //TODO handle case if some product use this entry fee

                if (MessageBox.Show(GetString(@"areUSure"), GetString("deleteSelectedEntryFee"), MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    Services.GetEntryFeeServices().DeleteEntryfee((Fee)_listViewEntryFee.SelectedItems[0].Tag);
                    DisplayEntryFee();
                }
                return;
            }

            MessageBox.Show(GetString("needToSelectFee"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
