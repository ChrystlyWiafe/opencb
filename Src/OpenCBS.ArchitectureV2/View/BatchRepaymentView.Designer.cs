namespace OpenCBS.ArchitectureV2.View
{
    partial class BatchRepaymentView
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BatchRepaymentView));
            this._loansListView = new BrightIdeasSoftware.FastObjectListView();
            this._firstNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._lastNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._contractCodeColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._principalColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._interestColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._expectedDateColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._totalColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._receiptNumber = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._comment = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._buttonsPanel = new System.Windows.Forms.Panel();
            this.labelPaymentMethod = new System.Windows.Forms.Label();
            this.cmbPaymentMethod = new System.Windows.Forms.ComboBox();
            this._cancelButton = new System.Windows.Forms.Button();
            this._okButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this._loansListView)).BeginInit();
            this._buttonsPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // _loansListView
            // 
            resources.ApplyResources(this._loansListView, "_loansListView");
            this._loansListView.AllColumns.Add(this._firstNameColumn);
            this._loansListView.AllColumns.Add(this._lastNameColumn);
            this._loansListView.AllColumns.Add(this._contractCodeColumn);
            this._loansListView.AllColumns.Add(this._principalColumn);
            this._loansListView.AllColumns.Add(this._interestColumn);
            this._loansListView.AllColumns.Add(this._expectedDateColumn);
            this._loansListView.AllColumns.Add(this._totalColumn);
            this._loansListView.AllColumns.Add(this._receiptNumber);
            this._loansListView.AllColumns.Add(this._comment);
            this._loansListView.AlternateRowBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(240)))), ((int)(((byte)(240)))));
            this._loansListView.CellEditActivation = BrightIdeasSoftware.ObjectListView.CellEditActivateMode.DoubleClick;
            this._loansListView.CheckedAspectName = "Selected";
            this._loansListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this._firstNameColumn,
            this._lastNameColumn,
            this._contractCodeColumn,
            this._principalColumn,
            this._interestColumn,
            this._expectedDateColumn,
            this._totalColumn,
            this._receiptNumber,
            this._comment});
            this._loansListView.FullRowSelect = true;
            this._loansListView.GridLines = true;
            this._loansListView.MultiSelect = false;
            this._loansListView.Name = "_loansListView";
            this._loansListView.OverlayText.Text = resources.GetString("resource.Text");
            this._loansListView.ShowGroups = false;
            this._loansListView.ShowImagesOnSubItems = true;
            this._loansListView.UseCompatibleStateImageBehavior = false;
            this._loansListView.View = System.Windows.Forms.View.Details;
            this._loansListView.VirtualMode = true;
            // 
            // _firstNameColumn
            // 
            this._firstNameColumn.AspectName = "FirstName";
            resources.ApplyResources(this._firstNameColumn, "_firstNameColumn");
            this._firstNameColumn.IsEditable = false;
            this._firstNameColumn.Sortable = false;
            // 
            // _lastNameColumn
            // 
            this._lastNameColumn.AspectName = "LastName";
            resources.ApplyResources(this._lastNameColumn, "_lastNameColumn");
            this._lastNameColumn.IsEditable = false;
            this._lastNameColumn.Sortable = false;
            // 
            // _contractCodeColumn
            // 
            this._contractCodeColumn.AspectName = "ContractCode";
            resources.ApplyResources(this._contractCodeColumn, "_contractCodeColumn");
            this._contractCodeColumn.IsEditable = false;
            this._contractCodeColumn.Sortable = false;
            // 
            // _principalColumn
            // 
            this._principalColumn.AspectName = "Principal";
            resources.ApplyResources(this._principalColumn, "_principalColumn");
            this._principalColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this._principalColumn.IsEditable = false;
            this._principalColumn.Sortable = false;
            // 
            // _interestColumn
            // 
            this._interestColumn.AspectName = "Interest";
            resources.ApplyResources(this._interestColumn, "_interestColumn");
            this._interestColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this._interestColumn.IsEditable = false;
            this._interestColumn.Sortable = false;
            // 
            // _expectedDateColumn
            // 
            this._expectedDateColumn.AspectName = "ExpectedDate";
            resources.ApplyResources(this._expectedDateColumn, "_expectedDateColumn");
            this._expectedDateColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this._expectedDateColumn.IsEditable = false;
            this._expectedDateColumn.Sortable = false;
            // 
            // _totalColumn
            // 
            this._totalColumn.AspectName = "Total";
            resources.ApplyResources(this._totalColumn, "_totalColumn");
            this._totalColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this._totalColumn.Sortable = false;
            // 
            // _receiptNumber
            // 
            this._receiptNumber.AspectName = "ReceiptNumber";
            resources.ApplyResources(this._receiptNumber, "_receiptNumber");
            // 
            // _comment
            // 
            this._comment.AspectName = "Comment";
            resources.ApplyResources(this._comment, "_comment");
            // 
            // _buttonsPanel
            // 
            resources.ApplyResources(this._buttonsPanel, "_buttonsPanel");
            this._buttonsPanel.Controls.Add(this.labelPaymentMethod);
            this._buttonsPanel.Controls.Add(this.cmbPaymentMethod);
            this._buttonsPanel.Controls.Add(this._cancelButton);
            this._buttonsPanel.Controls.Add(this._okButton);
            this._buttonsPanel.Name = "_buttonsPanel";
            // 
            // labelPaymentMethod
            // 
            resources.ApplyResources(this.labelPaymentMethod, "labelPaymentMethod");
            this.labelPaymentMethod.Name = "labelPaymentMethod";
            // 
            // cmbPaymentMethod
            // 
            resources.ApplyResources(this.cmbPaymentMethod, "cmbPaymentMethod");
            this.cmbPaymentMethod.DisplayMember = "Name";
            this.cmbPaymentMethod.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPaymentMethod.FormattingEnabled = true;
            this.cmbPaymentMethod.Name = "cmbPaymentMethod";
            // 
            // _cancelButton
            // 
            resources.ApplyResources(this._cancelButton, "_cancelButton");
            this._cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this._cancelButton.Name = "_cancelButton";
            this._cancelButton.UseVisualStyleBackColor = true;
            // 
            // _okButton
            // 
            resources.ApplyResources(this._okButton, "_okButton");
            this._okButton.Name = "_okButton";
            this._okButton.UseVisualStyleBackColor = true;
            // 
            // BatchRepaymentView
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this._cancelButton;
            this.Controls.Add(this._loansListView);
            this.Controls.Add(this._buttonsPanel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BatchRepaymentView";
            ((System.ComponentModel.ISupportInitialize)(this._loansListView)).EndInit();
            this._buttonsPanel.ResumeLayout(false);
            this._buttonsPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private BrightIdeasSoftware.FastObjectListView _loansListView;
        private BrightIdeasSoftware.OLVColumn _firstNameColumn;
        private BrightIdeasSoftware.OLVColumn _lastNameColumn;
        private BrightIdeasSoftware.OLVColumn _contractCodeColumn;
        private BrightIdeasSoftware.OLVColumn _principalColumn;
        private BrightIdeasSoftware.OLVColumn _interestColumn;
        private BrightIdeasSoftware.OLVColumn _totalColumn;
        private System.Windows.Forms.Panel _buttonsPanel;
        private System.Windows.Forms.Button _cancelButton;
        private System.Windows.Forms.Button _okButton;
        private BrightIdeasSoftware.OLVColumn _receiptNumber;
        private BrightIdeasSoftware.OLVColumn _comment;
        private BrightIdeasSoftware.OLVColumn _expectedDateColumn;
        private System.Windows.Forms.ComboBox cmbPaymentMethod;
        private System.Windows.Forms.Label labelPaymentMethod;
    }
}