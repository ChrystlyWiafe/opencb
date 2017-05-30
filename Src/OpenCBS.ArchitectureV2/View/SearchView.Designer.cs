namespace OpenCBS.ArchitectureV2.View
{
    partial class SearchView
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SearchView));
            this._searchTextBox = new System.Windows.Forms.TextBox();
            this._searchPanel = new System.Windows.Forms.Panel();
            this._searchResultsListView = new BrightIdeasSoftware.FastObjectListView();
            this._typeColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._nameColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._activeColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._districtColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._cityColumn = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this._searchPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this._searchResultsListView)).BeginInit();
            this.SuspendLayout();
            // 
            // _searchTextBox
            // 
            resources.ApplyResources(this._searchTextBox, "_searchTextBox");
            this._searchTextBox.Name = "_searchTextBox";
            // 
            // _searchPanel
            // 
            this._searchPanel.Controls.Add(this._searchTextBox);
            resources.ApplyResources(this._searchPanel, "_searchPanel");
            this._searchPanel.Name = "_searchPanel";
            // 
            // _searchResultsListView
            // 
            this._searchResultsListView.AllColumns.Add(this._typeColumn);
            this._searchResultsListView.AllColumns.Add(this._nameColumn);
            this._searchResultsListView.AllColumns.Add(this._activeColumn);
            this._searchResultsListView.AllColumns.Add(this._districtColumn);
            this._searchResultsListView.AllColumns.Add(this._cityColumn);
            this._searchResultsListView.AlternateRowBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(240)))), ((int)(((byte)(240)))));
            this._searchResultsListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this._typeColumn,
            this._nameColumn,
            this._activeColumn,
            this._districtColumn,
            this._cityColumn});
            resources.ApplyResources(this._searchResultsListView, "_searchResultsListView");
            this._searchResultsListView.FullRowSelect = true;
            this._searchResultsListView.GridLines = true;
            this._searchResultsListView.MultiSelect = false;
            this._searchResultsListView.Name = "_searchResultsListView";
            this._searchResultsListView.ShowGroups = false;
            this._searchResultsListView.UseAlternatingBackColors = true;
            this._searchResultsListView.UseCompatibleStateImageBehavior = false;
            this._searchResultsListView.View = System.Windows.Forms.View.Details;
            this._searchResultsListView.VirtualMode = true;
            // 
            // _typeColumn
            // 
            this._typeColumn.AspectName = "Type";
            resources.ApplyResources(this._typeColumn, "_typeColumn");
            // 
            // _nameColumn
            // 
            this._nameColumn.AspectName = "Name";
            resources.ApplyResources(this._nameColumn, "_nameColumn");
            // 
            // _activeColumn
            // 
            this._activeColumn.AspectName = "Active";
            this._activeColumn.HeaderTextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            resources.ApplyResources(this._activeColumn, "_activeColumn");
            // 
            // _districtColumn
            // 
            this._districtColumn.AspectName = "District";
            resources.ApplyResources(this._districtColumn, "_districtColumn");
            // 
            // _cityColumn
            // 
            this._cityColumn.AspectName = "City";
            resources.ApplyResources(this._cityColumn, "_cityColumn");
            // 
            // SearchView
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this._searchResultsListView);
            this.Controls.Add(this._searchPanel);
            this.Name = "SearchView";
            this._searchPanel.ResumeLayout(false);
            this._searchPanel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this._searchResultsListView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox _searchTextBox;
        private System.Windows.Forms.Panel _searchPanel;
        private BrightIdeasSoftware.FastObjectListView _searchResultsListView;
        private BrightIdeasSoftware.OLVColumn _typeColumn;
        private BrightIdeasSoftware.OLVColumn _nameColumn;
        private BrightIdeasSoftware.OLVColumn _activeColumn;
        private BrightIdeasSoftware.OLVColumn _districtColumn;
        private BrightIdeasSoftware.OLVColumn _cityColumn;
    }
}