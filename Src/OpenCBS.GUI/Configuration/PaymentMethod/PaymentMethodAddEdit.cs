using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.GUI.UserControl;
using AccountingPaymentMethod = OpenCBS.CoreDomain.Accounting.PaymentMethod;

namespace OpenCBS.GUI.Configuration.PaymentMethod
{
    public partial class PaymentMethodAddEdit : SweetBaseForm
    {
        private readonly AccountingPaymentMethod _paymentMethod;
        private readonly List<AccountingPaymentMethod> _paymentMethods;
        private Account _account;
        private List<Account> _accounts;
        private bool IsItNewPaymentMethod
        {
            get { return _paymentMethod == null; }
        }

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
            var operationComplete = IsItNewPaymentMethod
                ? SaveNewPaymentMethod()
                : UpdatePaymentMethod();

            if (operationComplete)
                Close();
        }

        private bool SaveNewPaymentMethod()
        {
            var validResult = ValidatePaymentMethod();

            if (validResult)
            {
                Services.GetPaymentMethodServices().Save(GetNewPaymentMethodFromForm());
                return true;
            }

            return false;
        }

        private bool ValidatePaymentMethod()
        {
            var paymentMethod = GetNewPaymentMethodFromForm();

            if (string.IsNullOrEmpty(paymentMethod.Name))
            {
                return ShowErrorMessageAndReturnFalse("nameEmpty");
            }
            if (SelectedAccountIncorrect())
            {
                return ShowErrorMessageAndReturnFalse("selectedIncorrectAccount");
            }
            if (CurrentPaymentMethodAlredyHave(paymentMethod))
            {
                return ShowErrorMessageAndReturnFalse("alreadyHave");
            }

            return true;
        }

        private bool ShowErrorMessageAndReturnFalse(string errorMessage)
        {
            MessageBox.Show(GetString(errorMessage));
            return false;
        }

        private bool SelectedAccountIncorrect()
        {
            return _comboBoxAccounts.Text != ""
                   && (_comboBoxAccounts.SelectedItem == null
                       || _accounts.FirstOrDefault(x => x.AccountNumber == ((Account) _comboBoxAccounts.SelectedItem).AccountNumber) == null);
        }

        private bool CurrentPaymentMethodAlredyHave(AccountingPaymentMethod paymentMethod)
        {
            return _paymentMethods.FirstOrDefault(x => x.Name == paymentMethod.Name
                                                       && x.Description == paymentMethod.Description
                                                       && x.Account != null
                                                       && x.Account.AccountNumber != null
                                                       && paymentMethod.Account != null
                                                       && paymentMethod.Account.AccountNumber != null
                                                       && x.Account.AccountNumber == paymentMethod.Account.AccountNumber)
                                    != null;
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
            var validResult = ValidatePaymentMethod();

            if (validResult)
            {
                SetNewValuesToCurrentPaymentMethod();
                Services.GetPaymentMethodServices().Update(_paymentMethod);
                return true;
            }

            return false;
        }

        private void SetNewValuesToCurrentPaymentMethod()
        {
            var paymentMethod = GetNewPaymentMethodFromForm();
            _paymentMethod.Name = paymentMethod.Name;
            _paymentMethod.Description = paymentMethod.Description;
            _paymentMethod.Account = paymentMethod.Account;
        }
    }
}
