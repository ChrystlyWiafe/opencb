using System.Security.AccessControl;

namespace OpenCBS.ArchitectureV2.View
{
    partial class StartPageView
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StartPageView));
            this._searchClientsButton = new System.Windows.Forms.Button();
            this._newClientMenu = new System.Windows.Forms.ContextMenuStrip();
            this._newPersonItem = new System.Windows.Forms.ToolStripMenuItem();
            this._newGroupItem = new System.Windows.Forms.ToolStripMenuItem();
            this._newVillageBankItem = new System.Windows.Forms.ToolStripMenuItem();
            this._newCompanyItem = new System.Windows.Forms.ToolStripMenuItem();
            this._searchContractsButton = new System.Windows.Forms.Button();
            this._buttonPanel = new System.Windows.Forms.FlowLayoutPanel();
            this._newClientButton = new System.Windows.Forms.Button();
            this._linkPanel = new System.Windows.Forms.FlowLayoutPanel();
            this._siteLink = new System.Windows.Forms.LinkLabel();
            this.label1 = new System.Windows.Forms.Label();
            this._userGuideLink = new System.Windows.Forms.LinkLabel();
            this.label2 = new System.Windows.Forms.Label();
            this._forumLink = new System.Windows.Forms.LinkLabel();
            this.label3 = new System.Windows.Forms.Label();
            this._contactLink = new System.Windows.Forms.LinkLabel();
            this._languagePanel = new System.Windows.Forms.FlowLayoutPanel();
            this._englishPictureBox = new System.Windows.Forms.PictureBox();
            this._frenchPictureBox = new System.Windows.Forms.PictureBox();
            this._russianPictureBox = new System.Windows.Forms.PictureBox();
            this._spanishPictureBox = new System.Windows.Forms.PictureBox();
            this._portuguesePictureBox = new System.Windows.Forms.PictureBox();
            this._logoPictureBox = new System.Windows.Forms.PictureBox();
            this._newClientMenu.SuspendLayout();
            this._buttonPanel.SuspendLayout();
            this._linkPanel.SuspendLayout();
            this._languagePanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this._englishPictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._frenchPictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._russianPictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._spanishPictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._portuguesePictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this._logoPictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // _searchClientsButton
            // 
            resources.ApplyResources(this._searchClientsButton, "_searchClientsButton");
            this._searchClientsButton.Name = "_searchClientsButton";
            this._searchClientsButton.UseVisualStyleBackColor = true;
            // 
            // _newClientMenu
            // 
            resources.ApplyResources(this._newClientMenu, "_newClientMenu");
            this._newClientMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this._newPersonItem,
            this._newGroupItem,
            this._newVillageBankItem,
            this._newCompanyItem});
            this._newClientMenu.Name = "_newClientMenu";
            // 
            // _newPersonItem
            // 
            resources.ApplyResources(this._newPersonItem, "_newPersonItem");
            this._newPersonItem.Name = "_newPersonItem";
            // 
            // _newGroupItem
            // 
            resources.ApplyResources(this._newGroupItem, "_newGroupItem");
            this._newGroupItem.Name = "_newGroupItem";
            // 
            // _newVillageBankItem
            // 
            resources.ApplyResources(this._newVillageBankItem, "_newVillageBankItem");
            this._newVillageBankItem.Name = "_newVillageBankItem";
            // 
            // _newCompanyItem
            // 
            resources.ApplyResources(this._newCompanyItem, "_newCompanyItem");
            this._newCompanyItem.Name = "_newCompanyItem";
            // 
            // _searchContractsButton
            // 
            resources.ApplyResources(this._searchContractsButton, "_searchContractsButton");
            this._searchContractsButton.Name = "_searchContractsButton";
            this._searchContractsButton.UseVisualStyleBackColor = true;
            // 
            // _buttonPanel
            // 
            resources.ApplyResources(this._buttonPanel, "_buttonPanel");
            this._buttonPanel.Controls.Add(this._newClientButton);
            this._buttonPanel.Controls.Add(this._searchClientsButton);
            this._buttonPanel.Controls.Add(this._searchContractsButton);
            this._buttonPanel.Name = "_buttonPanel";
            // 
            // _newClientButton
            // 
            resources.ApplyResources(this._newClientButton, "_newClientButton");
            this._newClientButton.ContextMenuStrip = this._newClientMenu;
            this._newClientButton.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.bullet_arrow_down;
            this._newClientButton.Name = "_newClientButton";
            this._newClientButton.UseVisualStyleBackColor = true;
            // 
            // _linkPanel
            // 
            resources.ApplyResources(this._linkPanel, "_linkPanel");
            this._linkPanel.Controls.Add(this._siteLink);
            this._linkPanel.Controls.Add(this.label1);
            this._linkPanel.Controls.Add(this._userGuideLink);
            this._linkPanel.Controls.Add(this.label2);
            this._linkPanel.Controls.Add(this._forumLink);
            this._linkPanel.Controls.Add(this.label3);
            this._linkPanel.Controls.Add(this._contactLink);
            this._linkPanel.Name = "_linkPanel";
            // 
            // _siteLink
            // 
            resources.ApplyResources(this._siteLink, "_siteLink");
            this._siteLink.Name = "_siteLink";
            this._siteLink.TabStop = true;
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.ForeColor = System.Drawing.SystemColors.ControlDark;
            this.label1.Name = "label1";
            // 
            // _userGuideLink
            // 
            resources.ApplyResources(this._userGuideLink, "_userGuideLink");
            this._userGuideLink.Name = "_userGuideLink";
            this._userGuideLink.TabStop = true;
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.ForeColor = System.Drawing.SystemColors.ControlDark;
            this.label2.Name = "label2";
            // 
            // _forumLink
            // 
            resources.ApplyResources(this._forumLink, "_forumLink");
            this._forumLink.Name = "_forumLink";
            this._forumLink.TabStop = true;
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.ForeColor = System.Drawing.SystemColors.ControlDark;
            this.label3.Name = "label3";
            // 
            // _contactLink
            // 
            resources.ApplyResources(this._contactLink, "_contactLink");
            this._contactLink.Name = "_contactLink";
            this._contactLink.TabStop = true;
            // 
            // _languagePanel
            // 
            resources.ApplyResources(this._languagePanel, "_languagePanel");
            this._languagePanel.Controls.Add(this._englishPictureBox);
            this._languagePanel.Controls.Add(this._frenchPictureBox);
            this._languagePanel.Controls.Add(this._russianPictureBox);
            this._languagePanel.Controls.Add(this._spanishPictureBox);
            this._languagePanel.Controls.Add(this._portuguesePictureBox);
            this._languagePanel.Name = "_languagePanel";
            // 
            // _englishPictureBox
            // 
            resources.ApplyResources(this._englishPictureBox, "_englishPictureBox");
            this._englishPictureBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this._englishPictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.gb;
            this._englishPictureBox.Name = "_englishPictureBox";
            this._englishPictureBox.TabStop = false;
            // 
            // _frenchPictureBox
            // 
            resources.ApplyResources(this._frenchPictureBox, "_frenchPictureBox");
            this._frenchPictureBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this._frenchPictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.fr;
            this._frenchPictureBox.Name = "_frenchPictureBox";
            this._frenchPictureBox.TabStop = false;
            // 
            // _russianPictureBox
            // 
            resources.ApplyResources(this._russianPictureBox, "_russianPictureBox");
            this._russianPictureBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this._russianPictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.ru;
            this._russianPictureBox.Name = "_russianPictureBox";
            this._russianPictureBox.TabStop = false;
            // 
            // _spanishPictureBox
            // 
            resources.ApplyResources(this._spanishPictureBox, "_spanishPictureBox");
            this._spanishPictureBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this._spanishPictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.es;
            this._spanishPictureBox.Name = "_spanishPictureBox";
            this._spanishPictureBox.TabStop = false;
            // 
            // _portuguesePictureBox
            // 
            resources.ApplyResources(this._portuguesePictureBox, "_portuguesePictureBox");
            this._portuguesePictureBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this._portuguesePictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.pt;
            this._portuguesePictureBox.Name = "_portuguesePictureBox";
            this._portuguesePictureBox.TabStop = false;
            // 
            // _logoPictureBox
            // 
            resources.ApplyResources(this._logoPictureBox, "_logoPictureBox");
            this._logoPictureBox.Image = global::OpenCBS.ArchitectureV2.Properties.Resources.logo_with_tagline;
            this._logoPictureBox.Name = "_logoPictureBox";
            this._logoPictureBox.TabStop = false;
            // 
            // StartPageView
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this._languagePanel);
            this.Controls.Add(this._linkPanel);
            this.Controls.Add(this._buttonPanel);
            this.Controls.Add(this._logoPictureBox);
            this.Name = "StartPageView";
            this.ShowIcon = false;
            this._newClientMenu.ResumeLayout(false);
            this._buttonPanel.ResumeLayout(false);
            this._linkPanel.ResumeLayout(false);
            this._linkPanel.PerformLayout();
            this._languagePanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this._englishPictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._frenchPictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._russianPictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._spanishPictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._portuguesePictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this._logoPictureBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox _logoPictureBox;
        private System.Windows.Forms.Button _searchClientsButton;
        private System.Windows.Forms.Button _newClientButton;
        private System.Windows.Forms.Button _searchContractsButton;
        private System.Windows.Forms.ContextMenuStrip _newClientMenu;
        private System.Windows.Forms.ToolStripMenuItem _newPersonItem;
        private System.Windows.Forms.ToolStripMenuItem _newGroupItem;
        private System.Windows.Forms.ToolStripMenuItem _newVillageBankItem;
        private System.Windows.Forms.ToolStripMenuItem _newCompanyItem;
        private System.Windows.Forms.FlowLayoutPanel _buttonPanel;
        private System.Windows.Forms.FlowLayoutPanel _linkPanel;
        private System.Windows.Forms.LinkLabel _siteLink;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.LinkLabel _userGuideLink;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.LinkLabel _forumLink;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.LinkLabel _contactLink;
        private System.Windows.Forms.FlowLayoutPanel _languagePanel;
        private System.Windows.Forms.PictureBox _englishPictureBox;
        private System.Windows.Forms.PictureBox _frenchPictureBox;
        private System.Windows.Forms.PictureBox _russianPictureBox;
        private System.Windows.Forms.PictureBox _spanishPictureBox;
        private System.Windows.Forms.PictureBox _portuguesePictureBox;
    }
}