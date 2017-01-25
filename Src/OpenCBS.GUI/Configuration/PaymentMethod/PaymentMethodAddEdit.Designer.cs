namespace OpenCBS.GUI.Configuration.PaymentMethod
{
    partial class PaymentMethodAddEdit
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PaymentMethodAddEdit));
            this._buttonSave = new System.Windows.Forms.Button();
            this._labelDescription = new System.Windows.Forms.Label();
            this._labelName = new System.Windows.Forms.Label();
            this._textBoxName = new System.Windows.Forms.TextBox();
            this._labelId = new System.Windows.Forms.Label();
            this._textBoxId = new System.Windows.Forms.TextBox();
            this._descriptionRichTextBox = new System.Windows.Forms.RichTextBox();
            this._labelError = new System.Windows.Forms.Label();
            this._comboBoxAccounts = new OpenCBS.View.UserControl.AutocompletionComboBox.AutocompletionComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // _buttonSave
            // 
            resources.ApplyResources(this._buttonSave, "_buttonSave");
            this._buttonSave.Name = "_buttonSave";
            this._buttonSave.UseVisualStyleBackColor = true;
            this._buttonSave.Click += new System.EventHandler(this.SaveButtonClick);
            // 
            // _labelDescription
            // 
            resources.ApplyResources(this._labelDescription, "_labelDescription");
            this._labelDescription.Name = "_labelDescription";
            // 
            // _labelName
            // 
            resources.ApplyResources(this._labelName, "_labelName");
            this._labelName.Name = "_labelName";
            // 
            // _textBoxName
            // 
            resources.ApplyResources(this._textBoxName, "_textBoxName");
            this._textBoxName.Name = "_textBoxName";
            this._textBoxName.TextChanged += new System.EventHandler(this.PaymentMethodChanged);
            // 
            // _labelId
            // 
            resources.ApplyResources(this._labelId, "_labelId");
            this._labelId.Name = "_labelId";
            // 
            // _textBoxId
            // 
            resources.ApplyResources(this._textBoxId, "_textBoxId");
            this._textBoxId.Name = "_textBoxId";
            // 
            // _descriptionRichTextBox
            // 
            resources.ApplyResources(this._descriptionRichTextBox, "_descriptionRichTextBox");
            this._descriptionRichTextBox.Name = "_descriptionRichTextBox";
            this._descriptionRichTextBox.TextChanged += new System.EventHandler(this.PaymentMethodChanged);
            // 
            // _labelError
            // 
            resources.ApplyResources(this._labelError, "_labelError");
            this._labelError.ForeColor = System.Drawing.SystemColors.GrayText;
            this._labelError.Name = "_labelError";
            // 
            // _comboBoxAccounts
            // 
            this._comboBoxAccounts.FormattingEnabled = true;
            resources.ApplyResources(this._comboBoxAccounts, "_comboBoxAccounts");
            this._comboBoxAccounts.Name = "_comboBoxAccounts";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            // 
            // PaymentMethodAddEdit
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label1);
            this.Controls.Add(this._comboBoxAccounts);
            this.Controls.Add(this._labelError);
            this.Controls.Add(this._descriptionRichTextBox);
            this.Controls.Add(this._buttonSave);
            this.Controls.Add(this._labelDescription);
            this.Controls.Add(this._labelName);
            this.Controls.Add(this._textBoxName);
            this.Controls.Add(this._labelId);
            this.Controls.Add(this._textBoxId);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "PaymentMethodAddEdit";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button _buttonSave;
        private System.Windows.Forms.Label _labelDescription;
        private System.Windows.Forms.Label _labelName;
        private System.Windows.Forms.TextBox _textBoxName;
        private System.Windows.Forms.Label _labelId;
        private System.Windows.Forms.TextBox _textBoxId;
        private System.Windows.Forms.RichTextBox _descriptionRichTextBox;
        private System.Windows.Forms.Label _labelError;
        private View.UserControl.AutocompletionComboBox.AutocompletionComboBox _comboBoxAccounts;
        private System.Windows.Forms.Label label1;
    }
}