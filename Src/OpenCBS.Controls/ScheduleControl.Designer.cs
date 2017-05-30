namespace OpenCBS.Controls
{
    partial class ScheduleControl
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ScheduleControl));
            this.scheduleObjectListView = new BrightIdeasSoftware.ObjectListView();
            this.numberColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.dateColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.interestColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.extraColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.principalColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.totalColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olbColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.paidInterestColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.paidExtraColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.paidPrincipalColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.paymentDateColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.lateDaysColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.commentColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.extra_amount_1 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.extra_amount_2 = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._scheduleContextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuItemCopy = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.scheduleObjectListView)).BeginInit();
            this._scheduleContextMenuStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // scheduleObjectListView
            // 
            resources.ApplyResources(this.scheduleObjectListView, "scheduleObjectListView");
            this.scheduleObjectListView.AllColumns.Add(this.numberColumn);
            this.scheduleObjectListView.AllColumns.Add(this.dateColumn);
            this.scheduleObjectListView.AllColumns.Add(this.interestColumn);
            this.scheduleObjectListView.AllColumns.Add(this.extraColumn);
            this.scheduleObjectListView.AllColumns.Add(this.principalColumn);
            this.scheduleObjectListView.AllColumns.Add(this.totalColumn);
            this.scheduleObjectListView.AllColumns.Add(this.olbColumn);
            this.scheduleObjectListView.AllColumns.Add(this.paidInterestColumn);
            this.scheduleObjectListView.AllColumns.Add(this.paidExtraColumn);
            this.scheduleObjectListView.AllColumns.Add(this.paidPrincipalColumn);
            this.scheduleObjectListView.AllColumns.Add(this.paymentDateColumn);
            this.scheduleObjectListView.AllColumns.Add(this.lateDaysColumn);
            this.scheduleObjectListView.AllColumns.Add(this.commentColumn);
            this.scheduleObjectListView.AllColumns.Add(this.extra_amount_1);
            this.scheduleObjectListView.AllColumns.Add(this.extra_amount_2);
            this.scheduleObjectListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.numberColumn,
            this.dateColumn,
            this.interestColumn,
            this.extraColumn,
            this.principalColumn,
            this.totalColumn,
            this.olbColumn,
            this.paidInterestColumn,
            this.paidExtraColumn,
            this.paidPrincipalColumn,
            this.paymentDateColumn,
            this.lateDaysColumn,
            this.commentColumn,
            this.extra_amount_1,
            this.extra_amount_2});
            this.scheduleObjectListView.ContextMenuStrip = this._scheduleContextMenuStrip;
            this.scheduleObjectListView.Cursor = System.Windows.Forms.Cursors.Default;
            this.scheduleObjectListView.FullRowSelect = true;
            this.scheduleObjectListView.GridLines = true;
            this.scheduleObjectListView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.scheduleObjectListView.HeaderWordWrap = true;
            this.scheduleObjectListView.MultiSelect = false;
            this.scheduleObjectListView.Name = "scheduleObjectListView";
            this.scheduleObjectListView.OverlayText.Text = resources.GetString("resource.Text");
            this.scheduleObjectListView.ShowGroups = false;
            this.scheduleObjectListView.UseCompatibleStateImageBehavior = false;
            this.scheduleObjectListView.View = System.Windows.Forms.View.Details;
            // 
            // numberColumn
            // 
            this.numberColumn.AspectName = "Number";
            resources.ApplyResources(this.numberColumn, "numberColumn");
            this.numberColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // dateColumn
            // 
            this.dateColumn.AspectName = "ExpectedDate";
            resources.ApplyResources(this.dateColumn, "dateColumn");
            this.dateColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // interestColumn
            // 
            this.interestColumn.AspectName = "InterestsRepayment";
            resources.ApplyResources(this.interestColumn, "interestColumn");
            this.interestColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // extraColumn
            // 
            this.extraColumn.AspectName = "Commission";
            resources.ApplyResources(this.extraColumn, "extraColumn");
            this.extraColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // principalColumn
            // 
            this.principalColumn.AspectName = "CapitalRepayment";
            resources.ApplyResources(this.principalColumn, "principalColumn");
            this.principalColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // totalColumn
            // 
            this.totalColumn.AspectName = "AmountHasToPayWithInterest";
            resources.ApplyResources(this.totalColumn, "totalColumn");
            this.totalColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // olbColumn
            // 
            this.olbColumn.AspectName = "OLB";
            resources.ApplyResources(this.olbColumn, "olbColumn");
            this.olbColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // paidInterestColumn
            // 
            this.paidInterestColumn.AspectName = "PaidInterests";
            resources.ApplyResources(this.paidInterestColumn, "paidInterestColumn");
            this.paidInterestColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // paidExtraColumn
            // 
            this.paidExtraColumn.AspectName = "PaidCommissions";
            resources.ApplyResources(this.paidExtraColumn, "paidExtraColumn");
            this.paidExtraColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // paidPrincipalColumn
            // 
            this.paidPrincipalColumn.AspectName = "PaidCapital";
            resources.ApplyResources(this.paidPrincipalColumn, "paidPrincipalColumn");
            this.paidPrincipalColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // paymentDateColumn
            // 
            this.paymentDateColumn.AspectName = "PaidDate";
            resources.ApplyResources(this.paymentDateColumn, "paymentDateColumn");
            this.paymentDateColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lateDaysColumn
            // 
            this.lateDaysColumn.AspectName = "LateDays";
            resources.ApplyResources(this.lateDaysColumn, "lateDaysColumn");
            this.lateDaysColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // commentColumn
            // 
            this.commentColumn.AspectName = "Comment";
            resources.ApplyResources(this.commentColumn, "commentColumn");
            this.commentColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // extra_amount_1
            // 
            this.extra_amount_1.AspectName = "ExtraAmount1";
            resources.ApplyResources(this.extra_amount_1, "extra_amount_1");
            this.extra_amount_1.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // extra_amount_2
            // 
            this.extra_amount_2.AspectName = "ExtraAmount2";
            resources.ApplyResources(this.extra_amount_2, "extra_amount_2");
            this.extra_amount_2.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // _scheduleContextMenuStrip
            // 
            resources.ApplyResources(this._scheduleContextMenuStrip, "_scheduleContextMenuStrip");
            this._scheduleContextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuItemCopy});
            this._scheduleContextMenuStrip.Name = "contextMenuStripCopyToClipBoard";
            // 
            // menuItemCopy
            // 
            resources.ApplyResources(this.menuItemCopy, "menuItemCopy");
            this.menuItemCopy.Name = "menuItemCopy";
            // 
            // ScheduleControl
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.scheduleObjectListView);
            this.Cursor = System.Windows.Forms.Cursors.Cross;
            this.Name = "ScheduleControl";
            ((System.ComponentModel.ISupportInitialize)(this.scheduleObjectListView)).EndInit();
            this._scheduleContextMenuStrip.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private BrightIdeasSoftware.ObjectListView scheduleObjectListView;
        private BrightIdeasSoftware.OLVColumn numberColumn;
        private BrightIdeasSoftware.OLVColumn dateColumn;
        private BrightIdeasSoftware.OLVColumn interestColumn;
        private BrightIdeasSoftware.OLVColumn principalColumn;
        private BrightIdeasSoftware.OLVColumn totalColumn;
        private BrightIdeasSoftware.OLVColumn olbColumn;
        private BrightIdeasSoftware.OLVColumn paidInterestColumn;
        private BrightIdeasSoftware.OLVColumn paidPrincipalColumn;
        private BrightIdeasSoftware.OLVColumn paymentDateColumn;
        private BrightIdeasSoftware.OLVColumn extraColumn;
        private BrightIdeasSoftware.OLVColumn paidExtraColumn;
        private BrightIdeasSoftware.OLVColumn lateDaysColumn;
        private BrightIdeasSoftware.OLVColumn commentColumn;
        private System.Windows.Forms.ContextMenuStrip _scheduleContextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem menuItemCopy;
        private BrightIdeasSoftware.OLVColumn extra_amount_1;
        private BrightIdeasSoftware.OLVColumn extra_amount_2;
    }
}
