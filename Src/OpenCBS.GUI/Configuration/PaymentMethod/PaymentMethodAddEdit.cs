using System.Collections.Generic;
using System.Linq;
using OpenCBS.GUI.UserControl;
using AccountingPaymentMethod = OpenCBS.CoreDomain.Accounting.PaymentMethod;

namespace OpenCBS.GUI.Configuration.PaymentMethod
{
    public partial class PaymentMethodAddEdit : SweetBaseForm
    {
        private AccountingPaymentMethod _paymentMethod;
        private List<AccountingPaymentMethod> _paymentMethods;

        public PaymentMethodAddEdit(List<AccountingPaymentMethod> paymentMethods)
        {
            _paymentMethods = paymentMethods;
            InitializeComponent();

            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleAdd");
        }

        public PaymentMethodAddEdit(AccountingPaymentMethod paymentMethod, List<AccountingPaymentMethod> paymentMethods)
        {
            _paymentMethod = paymentMethod;
            _paymentMethods = paymentMethods;
            InitializeComponent();

            FillFieldsPaymentMethod(paymentMethod);

            ValidatePaymentMethod();

            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleEdit");
        }

        private void FillFieldsPaymentMethod(AccountingPaymentMethod paymentMethod)
        {
            _textBoxId.Text = paymentMethod.Id.ToString();
            _textBoxName.Text = paymentMethod.Name;
            _descriptionRichTextBox.Text = paymentMethod.Description;
        }

        private void SaveButtonClick(object sender, System.EventArgs e)
        {
            var operationComplete = _paymentMethod == null
                ? SaveNewPaymentMethod()
                : UpdatePaymentMethod();

            if (operationComplete)
                Close();
        }

        private bool SaveNewPaymentMethod()
        {
            if (!ValidatePaymentMethod())
                return false;

            Services.GetPaymentMethodServices().Save(GetNewPaymentMethodFromForm());

            return true;
        }

        private AccountingPaymentMethod GetNewPaymentMethodFromForm()
        {
            return new AccountingPaymentMethod
            {
                Name = _textBoxName.Text,
                Description = _descriptionRichTextBox.Text == ""
                    ? null
                    : _descriptionRichTextBox.Text
            };
        }

        private bool UpdatePaymentMethod()
        {
            var paymentMethod = GetNewPaymentMethodFromForm();

            if (!ValidatePaymentMethod())
                return false;

            _paymentMethod.Name = paymentMethod.Name;
            _paymentMethod.Description = paymentMethod.Description;

            Services.GetPaymentMethodServices().Update(_paymentMethod);

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
            if (_paymentMethods.FirstOrDefault(x => x.Name == paymentMethod.Name && x.Description == paymentMethod.Description) != null)
            {
                _labelError.Text = GetString("alreadyHave");
                _buttonSave.Enabled = false;
                return false;
            }

            return true;
        }

        private void PaymentMethodChanged(object sender, System.EventArgs e)
        {
            ValidatePaymentMethod();
        }
    }
}
