// Octopus MFS is an integrated suite for managing a Micro Finance Institution: 
// clients, contracts, accounting, reporting and risk
// Copyright © 2006,2007 OCTO Technology & OXUS Development Network
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
// Website: http://www.opencbs.com
// Contact: contact@opencbs.com

using System;
using System.Collections.Generic;
using System.Diagnostics;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting;
using OpenCBS.ExceptionsHandler;
using OpenCBS.GUI.UserControl;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Presenter;
using OpenCBS.Services;
using AccountingPaymentMethod = OpenCBS.CoreDomain.Accounting.PaymentMethod;

namespace OpenCBS.GUI.Configuration
{
    public partial class AddBranchForm : SweetOkCancelForm
    {
        public bool IsNew { get; set; }
        public Branch Branch { get; set; }
        private string tempName;
        private string tempCode;
        private string tempAddress;
        private string tempDescription;
        public bool EditBranch;
        private TranslationService _translationService;

        public AddBranchForm(bool editBranch)
        {
            EditBranch = editBranch;
            InitializeComponent();
        }

        private void CheckName()
        {
            SetOkButtonEnabled(tbName.Text.Length > 0);
        }

        private void tbName_TextChanged(object sender, System.EventArgs e)
        {
            CheckName();
        }

        private void AddBranchForm_Load(object sender, System.EventArgs e)
        {
            Debug.Assert(Branch != null, "Branch is null");
            Text = IsNew ? GetString("add") : GetString("edit");
            if (IsNew)
            {
                tabControl.TabPages.Remove(tabPageAddPaymentMethod);
            }
            tempName = Branch.Name;
            tempCode = Branch.Code;
            tempAddress = Branch.Address;
            tempDescription = Branch.Description;
            tbName.Text = Branch.Name;
            tbCode.Text = Branch.Code;
            tbAddress.Text = Branch.Address;
            tbDescription.Text = Branch.Description;
            
            LoadPaymentMethods();

            _translationService = new TranslationService();
            _translationService.Reload();


        }

        private void AddBranchForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult.OK != DialogResult) return;

            Branch.Name = tbName.Text;
            Branch.Code = tbCode.Text;
            Branch.Address = tbAddress.Text;
            Branch.Description = tbDescription.Text;
            if (Branch.Name != null)
                Branch.Name = Branch.Name.Trim();
            if (Branch.Code != null)
                Branch.Code = Branch.Code.Trim();
            if (Branch.Address != null)
                Branch.Address = Branch.Address.Trim();
            try
            {
                if (IsNew)
                {
                    ServicesProvider.GetInstance().GetBranchService().Add(Branch);
                }
                else
                {
                    ServicesProvider.GetInstance().GetBranchService().Update(Branch, tempName, tempCode, tempAddress, tempDescription);
                }
            }
            catch (Exception ex)
            {
                new frmShowError(CustomExceptionHandler.ShowExceptionText(ex)).ShowDialog();
                e.Cancel = true;
            }
        }

        public void LoadPaymentMethods()
        {
            lvPaymentMethods.Items.Clear();
            List<AccountingPaymentMethod> methods =
                ServicesProvider.GetInstance().GetPaymentMethodServices().GetAllPaymentMethodsOfBranch(Branch.Id);
            foreach (AccountingPaymentMethod method in methods)
            {
                method.Account =
                    ServicesProvider.GetInstance().GetAccountService().SelectAccountByNumber(method.AccountNumber);
                ListViewItem lvi = new ListViewItem { Tag = method };
                lvi.UseItemStyleForSubItems = false;
                lvi.SubItems.Add(method.Name);
                lvi.SubItems.Add(GetAccountNumber(method));
                lvPaymentMethods.Items.Add(lvi);
            }
        }

        private void btnAddPaymentMethod_Click(object sender, EventArgs e)
        {
            AddPaymentMethodForm frm = new AddPaymentMethodForm(Branch);
            if (DialogResult.OK != frm.ShowDialog()) return;
            try
            {
                var paymentMethodServices = ServicesProvider.GetInstance().GetPaymentMethodServices();
                if (!paymentMethodServices.ExistsLinkBranchesPaymentMethods(frm.PaymentMethod))
                    paymentMethodServices.AddPaymentMethodToBranch(frm.PaymentMethod);
                else
                    throw new OpenCbsException(_translationService.Translate("The same payment method already exists."));

            }
            catch (Exception ex)
            {
                new frmShowError(CustomExceptionHandler.ShowExceptionText(ex)).ShowDialog();
            }
            LoadPaymentMethods();
        }

        private void btnDeletePaymentMethod_Click(object sender, EventArgs e)
        {
            if (lvPaymentMethods.SelectedItems.Count == 0)
                return;
            AccountingPaymentMethod paymentMethod = lvPaymentMethods.SelectedItems[0].Tag as AccountingPaymentMethod;
            Debug.Assert(paymentMethod != null, "Payment method not selected!");
            if (!Confirm("confirmDelete")) return;
            {
                ServicesProvider.GetInstance().GetPaymentMethodServices().Delete(paymentMethod);
                ServicesProvider.GetInstance().GetBranchService().RefreshBranches();
            }
            
            LoadPaymentMethods();
        }

        private void btnEditPaymentMethod_Click(object sender, EventArgs e)
        {
            if (lvPaymentMethods.SelectedItems.Count == 0)
                return;
            AccountingPaymentMethod paymentMethod = (AccountingPaymentMethod)lvPaymentMethods.SelectedItems[0].Tag;
            Debug.Assert(paymentMethod != null, "Payment method not selected!");
            AddPaymentMethodForm frm = new AddPaymentMethodForm(paymentMethod);
            if (DialogResult.OK != frm.ShowDialog()) return;
            try
            {
                var paymentMethodServices = ServicesProvider.GetInstance().GetPaymentMethodServices();
                if (!paymentMethodServices.ExistsLinkBranchesPaymentMethods(frm.PaymentMethod))
                    paymentMethodServices.UpdatePaymentMethodFromBranch(frm.PaymentMethod);
                else
                    throw new OpenCbsException(_translationService.Translate("The same payment method already exists."));
            }
            catch(Exception ex)
            {
                new frmShowError(CustomExceptionHandler.ShowExceptionText(ex)).ShowDialog();
            }
            LoadPaymentMethods();
        }
        private string GetAccountNumber(AccountingPaymentMethod paymentMethod)
        {
            if (paymentMethod == null || paymentMethod.Account == null) return "";
            return string.Format("{0} - {1}", paymentMethod.Account.AccountNumber, paymentMethod.Account.Label);
        }
    }
    public class TablessControl : TabControl
    {
        public bool Condition;

        public TablessControl(bool condition)
        {
            Condition = condition;
        }

        protected override void WndProc(ref Message m)
        {
            if (Condition)
            {
                base.WndProc(ref m);
                return;
            }

            // Hide tabs by trapping the TCM_ADJUSTRECT message
            if (m.Msg == 0x1328 && !DesignMode) m.Result = (IntPtr)1;
            else base.WndProc(ref m);
        }
    }
}
