using OpenCBS.GUI.UserControl;

namespace OpenCBS.GUI.Configuration
{
    partial class AddPaymentMethodForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AddPaymentMethodForm));
            this.lblPaymentMethod = new System.Windows.Forms.Label();
            this.cmbPaymentMethod = new System.Windows.Forms.ComboBox();
            this.lblAccountNumberTitle = new System.Windows.Forms.Label();
            this.lblAccountNumber = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblPaymentMethod
            // 
            resources.ApplyResources(this.lblPaymentMethod, "lblPaymentMethod");
            this.lblPaymentMethod.Name = "lblPaymentMethod";
            // 
            // cmbPaymentMethod
            // 
            resources.ApplyResources(this.cmbPaymentMethod, "cmbPaymentMethod");
            this.cmbPaymentMethod.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPaymentMethod.FormattingEnabled = true;
            this.cmbPaymentMethod.Name = "cmbPaymentMethod";
            this.cmbPaymentMethod.SelectedIndexChanged += new System.EventHandler(this.cmbPaymentMethod_SelectedIndexChanged);
            // 
            // lblAccountNumberTitle
            // 
            resources.ApplyResources(this.lblAccountNumberTitle, "lblAccountNumberTitle");
            this.lblAccountNumberTitle.Name = "lblAccountNumberTitle";
            // 
            // lblAccountNumber
            // 
            resources.ApplyResources(this.lblAccountNumber, "lblAccountNumber");
            this.lblAccountNumber.Name = "lblAccountNumber";
            // 
            // AddPaymentMethodForm
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lblAccountNumber);
            this.Controls.Add(this.lblAccountNumberTitle);
            this.Controls.Add(this.cmbPaymentMethod);
            this.Controls.Add(this.lblPaymentMethod);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AddPaymentMethodForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AddPaymentMethodForm_FormClosing);
            this.Load += new System.EventHandler(this.AddPaymentMethodForm_Load);
            this.Controls.SetChildIndex(this.lblPaymentMethod, 0);
            this.Controls.SetChildIndex(this.cmbPaymentMethod, 0);
            this.Controls.SetChildIndex(this.lblAccountNumberTitle, 0);
            this.Controls.SetChildIndex(this.lblAccountNumber, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblPaymentMethod;
        private System.Windows.Forms.ComboBox cmbPaymentMethod;
        private System.Windows.Forms.Label lblAccountNumberTitle;
        private System.Windows.Forms.Label lblAccountNumber;
    }
}