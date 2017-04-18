using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.GUI.UserControl;
using OpenCBS.Services.Accounting;
using Fee = OpenCBS.CoreDomain.EntryFee;

namespace OpenCBS.GUI.Configuration.EntryFee
{
    public sealed partial class EntryFeeAddEdit : SweetBaseForm
    {
        private readonly Fee _entryFee;
        private readonly List<Account> _accounts;

        private bool IsRate {
            get { return _comboBoxRate.SelectedIndex == 0; }
        }

        public EntryFeeAddEdit(Fee entryFee=null)
        {
            InitializeComponent();
            var bookingService = new BookingService(User.CurrentUser);
            _accounts = bookingService.SelectAllAccounts().ToList();
            _comboBoxAccount.DataSource = _accounts;
            if (entryFee != null)
            {
                _entryFee = entryFee;
                FillFieldsByEntryFee(entryFee);
                Text = GetString("titleEdit");
            }
            else
            {
                _comboBoxRate.SelectedIndex = 0;
                Text = GetString("titleAdd");
            }
        }

        #region MainFunctions

        private bool SaveNewEntryFee()
        {
            var entryFee = GetFeeFromForm();
            var validResult = ValidateEntryFee(entryFee);

            if (validResult)
            {
                Services.GetEntryFeeServices().SaveNewEntryFee(entryFee);
                return true;
            }

            return false;
        }

        private bool UpdateEntryFee()
        {
            UpdateLocalEntryFee();

            var validResult = ValidateEntryFee(_entryFee);

            if (validResult)
            {
                Services.GetEntryFeeServices().UpdateEntryfee(_entryFee);
                return true;
            }

            return false;
        }

        private void UpdateLocalEntryFee()
        {
            var account = _comboBoxAccount.SelectedItem as Account;

            _entryFee.Name = _textBoxName.Text;
            _entryFee.Min = _numericUpDownMin.Text == "" ? 0m : _numericUpDownMin.Value;
            _entryFee.Max = _numericUpDownMax.Text == "" ? 0m : _numericUpDownMax.Value;
            _entryFee.IsRate = IsRate;
            _entryFee.MaxSum = _numericUpDownMaxSum.Text == "" ? 0m : _numericUpDownMaxSum.Value;
            _entryFee.AccountNumber = account != null ? account.AccountNumber : null;
        }

        private void FillFieldsByEntryFee(Fee entryFee)
        {
            _textBoxId.Text = entryFee.Id.ToString();
            _textBoxName.Text = entryFee.Name;
            _numericUpDownMin.Value = entryFee.Min.HasValue ? entryFee.Min.Value : 0;
            _numericUpDownMax.Value = entryFee.Max.HasValue ? entryFee.Max.Value : 0;
            _comboBoxRate.SelectedIndex = entryFee.IsRate ? 0 : 1;
            _numericUpDownMaxSum.Value = entryFee.MaxSum.HasValue ? entryFee.MaxSum.Value : 0;
            _comboBoxAccount.SelectedItem =
                _accounts.FirstOrDefault(item => item.AccountNumber == entryFee.AccountNumber);
        }
        
        #endregion

        #region ControlEvents

        private void SaveClick(object sender, System.EventArgs e)
        {
            var operationComplete = _entryFee == null ? SaveNewEntryFee() : UpdateEntryFee();

            if (operationComplete)
                Close();
        }

        private void RateChanged(object sender, System.EventArgs e)
        {
            _numericUpDownMaxSum.Enabled = _labelMaxSum.Enabled = IsRate;

            if (!IsRate)
            {
                _numericUpDownMaxSum.Value = 0m;
            }
        }

        #endregion

        #region Validation

        private bool ValidateEntryFee(Fee entryFee)
        {
            if (string.IsNullOrEmpty(entryFee.Name))
                return ShowErrorMessageAndReturnFalse("nameEmpty");

            if (MinMaxIsZero(entryFee))
                return ShowErrorMessageAndReturnFalse("minMaxIsZero");

            if (MinGreaterMax())
                return ShowErrorMessageAndReturnFalse("minGreaterMax");

            if (EmptyAccount())
                return ShowErrorMessageAndReturnFalse("accountEmpty");

            return true;
        }

        private bool ShowErrorMessageAndReturnFalse(string errorMessage)
        {
            MessageBox.Show(GetString(errorMessage));
            return false;
        }

        private static bool MinMaxIsZero(Fee entryFee)
        {
            return entryFee.Min == 0m && entryFee.Max == 0m;
        }

        private bool MinGreaterMax()
        {
            return _numericUpDownMin.Value > _numericUpDownMax.Value;
        }

        private bool EmptyAccount()
        {
            return _comboBoxAccount.SelectedValue == null;
        }

        #endregion

        private Fee GetFeeFromForm()
        {
            var account = _comboBoxAccount.SelectedItem as Account;
            var fee = new Fee
                        {
                            Name = _textBoxName.Text,
                            Min = _numericUpDownMin.Text == "" ? 0m : _numericUpDownMin.Value,
                            Max = _numericUpDownMax.Text == "" ? 0m : _numericUpDownMax.Value,
                            IsRate = IsRate,
                            MaxSum = _numericUpDownMaxSum.Text == "" ? 0m : _numericUpDownMaxSum.Value,
                            AccountNumber = account != null ? account.AccountNumber : null
                        };
            return fee;
        }
    }
}
