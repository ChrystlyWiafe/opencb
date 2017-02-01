using System;
using System.Collections.Generic;
using System.Windows.Forms;
using OpenCBS.GUI.UserControl;
using AccountingPaymentMethod = OpenCBS.CoreDomain.Accounting.PaymentMethod;

namespace OpenCBS.GUI.Configuration.PaymentMethod
{
    public partial class PaymentMethodForm : SweetBaseForm
    {
        private List<AccountingPaymentMethod> _paymentMethods;

        public PaymentMethodForm()
        {
            InitializeComponent();
            DisplayPaymentMethods();
        }

        private void DisplayPaymentMethods()
        {
            ClearListOfPaymentMethods();

            SetLocalPaymentMethods();

            SetPaymentMethodToListView();
        }

        private void ClearListOfPaymentMethods()
        {
            _listViewPaymentMethods.Items.Clear();
        }

        private void SetLocalPaymentMethods()
        {
            _paymentMethods = Services.GetPaymentMethodServices().GetAllNonCashsPaymentMethods();
        }

        private void SetPaymentMethodToListView()
        {
            foreach (var paymentMethod in _paymentMethods)
            {
                var item = new ListViewItem(paymentMethod.Id.ToString()) { Tag = paymentMethod };
                item.SubItems.Add(paymentMethod.Name);
                var accountNameOfPaymentMethod = paymentMethod.Account != null
                    ? paymentMethod.AccountNumber + " - " + paymentMethod.Account.Label
                    : "";
                item.SubItems.Add(accountNameOfPaymentMethod);
                item.SubItems.Add(paymentMethod.Description);

                _listViewPaymentMethods.Items.Add(item);
            }
        }
        
        private void AddButtonClick(object sender, EventArgs e)
        {
            var addPaymentMethodForm = new PaymentMethodAddEdit(_paymentMethods);
            addPaymentMethodForm.ShowDialog();

            DisplayPaymentMethods();
        }

        private void EditButtonClick(object sender, EventArgs e)
        {
            if (SomePaymentMethodSelected())
            {
                EditPaymentMethod();
            }
            else
            {
                MessageBox.Show(GetString("needToSelectPaymentMethod"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private bool SomePaymentMethodSelected()
        {
            return _listViewPaymentMethods.SelectedItems.Count != 0;
        }
        
        private void EditPaymentMethod()
        {
            EditSelectedEntryFee();

            DisplayPaymentMethods();
        }

        private void EditSelectedEntryFee()
        {
            var firstSelectedPaymentMethod = GetFirstSelectedPaymentMethod();
            var editPaymentMethodForm = new PaymentMethodAddEdit(firstSelectedPaymentMethod, _paymentMethods);
            editPaymentMethodForm.ShowDialog();
        }

        private AccountingPaymentMethod GetFirstSelectedPaymentMethod()
        {
            return (AccountingPaymentMethod)_listViewPaymentMethods.SelectedItems[0].Tag;
        }

        private void DoubleClickToListView(object sender, MouseEventArgs e)
        {
            EditSelectedEntryFee();

            DisplayPaymentMethods();
        }

        private void DeleteButtonClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
        private void CloseButtonClick(object sender, EventArgs e)
        {
            Close();
        }
    }
}
