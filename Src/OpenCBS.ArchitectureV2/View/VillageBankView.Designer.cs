namespace OpenCBS.ArchitectureV2.View
{
    partial class VillageBankView
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(VillageBankView));
            this._tabList = new Cyotek.Windows.Forms.TabList();
            this._detailsPage = new Cyotek.Windows.Forms.TabListPage();
            this._nameTextBox = new System.Windows.Forms.TextBox();
            this._nameLabel = new System.Windows.Forms.Label();
            this._membersPage = new Cyotek.Windows.Forms.TabListPage();
            this._membersListView = new BrightIdeasSoftware.FastObjectListView();
            this._memberFirstNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._memberLastNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._memberPassportColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._memberLoanCycleColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._memberActiveColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loansPage = new Cyotek.Windows.Forms.TabListPage();
            this._loansListView = new BrightIdeasSoftware.FastObjectListView();
            this._loanFirstNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanLastNameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanContractCodeColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanStatusColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanAmountColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanOlbColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanProductColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanFrequencyColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loanDurationColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._loansToolStrip = new System.Windows.Forms.ToolStrip();
            this._repayButton = new System.Windows.Forms.ToolStripButton();
            this._tabList.SuspendLayout();
            this._detailsPage.SuspendLayout();
            this._membersPage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this._membersListView)).BeginInit();
            this._loansPage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this._loansListView)).BeginInit();
            this._loansToolStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // _tabList
            // 
            resources.ApplyResources(this._tabList, "_tabList");
            this._tabList.Controls.Add(this._detailsPage);
            this._tabList.Controls.Add(this._membersPage);
            this._tabList.Controls.Add(this._loansPage);
            this._tabList.Name = "_tabList";
            // 
            // _detailsPage
            // 
            resources.ApplyResources(this._detailsPage, "_detailsPage");
            this._detailsPage.Controls.Add(this._nameTextBox);
            this._detailsPage.Controls.Add(this._nameLabel);
            this._detailsPage.Name = "_detailsPage";
            // 
            // _nameTextBox
            // 
            resources.ApplyResources(this._nameTextBox, "_nameTextBox");
            this._nameTextBox.Name = "_nameTextBox";
            this._nameTextBox.ReadOnly = true;
            // 
            // _nameLabel
            // 
            resources.ApplyResources(this._nameLabel, "_nameLabel");
            this._nameLabel.Name = "_nameLabel";
            // 
            // _membersPage
            // 
            resources.ApplyResources(this._membersPage, "_membersPage");
            this._membersPage.Controls.Add(this._membersListView);
            this._membersPage.Name = "_membersPage";
            // 
            // _membersListView
            // 
            resources.ApplyResources(this._membersListView, "_membersListView");
            this._membersListView.AllColumns.Add(this._memberFirstNameColumn);
            this._membersListView.AllColumns.Add(this._memberLastNameColumn);
            this._membersListView.AllColumns.Add(this._memberPassportColumn);
            this._membersListView.AllColumns.Add(this._memberLoanCycleColumn);
            this._membersListView.AllColumns.Add(this._memberActiveColumn);
            this._membersListView.AlternateRowBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(240)))), ((int)(((byte)(240)))));
            this._membersListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this._memberFirstNameColumn,
            this._memberLastNameColumn,
            this._memberPassportColumn,
            this._memberLoanCycleColumn,
            this._memberActiveColumn});
            this._membersListView.FullRowSelect = true;
            this._membersListView.GridLines = true;
            this._membersListView.MultiSelect = false;
            this._membersListView.Name = "_membersListView";
            this._membersListView.OverlayText.Text = resources.GetString("resource.Text");
            this._membersListView.ShowGroups = false;
            this._membersListView.UseAlternatingBackColors = true;
            this._membersListView.UseCompatibleStateImageBehavior = false;
            this._membersListView.View = System.Windows.Forms.View.Details;
            this._membersListView.VirtualMode = true;
            // 
            // _memberFirstNameColumn
            // 
            this._memberFirstNameColumn.AspectName = "FirstName";
            resources.ApplyResources(this._memberFirstNameColumn, "_memberFirstNameColumn");
            // 
            // _memberLastNameColumn
            // 
            this._memberLastNameColumn.AspectName = "LastName";
            resources.ApplyResources(this._memberLastNameColumn, "_memberLastNameColumn");
            // 
            // _memberPassportColumn
            // 
            this._memberPassportColumn.AspectName = "Passport";
            resources.ApplyResources(this._memberPassportColumn, "_memberPassportColumn");
            // 
            // _memberLoanCycleColumn
            // 
            this._memberLoanCycleColumn.AspectName = "LoanCycle";
            resources.ApplyResources(this._memberLoanCycleColumn, "_memberLoanCycleColumn");
            this._memberLoanCycleColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _memberActiveColumn
            // 
            this._memberActiveColumn.AspectName = "Active";
            resources.ApplyResources(this._memberActiveColumn, "_memberActiveColumn");
            this._memberActiveColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _loansPage
            // 
            resources.ApplyResources(this._loansPage, "_loansPage");
            this._loansPage.Controls.Add(this._loansListView);
            this._loansPage.Controls.Add(this._loansToolStrip);
            this._loansPage.Name = "_loansPage";
            // 
            // _loansListView
            // 
            resources.ApplyResources(this._loansListView, "_loansListView");
            this._loansListView.AllColumns.Add(this._loanFirstNameColumn);
            this._loansListView.AllColumns.Add(this._loanLastNameColumn);
            this._loansListView.AllColumns.Add(this._loanContractCodeColumn);
            this._loansListView.AllColumns.Add(this._loanStatusColumn);
            this._loansListView.AllColumns.Add(this._loanAmountColumn);
            this._loansListView.AllColumns.Add(this._loanOlbColumn);
            this._loansListView.AllColumns.Add(this._loanProductColumn);
            this._loansListView.AllColumns.Add(this._loanFrequencyColumn);
            this._loansListView.AllColumns.Add(this._loanDurationColumn);
            this._loansListView.AlternateRowBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(240)))), ((int)(((byte)(240)))));
            this._loansListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this._loanFirstNameColumn,
            this._loanLastNameColumn,
            this._loanContractCodeColumn,
            this._loanStatusColumn,
            this._loanAmountColumn,
            this._loanOlbColumn,
            this._loanProductColumn,
            this._loanFrequencyColumn,
            this._loanDurationColumn});
            this._loansListView.FullRowSelect = true;
            this._loansListView.GridLines = true;
            this._loansListView.MultiSelect = false;
            this._loansListView.Name = "_loansListView";
            this._loansListView.OverlayText.Text = resources.GetString("resource.Text1");
            this._loansListView.ShowGroups = false;
            this._loansListView.UseAlternatingBackColors = true;
            this._loansListView.UseCompatibleStateImageBehavior = false;
            this._loansListView.View = System.Windows.Forms.View.Details;
            this._loansListView.VirtualMode = true;
            // 
            // _loanFirstNameColumn
            // 
            this._loanFirstNameColumn.AspectName = "FirstName";
            resources.ApplyResources(this._loanFirstNameColumn, "_loanFirstNameColumn");
            // 
            // _loanLastNameColumn
            // 
            this._loanLastNameColumn.AspectName = "LastName";
            resources.ApplyResources(this._loanLastNameColumn, "_loanLastNameColumn");
            // 
            // _loanContractCodeColumn
            // 
            this._loanContractCodeColumn.AspectName = "ContractCode";
            resources.ApplyResources(this._loanContractCodeColumn, "_loanContractCodeColumn");
            // 
            // _loanStatusColumn
            // 
            this._loanStatusColumn.AspectName = "Status";
            resources.ApplyResources(this._loanStatusColumn, "_loanStatusColumn");
            this._loanStatusColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _loanAmountColumn
            // 
            this._loanAmountColumn.AspectName = "Amount";
            resources.ApplyResources(this._loanAmountColumn, "_loanAmountColumn");
            this._loanAmountColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _loanOlbColumn
            // 
            this._loanOlbColumn.AspectName = "Olb";
            resources.ApplyResources(this._loanOlbColumn, "_loanOlbColumn");
            this._loanOlbColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // _loanProductColumn
            // 
            this._loanProductColumn.AspectName = "LoanProductName";
            resources.ApplyResources(this._loanProductColumn, "_loanProductColumn");
            // 
            // _loanFrequencyColumn
            // 
            this._loanFrequencyColumn.AspectName = "InstallmentTypeName";
            resources.ApplyResources(this._loanFrequencyColumn, "_loanFrequencyColumn");
            this._loanFrequencyColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _loanDurationColumn
            // 
            this._loanDurationColumn.AspectName = "Duration";
            resources.ApplyResources(this._loanDurationColumn, "_loanDurationColumn");
            this._loanDurationColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // _loansToolStrip
            // 
            resources.ApplyResources(this._loansToolStrip, "_loansToolStrip");
            this._loansToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this._repayButton});
            this._loansToolStrip.Name = "_loansToolStrip";
            // 
            // _repayButton
            // 
            resources.ApplyResources(this._repayButton, "_repayButton");
            this._repayButton.Name = "_repayButton";
            // 
            // VillageBankView
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this._tabList);
            this.Name = "VillageBankView";
            this._tabList.ResumeLayout(false);
            this._detailsPage.ResumeLayout(false);
            this._detailsPage.PerformLayout();
            this._membersPage.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this._membersListView)).EndInit();
            this._loansPage.ResumeLayout(false);
            this._loansPage.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this._loansListView)).EndInit();
            this._loansToolStrip.ResumeLayout(false);
            this._loansToolStrip.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private Cyotek.Windows.Forms.TabList _tabList;
        private Cyotek.Windows.Forms.TabListPage _detailsPage;
        private Cyotek.Windows.Forms.TabListPage _membersPage;
        private Cyotek.Windows.Forms.TabListPage _loansPage;
        private BrightIdeasSoftware.FastObjectListView _membersListView;
        private BrightIdeasSoftware.OLVColumn _memberFirstNameColumn;
        private BrightIdeasSoftware.OLVColumn _memberLastNameColumn;
        private BrightIdeasSoftware.OLVColumn _memberPassportColumn;
        private BrightIdeasSoftware.OLVColumn _memberLoanCycleColumn;
        private BrightIdeasSoftware.OLVColumn _memberActiveColumn;
        private System.Windows.Forms.Label _nameLabel;
        private System.Windows.Forms.TextBox _nameTextBox;
        private BrightIdeasSoftware.FastObjectListView _loansListView;
        private BrightIdeasSoftware.OLVColumn _loanFirstNameColumn;
        private BrightIdeasSoftware.OLVColumn _loanLastNameColumn;
        private BrightIdeasSoftware.OLVColumn _loanContractCodeColumn;
        private BrightIdeasSoftware.OLVColumn _loanStatusColumn;
        private BrightIdeasSoftware.OLVColumn _loanAmountColumn;
        private BrightIdeasSoftware.OLVColumn _loanProductColumn;
        private BrightIdeasSoftware.OLVColumn _loanFrequencyColumn;
        private BrightIdeasSoftware.OLVColumn _loanDurationColumn;
        private BrightIdeasSoftware.OLVColumn _loanOlbColumn;
        private System.Windows.Forms.ToolStrip _loansToolStrip;
        private System.Windows.Forms.ToolStripButton _repayButton;
    }
}