using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.GUI.UserControl;
using AccountingPaymentMethod = OpenCBS.CoreDomain.Accounting.PaymentMethod;

namespace OpenCBS.GUI.Configuration.PaymentMethod
{
    public partial class PaymentMethodAddEdit : SweetBaseForm
    {
        private AccountingPaymentMethod _paymentMethod;
        private List<AccountingPaymentMethod> _paymentMethods;
        private Account _account;
        private List<Account> _accounts;

        public PaymentMethodAddEdit(List<AccountingPaymentMethod> paymentMethods)
        {
            _paymentMethods = paymentMethods;
            InitializeComponent();

            ConfigureAccountsView();
            FillFieldsAccounts();

            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleAdd");
        }

        public PaymentMethodAddEdit(AccountingPaymentMethod paymentMethod, List<AccountingPaymentMethod> paymentMethods)
        {
            _paymentMethod = paymentMethod;
            _paymentMethods = paymentMethods;
            InitializeComponent();

            ConfigureAccountsView();
            FillFieldsAccounts();
            FillFieldsPaymentMethod(paymentMethod);

            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleEdit");
        }

        private void ConfigureAccountsView()
        {
            _comboBoxAccounts.Format += Format;
            _comboBoxAccounts.SelectedValueChanged += (sender, e) =>
            {
                _account = (Account)_comboBoxAccounts.SelectedItem;
            };
        }

        private static void Format(object sender, ListControlConvertEventArgs e)
        {
            var account = ((Account)e.ListItem);
            e.Value = account.AccountNumber + " - " + account.Label;
        }

        private void FillFieldsAccounts()
        {
            _accounts = Services.GetAccountService().SelectAccounts().ToList();
            _comboBoxAccounts.DataSource = _accounts;
        }

        private void FillFieldsPaymentMethod(AccountingPaymentMethod paymentMethod)
        {
            _textBoxId.Text = paymentMethod.Id.ToString();
            _textBoxName.Text = paymentMethod.Name;
            _descriptionRichTextBox.Text = paymentMethod.Description;
            if (paymentMethod.Account != null)
            {
                foreach (var row in _comboBoxAccounts.Items)
                {
                    if (((Account)row).AccountNumber == paymentMethod.Account.AccountNumber)
                        _comboBoxAccounts.SelectedItem = row;
                }
            }
        }

        private void SaveButtonClick(object sender, System.EventArgs e)
        {
            var operationComplete = IsItNewPaymentMethod()
                ? SaveNewPaymentMethod()
                : UpdatePaymentMethod();

            if (operationComplete)
                Close();
        }

        private bool IsItNewPaymentMethod()
        {
            return _paymentMethod == null;
        }

        private bool SaveNewPaymentMethod()
        {
            if (!ValidatePaymentMethod())
                return false;

            Services.GetPaymentMethodServices().Save(GetNewPaymentMethodFromForm());

            return true;
        }

        private bool ValidatePaymentMethod()
        {
            _labelError.Text = string.Empty;
            _buttonSave.Enabled = true;

            var paymentMethod = GetNewPaymentMethodFromForm();
            if (string.IsNullOrEmpty(paymentMethod.Name))
            {
                _labelError.Text = GetString("nameEmpty");
                _buttonSave.Enabled = false;
                return false;
            }
            if (_comboBoxAccounts.Text != ""
                && (_comboBoxAccounts.SelectedItem == null
                || _accounts.FirstOrDefault(x => x.AccountNumber == ((Account)_comboBoxAccounts.SelectedItem).AccountNumber) == null))
            {
                _labelError.Text = GetString("selectedIncorrectAccount");
                _buttonSave.Enabled = false;
                return false;
            }
            if (_paymentMethods.FirstOrDefault(x => x.Name == paymentMethod.Name
                                                 && x.Description == paymentMethod.Description
                                                 && x.Account != null
                                                 && x.Account.AccountNumber != null
                                                 && paymentMethod.Account != null
                                                 && paymentMethod.Account.AccountNumber != null
                                                 && x.Account.AccountNumber == paymentMethod.Account.AccountNumber)
                               != null)
            {
                _labelError.Text = GetString("alreadyHave");
                _buttonSave.Enabled = false;
                return false;
            }

            return true;
        }

        private AccountingPaymentMethod GetNewPaymentMethodFromForm()
        {
            return new AccountingPaymentMethod
            {
                Name = _textBoxName.Text,
                Description = _descriptionRichTextBox.Text == ""
                    ? null
                    : _descriptionRichTextBox.Text,
                Account = _comboBoxAccounts.Text == ""
                    ? null
                    : _comboBoxAccounts.Text == _account.AccountNumber + @" - " + _account.Label
                        ? _account
                        : null
            };
        }

        private bool UpdatePaymentMethod()
        {
            if (!ValidatePaymentMethod())
                return false;

            SetNewValuesToCurrentPaymentMethod();

            Services.GetPaymentMethodServices().Update(_paymentMethod);

            return true;
        }

        private void SetNewValuesToCurrentPaymentMethod()
        {
            var paymentMethod = GetNewPaymentMethodFromForm();
            _paymentMethod.Name = paymentMethod.Name;
            _paymentMethod.Description = paymentMethod.Description;
            _paymentMethod.Account = paymentMethod.Account;
        }
        
        private void PaymentMethodChanged(object sender, System.EventArgs e)
        {
            ValidatePaymentMethod();
        }

        private void PaymentMethodChanged(object sender, KeyEventArgs e)
        {
            ValidatePaymentMethod();
        }
    }
}
