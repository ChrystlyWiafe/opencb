
using System.Windows.Forms;
using OpenCBS.GUI.UserControl;
using OpenCBS.Enums;
using OpenCBS.Services;
using OpenCBS.CoreDomain;

namespace OpenCBS.GUI
{
    partial class MainView
    {
        private System.Windows.Forms.ToolStripMenuItem mnuClients;
        private System.Windows.Forms.ToolStripMenuItem mnuNewClient;
        private System.Windows.Forms.ToolStripMenuItem mnuSearchClient;
        private System.ComponentModel.IContainer components;
        private System.Windows.Forms.MenuStrip mainMenu;
        private System.Windows.Forms.ToolStripMenuItem mnuWindow;
        private System.Windows.Forms.ToolStripMenuItem mnuNewGroup;
        private System.Windows.Forms.ToolStripMenuItem mnuConfiguration;
        private System.Windows.Forms.ToolStripMenuItem mnuDomainOfApplication;
        private System.Windows.Forms.ToolStripMenuItem menuItemExchangeRate;
        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.ToolStripMenuItem mnuHelp;
        private ToolStripSeparator toolStripSeparatorConfig1;
        private ToolStripSeparator toolStripSeparatorConfig2;
        private ToolStripSeparator toolStripSeparatorConfig3;
        private StatusStrip mainStatusBar;
        private ToolStripLabel toolBarLblVersion;
        private ToolStripStatusLabel mainStatusBarLblUserName;
        private ToolStripStatusLabel mainStatusBarLblDate;
        private ToolStripStatusLabel mainStatusBarLblUpdateVersion;
        private ToolStripStatusLabel toolStripStatusLblBranchCode;
        private ToolStripMenuItem menuItemLocations;
        private ToolStripMenuItem toolStripMenuItemFundingLines;
        private ToolStripMenuItem toolStripMenuItemInstallmentTypes;


        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (components != null)
                {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form
        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainView));
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.toolBarLblVersion = new System.Windows.Forms.ToolStripLabel();
            this.nIUpdateAvailable = new System.Windows.Forms.NotifyIcon(this.components);
            this.openCustomizableFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.colAlerts_Address = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.colAlerts_City = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.colAlerts_Phone = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.colAlerts_BranchName = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.bwUserInformation = new System.ComponentModel.BackgroundWorker();
            this.mainStatusBar = new System.Windows.Forms.StatusStrip();
            this.mainStatusBarLblUpdateVersion = new System.Windows.Forms.ToolStripStatusLabel();
            this.mainStatusBarLblUserName = new System.Windows.Forms.ToolStripStatusLabel();
            this.mainStatusBarLblDate = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblBranchCode = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblDB = new System.Windows.Forms.ToolStripStatusLabel();
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.mnuConfiguration = new System.Windows.Forms.ToolStripMenuItem();
            this.branchesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparatorConfig1 = new System.Windows.Forms.ToolStripSeparator();
            this.mnuDomainOfApplication = new System.Windows.Forms.ToolStripMenuItem();
            this.loanPurposeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemLocations = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItemFundingLines = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItemInstallmentTypes = new System.Windows.Forms.ToolStripMenuItem();
            this.paymentMethodToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparatorConfig2 = new System.Windows.Forms.ToolStripSeparator();
            this.menuItemExchangeRate = new System.Windows.Forms.ToolStripMenuItem();
            this.currenciesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparatorConfig3 = new System.Windows.Forms.ToolStripSeparator();
            this.miContractCode = new System.Windows.Forms.ToolStripMenuItem();
            this.collateralProductsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.entryFeesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.menuItemSetting = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemDatabaseControlPanel = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemApplicationDate = new System.Windows.Forms.ToolStripMenuItem();
            this.languagesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.frenchToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.englishToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.russianToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.spanishToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.portugueseToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSecurity = new System.Windows.Forms.ToolStripMenuItem();
            this.rolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemAddUser = new System.Windows.Forms.ToolStripMenuItem();
            this.miAuditTrail = new System.Windows.Forms.ToolStripMenuItem();
            this.changePasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuProducts = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuPackages = new System.Windows.Forms.ToolStripMenuItem();
            this.savingProductsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuClients = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewPerson = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewClient = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewGroup = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewVillage = new System.Windows.Forms.ToolStripMenuItem();
            this.newCorporateToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.mnuSearchClient = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSearchContract = new System.Windows.Forms.ToolStripMenuItem();
            this.reasignToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this._viewItem = new System.Windows.Forms.ToolStripMenuItem();
            this._startPageItem = new System.Windows.Forms.ToolStripMenuItem();
            this._alertsItem = new System.Windows.Forms.ToolStripMenuItem();
            this._dashboardItem = new System.Windows.Forms.ToolStripMenuItem();
            this._searchItem = new System.Windows.Forms.ToolStripMenuItem();
            this.loanCalculatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this._modulesMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this._aboutModulesMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuAccounting = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewBooking = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewChartOfAccounts = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewBalances = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewTurnoverBalances = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNewAccountMovements = new System.Windows.Forms.ToolStripMenuItem();
            this.closureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openDayToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.closeDayToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reportsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuWindow = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.userGuideToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.contactMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.getHelpFromForumToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.visitOpenCBScomToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mainStatusBar.SuspendLayout();
            this.mainMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // timer
            // 
            this.timer.Enabled = true;
            this.timer.Interval = 1000;
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // toolBarLblVersion
            // 
            resources.ApplyResources(this.toolBarLblVersion, "toolBarLblVersion");
            this.toolBarLblVersion.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.toolBarLblVersion.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(180)))), ((int)(((byte)(156)))));
            this.toolBarLblVersion.Name = "toolBarLblVersion";
            // 
            // nIUpdateAvailable
            // 
            this.nIUpdateAvailable.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            resources.ApplyResources(this.nIUpdateAvailable, "nIUpdateAvailable");
            this.nIUpdateAvailable.BalloonTipClicked += new System.EventHandler(this.nIUpdateAvailable_BalloonTipClicked);
            // 
            // openCustomizableFileDialog
            // 
            resources.ApplyResources(this.openCustomizableFileDialog, "openCustomizableFileDialog");
            // 
            // colAlerts_Address
            // 
            this.colAlerts_Address.AspectName = "Address";
            resources.ApplyResources(this.colAlerts_Address, "colAlerts_Address");
            this.colAlerts_Address.IsEditable = false;
            this.colAlerts_Address.IsVisible = false;
            // 
            // colAlerts_City
            // 
            this.colAlerts_City.AspectName = "City";
            resources.ApplyResources(this.colAlerts_City, "colAlerts_City");
            this.colAlerts_City.IsEditable = false;
            this.colAlerts_City.IsVisible = false;
            // 
            // colAlerts_Phone
            // 
            this.colAlerts_Phone.AspectName = "Phone";
            resources.ApplyResources(this.colAlerts_Phone, "colAlerts_Phone");
            this.colAlerts_Phone.IsEditable = false;
            this.colAlerts_Phone.IsVisible = false;
            // 
            // colAlerts_BranchName
            // 
            this.colAlerts_BranchName.AspectName = "BranchName";
            resources.ApplyResources(this.colAlerts_BranchName, "colAlerts_BranchName");
            this.colAlerts_BranchName.IsEditable = false;
            this.colAlerts_BranchName.IsVisible = false;
            // 
            // mainStatusBar
            // 
            resources.ApplyResources(this.mainStatusBar, "mainStatusBar");
            this.mainStatusBar.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mainStatusBarLblUpdateVersion,
            this.mainStatusBarLblUserName,
            this.mainStatusBarLblDate,
            this.toolStripStatusLblBranchCode,
            this.toolStripStatusLblDB});
            this.mainStatusBar.Name = "mainStatusBar";
            this.mainStatusBar.RenderMode = System.Windows.Forms.ToolStripRenderMode.ManagerRenderMode;
            this.mainStatusBar.ShowItemToolTips = true;
            this.mainStatusBar.SizingGrip = false;
            // 
            // mainStatusBarLblUpdateVersion
            // 
            resources.ApplyResources(this.mainStatusBarLblUpdateVersion, "mainStatusBarLblUpdateVersion");
            this.mainStatusBarLblUpdateVersion.Name = "mainStatusBarLblUpdateVersion";
            this.mainStatusBarLblUpdateVersion.Spring = true;
            // 
            // mainStatusBarLblUserName
            // 
            resources.ApplyResources(this.mainStatusBarLblUserName, "mainStatusBarLblUserName");
            this.mainStatusBarLblUserName.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.mainStatusBarLblUserName.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter;
            this.mainStatusBarLblUserName.Image = global::OpenCBS.GUI.Properties.Resources.user_gray;
            this.mainStatusBarLblUserName.Name = "mainStatusBarLblUserName";
            // 
            // mainStatusBarLblDate
            // 
            resources.ApplyResources(this.mainStatusBarLblDate, "mainStatusBarLblDate");
            this.mainStatusBarLblDate.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.mainStatusBarLblDate.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter;
            this.mainStatusBarLblDate.Image = global::OpenCBS.GUI.Properties.Resources.calendar;
            this.mainStatusBarLblDate.Name = "mainStatusBarLblDate";
            // 
            // toolStripStatusLblBranchCode
            // 
            resources.ApplyResources(this.toolStripStatusLblBranchCode, "toolStripStatusLblBranchCode");
            this.toolStripStatusLblBranchCode.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.toolStripStatusLblBranchCode.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter;
            this.toolStripStatusLblBranchCode.Name = "toolStripStatusLblBranchCode";
            // 
            // toolStripStatusLblDB
            // 
            resources.ApplyResources(this.toolStripStatusLblDB, "toolStripStatusLblDB");
            this.toolStripStatusLblDB.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.toolStripStatusLblDB.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter;
            this.toolStripStatusLblDB.Image = global::OpenCBS.GUI.Properties.Resources.database;
            this.toolStripStatusLblDB.Name = "toolStripStatusLblDB";
            // 
            // mainMenu
            // 
            resources.ApplyResources(this.mainMenu, "mainMenu");
            this.mainMenu.BackColor = System.Drawing.SystemColors.Control;
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuConfiguration,
            this.mnuSecurity,
            this.mnuProducts,
            this.mnuClients,
            this._viewItem,
            this._modulesMenuItem,
            this.mnuAccounting,
            this.closureToolStripMenuItem,
            this.reportsToolStripMenuItem,
            this.mnuWindow,
            this.mnuHelp});
            this.mainMenu.MdiWindowListItem = this.mnuWindow;
            this.mainMenu.Name = "mainMenu";
            // 
            // mnuConfiguration
            // 
            resources.ApplyResources(this.mnuConfiguration, "mnuConfiguration");
            this.mnuConfiguration.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.branchesToolStripMenuItem,
            this.toolStripSeparatorConfig1,
            this.mnuDomainOfApplication,
            this.loanPurposeToolStripMenuItem,
            this.menuItemLocations,
            this.toolStripMenuItemFundingLines,
            this.toolStripMenuItemInstallmentTypes,
            this.paymentMethodToolStripMenuItem,
            this.toolStripSeparatorConfig2,
            this.menuItemExchangeRate,
            this.currenciesToolStripMenuItem,
            this.toolStripSeparatorConfig3,
            this.miContractCode,
            this.collateralProductsToolStripMenuItem,
            this.entryFeesToolStripMenuItem,
            this.toolStripSeparator1,
            this.menuItemSetting,
            this.menuItemDatabaseControlPanel,
            this.menuItemApplicationDate,
            this.languagesToolStripMenuItem});
            this.mnuConfiguration.Name = "mnuConfiguration";
            // 
            // branchesToolStripMenuItem
            // 
            resources.ApplyResources(this.branchesToolStripMenuItem, "branchesToolStripMenuItem");
            this.branchesToolStripMenuItem.Name = "branchesToolStripMenuItem";
            this.branchesToolStripMenuItem.Click += new System.EventHandler(this.branchesToolStripMenuItem_Click);
            // 
            // toolStripSeparatorConfig1
            // 
            resources.ApplyResources(this.toolStripSeparatorConfig1, "toolStripSeparatorConfig1");
            this.toolStripSeparatorConfig1.Name = "toolStripSeparatorConfig1";
            // 
            // mnuDomainOfApplication
            // 
            resources.ApplyResources(this.mnuDomainOfApplication, "mnuDomainOfApplication");
            this.mnuDomainOfApplication.Name = "mnuDomainOfApplication";
            this.mnuDomainOfApplication.Click += new System.EventHandler(this.mnuDomainOfApplication_Click);
            // 
            // loanPurposeToolStripMenuItem
            // 
            resources.ApplyResources(this.loanPurposeToolStripMenuItem, "loanPurposeToolStripMenuItem");
            this.loanPurposeToolStripMenuItem.Name = "loanPurposeToolStripMenuItem";
            this.loanPurposeToolStripMenuItem.Click += new System.EventHandler(this.loanPurposeToolStripMenuItem_Click);
            // 
            // menuItemLocations
            // 
            resources.ApplyResources(this.menuItemLocations, "menuItemLocations");
            this.menuItemLocations.Name = "menuItemLocations";
            this.menuItemLocations.Click += new System.EventHandler(this.menuItemLocations_Click);
            // 
            // toolStripMenuItemFundingLines
            // 
            resources.ApplyResources(this.toolStripMenuItemFundingLines, "toolStripMenuItemFundingLines");
            this.toolStripMenuItemFundingLines.Name = "toolStripMenuItemFundingLines";
            this.toolStripMenuItemFundingLines.Click += new System.EventHandler(this.toolStripMenuItemFundingLines_Click);
            // 
            // toolStripMenuItemInstallmentTypes
            // 
            resources.ApplyResources(this.toolStripMenuItemInstallmentTypes, "toolStripMenuItemInstallmentTypes");
            this.toolStripMenuItemInstallmentTypes.Name = "toolStripMenuItemInstallmentTypes";
            this.toolStripMenuItemInstallmentTypes.Click += new System.EventHandler(this.toolStripMenuItemInstallmentTypes_Click);
            // 
            // paymentMethodToolStripMenuItem
            // 
            resources.ApplyResources(this.paymentMethodToolStripMenuItem, "paymentMethodToolStripMenuItem");
            this.paymentMethodToolStripMenuItem.Name = "paymentMethodToolStripMenuItem";
            this.paymentMethodToolStripMenuItem.Click += new System.EventHandler(this.paymentMethodToolStripMenuItem_Click);
            // 
            // toolStripSeparatorConfig2
            // 
            resources.ApplyResources(this.toolStripSeparatorConfig2, "toolStripSeparatorConfig2");
            this.toolStripSeparatorConfig2.Name = "toolStripSeparatorConfig2";
            // 
            // menuItemExchangeRate
            // 
            resources.ApplyResources(this.menuItemExchangeRate, "menuItemExchangeRate");
            this.menuItemExchangeRate.Name = "menuItemExchangeRate";
            this.menuItemExchangeRate.Click += new System.EventHandler(this.menuItemExchangeRate_Click);
            // 
            // currenciesToolStripMenuItem
            // 
            resources.ApplyResources(this.currenciesToolStripMenuItem, "currenciesToolStripMenuItem");
            this.currenciesToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.money;
            this.currenciesToolStripMenuItem.Name = "currenciesToolStripMenuItem";
            this.currenciesToolStripMenuItem.Click += new System.EventHandler(this.currenciesToolStripMenuItem_Click);
            // 
            // toolStripSeparatorConfig3
            // 
            resources.ApplyResources(this.toolStripSeparatorConfig3, "toolStripSeparatorConfig3");
            this.toolStripSeparatorConfig3.Name = "toolStripSeparatorConfig3";
            // 
            // miContractCode
            // 
            resources.ApplyResources(this.miContractCode, "miContractCode");
            this.miContractCode.Name = "miContractCode";
            this.miContractCode.Click += new System.EventHandler(this.miContractCode_Click);
            // 
            // collateralProductsToolStripMenuItem
            // 
            resources.ApplyResources(this.collateralProductsToolStripMenuItem, "collateralProductsToolStripMenuItem");
            this.collateralProductsToolStripMenuItem.Name = "collateralProductsToolStripMenuItem";
            this.collateralProductsToolStripMenuItem.Click += new System.EventHandler(this.collateralProductsToolStripMenuItem_Click);
            // 
            // entryFeesToolStripMenuItem
            // 
            resources.ApplyResources(this.entryFeesToolStripMenuItem, "entryFeesToolStripMenuItem");
            this.entryFeesToolStripMenuItem.Name = "entryFeesToolStripMenuItem";
            this.entryFeesToolStripMenuItem.Click += new System.EventHandler(this.entryFeesToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            resources.ApplyResources(this.toolStripSeparator1, "toolStripSeparator1");
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            // 
            // menuItemSetting
            // 
            resources.ApplyResources(this.menuItemSetting, "menuItemSetting");
            this.menuItemSetting.Image = global::OpenCBS.GUI.Properties.Resources.cog;
            this.menuItemSetting.Name = "menuItemSetting";
            this.menuItemSetting.Click += new System.EventHandler(this.menuItemSetting_Click);
            // 
            // menuItemDatabaseControlPanel
            // 
            resources.ApplyResources(this.menuItemDatabaseControlPanel, "menuItemDatabaseControlPanel");
            this.menuItemDatabaseControlPanel.Image = global::OpenCBS.GUI.Properties.Resources.database_gear;
            this.menuItemDatabaseControlPanel.Name = "menuItemDatabaseControlPanel";
            this.menuItemDatabaseControlPanel.Click += new System.EventHandler(this.menuItemBackupData_Click);
            // 
            // menuItemApplicationDate
            // 
            resources.ApplyResources(this.menuItemApplicationDate, "menuItemApplicationDate");
            this.menuItemApplicationDate.Image = global::OpenCBS.GUI.Properties.Resources.calendar;
            this.menuItemApplicationDate.Name = "menuItemApplicationDate";
            this.menuItemApplicationDate.Click += new System.EventHandler(this.OnChangeApplicationDateClick);
            // 
            // languagesToolStripMenuItem
            // 
            resources.ApplyResources(this.languagesToolStripMenuItem, "languagesToolStripMenuItem");
            this.languagesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.frenchToolStripMenuItem,
            this.englishToolStripMenuItem,
            this.russianToolStripMenuItem,
            this.spanishToolStripMenuItem,
            this.portugueseToolStripMenuItem});
            this.languagesToolStripMenuItem.Name = "languagesToolStripMenuItem";
            // 
            // frenchToolStripMenuItem
            // 
            resources.ApplyResources(this.frenchToolStripMenuItem, "frenchToolStripMenuItem");
            this.frenchToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.fr;
            this.frenchToolStripMenuItem.Name = "frenchToolStripMenuItem";
            this.frenchToolStripMenuItem.Tag = "fr";
            this.frenchToolStripMenuItem.Click += new System.EventHandler(this.LanguageToolStripMenuItem_Click);
            // 
            // englishToolStripMenuItem
            // 
            resources.ApplyResources(this.englishToolStripMenuItem, "englishToolStripMenuItem");
            this.englishToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.gb;
            this.englishToolStripMenuItem.Name = "englishToolStripMenuItem";
            this.englishToolStripMenuItem.Tag = "en-US";
            this.englishToolStripMenuItem.Click += new System.EventHandler(this.LanguageToolStripMenuItem_Click);
            // 
            // russianToolStripMenuItem
            // 
            resources.ApplyResources(this.russianToolStripMenuItem, "russianToolStripMenuItem");
            this.russianToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.ru;
            this.russianToolStripMenuItem.Name = "russianToolStripMenuItem";
            this.russianToolStripMenuItem.Tag = "ru-RU";
            this.russianToolStripMenuItem.Click += new System.EventHandler(this.LanguageToolStripMenuItem_Click);
            // 
            // spanishToolStripMenuItem
            // 
            resources.ApplyResources(this.spanishToolStripMenuItem, "spanishToolStripMenuItem");
            this.spanishToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.es;
            this.spanishToolStripMenuItem.Name = "spanishToolStripMenuItem";
            this.spanishToolStripMenuItem.Tag = "es-ES";
            this.spanishToolStripMenuItem.Click += new System.EventHandler(this.LanguageToolStripMenuItem_Click);
            // 
            // portugueseToolStripMenuItem
            // 
            resources.ApplyResources(this.portugueseToolStripMenuItem, "portugueseToolStripMenuItem");
            this.portugueseToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.pt;
            this.portugueseToolStripMenuItem.Name = "portugueseToolStripMenuItem";
            this.portugueseToolStripMenuItem.Click += new System.EventHandler(this.LanguageToolStripMenuItem_Click);
            // 
            // mnuSecurity
            // 
            resources.ApplyResources(this.mnuSecurity, "mnuSecurity");
            this.mnuSecurity.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.rolesToolStripMenuItem,
            this.menuItemAddUser,
            this.miAuditTrail,
            this.changePasswordToolStripMenuItem});
            this.mnuSecurity.Name = "mnuSecurity";
            // 
            // rolesToolStripMenuItem
            // 
            resources.ApplyResources(this.rolesToolStripMenuItem, "rolesToolStripMenuItem");
            this.rolesToolStripMenuItem.Name = "rolesToolStripMenuItem";
            this.rolesToolStripMenuItem.Click += new System.EventHandler(this.rolesToolStripMenuItem_Click);
            // 
            // menuItemAddUser
            // 
            resources.ApplyResources(this.menuItemAddUser, "menuItemAddUser");
            this.menuItemAddUser.Image = global::OpenCBS.GUI.Properties.Resources.group;
            this.menuItemAddUser.Name = "menuItemAddUser";
            this.menuItemAddUser.Click += new System.EventHandler(this.menuItemAddUser_Click);
            // 
            // miAuditTrail
            // 
            resources.ApplyResources(this.miAuditTrail, "miAuditTrail");
            this.miAuditTrail.Name = "miAuditTrail";
            this.miAuditTrail.Click += new System.EventHandler(this.eventsToolStripMenuItem_Click);
            // 
            // changePasswordToolStripMenuItem
            // 
            resources.ApplyResources(this.changePasswordToolStripMenuItem, "changePasswordToolStripMenuItem");
            this.changePasswordToolStripMenuItem.Name = "changePasswordToolStripMenuItem";
            this.changePasswordToolStripMenuItem.Click += new System.EventHandler(this.changePasswordToolStripMenuItem_Click);
            // 
            // mnuProducts
            // 
            resources.ApplyResources(this.mnuProducts, "mnuProducts");
            this.mnuProducts.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuPackages,
            this.savingProductsToolStripMenuItem});
            this.mnuProducts.Name = "mnuProducts";
            // 
            // mnuPackages
            // 
            resources.ApplyResources(this.mnuPackages, "mnuPackages");
            this.mnuPackages.Image = global::OpenCBS.GUI.Properties.Resources.package;
            this.mnuPackages.Name = "mnuPackages";
            this.mnuPackages.Click += new System.EventHandler(this.menuItemPackages_Click);
            // 
            // savingProductsToolStripMenuItem
            // 
            resources.ApplyResources(this.savingProductsToolStripMenuItem, "savingProductsToolStripMenuItem");
            this.savingProductsToolStripMenuItem.Image = global::OpenCBS.GUI.Properties.Resources.package;
            this.savingProductsToolStripMenuItem.Name = "savingProductsToolStripMenuItem";
            this.savingProductsToolStripMenuItem.Click += new System.EventHandler(this.savingProductsToolStripMenuItem_Click);
            // 
            // mnuClients
            // 
            resources.ApplyResources(this.mnuClients, "mnuClients");
            this.mnuClients.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuNewPerson,
            this.mnuNewClient,
            this.toolStripMenuItem1,
            this.mnuSearchClient,
            this.mnuSearchContract,
            this.reasignToolStripMenuItem});
            this.mnuClients.Name = "mnuClients";
            // 
            // mnuNewPerson
            // 
            resources.ApplyResources(this.mnuNewPerson, "mnuNewPerson");
            this.mnuNewPerson.Name = "mnuNewPerson";
            this.mnuNewPerson.Click += new System.EventHandler(this.mnuNewPerson_Click);
            // 
            // mnuNewClient
            // 
            resources.ApplyResources(this.mnuNewClient, "mnuNewClient");
            this.mnuNewClient.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuNewGroup,
            this.mnuNewVillage,
            this.newCorporateToolStripMenuItem});
            this.mnuNewClient.Name = "mnuNewClient";
            // 
            // mnuNewGroup
            // 
            resources.ApplyResources(this.mnuNewGroup, "mnuNewGroup");
            this.mnuNewGroup.Name = "mnuNewGroup";
            this.mnuNewGroup.Click += new System.EventHandler(this.mnuNewGroup_Click);
            // 
            // mnuNewVillage
            // 
            resources.ApplyResources(this.mnuNewVillage, "mnuNewVillage");
            this.mnuNewVillage.Name = "mnuNewVillage";
            this.mnuNewVillage.Click += new System.EventHandler(this.mnuNewVillage_Click);
            // 
            // newCorporateToolStripMenuItem
            // 
            resources.ApplyResources(this.newCorporateToolStripMenuItem, "newCorporateToolStripMenuItem");
            this.newCorporateToolStripMenuItem.Name = "newCorporateToolStripMenuItem";
            this.newCorporateToolStripMenuItem.Click += new System.EventHandler(this.newCorporateToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            resources.ApplyResources(this.toolStripMenuItem1, "toolStripMenuItem1");
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            // 
            // mnuSearchClient
            // 
            resources.ApplyResources(this.mnuSearchClient, "mnuSearchClient");
            this.mnuSearchClient.Image = global::OpenCBS.GUI.Properties.Resources.find;
            this.mnuSearchClient.Name = "mnuSearchClient";
            this.mnuSearchClient.Click += new System.EventHandler(this.mnuSearchClient_Click);
            // 
            // mnuSearchContract
            // 
            resources.ApplyResources(this.mnuSearchContract, "mnuSearchContract");
            this.mnuSearchContract.Image = global::OpenCBS.GUI.Properties.Resources.find;
            this.mnuSearchContract.Name = "mnuSearchContract";
            this.mnuSearchContract.Click += new System.EventHandler(this.mnuSearchContract_Click);
            // 
            // reasignToolStripMenuItem
            // 
            resources.ApplyResources(this.reasignToolStripMenuItem, "reasignToolStripMenuItem");
            this.reasignToolStripMenuItem.Name = "reasignToolStripMenuItem";
            this.reasignToolStripMenuItem.Click += new System.EventHandler(this.reasignToolStripMenuItem_Click);
            // 
            // _viewItem
            // 
            resources.ApplyResources(this._viewItem, "_viewItem");
            this._viewItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this._startPageItem,
            this._alertsItem,
            this._dashboardItem,
            this._searchItem,
            this.loanCalculatorToolStripMenuItem});
            this._viewItem.Name = "_viewItem";
            // 
            // _startPageItem
            // 
            resources.ApplyResources(this._startPageItem, "_startPageItem");
            this._startPageItem.Name = "_startPageItem";
            // 
            // _alertsItem
            // 
            resources.ApplyResources(this._alertsItem, "_alertsItem");
            this._alertsItem.Name = "_alertsItem";
            // 
            // _dashboardItem
            // 
            resources.ApplyResources(this._dashboardItem, "_dashboardItem");
            this._dashboardItem.Name = "_dashboardItem";
            // 
            // _searchItem
            // 
            resources.ApplyResources(this._searchItem, "_searchItem");
            this._searchItem.Name = "_searchItem";
            // 
            // loanCalculatorToolStripMenuItem
            // 
            resources.ApplyResources(this.loanCalculatorToolStripMenuItem, "loanCalculatorToolStripMenuItem");
            this.loanCalculatorToolStripMenuItem.Name = "loanCalculatorToolStripMenuItem";
            this.loanCalculatorToolStripMenuItem.Click += new System.EventHandler(this.loanCalculatorToolStripMenuItem_Click);
            // 
            // _modulesMenuItem
            // 
            resources.ApplyResources(this._modulesMenuItem, "_modulesMenuItem");
            this._modulesMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this._aboutModulesMenuItem});
            this._modulesMenuItem.Name = "_modulesMenuItem";
            // 
            // _aboutModulesMenuItem
            // 
            resources.ApplyResources(this._aboutModulesMenuItem, "_aboutModulesMenuItem");
            this._aboutModulesMenuItem.Name = "_aboutModulesMenuItem";
            this._aboutModulesMenuItem.Click += new System.EventHandler(this._aboutModulesMenuItem_Click);
            // 
            // mnuAccounting
            // 
            resources.ApplyResources(this.mnuAccounting, "mnuAccounting");
            this.mnuAccounting.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuNewBooking,
            this.mnuNewChartOfAccounts,
            this.mnuNewBalances,
            this.mnuNewTurnoverBalances,
            this.mnuNewAccountMovements});
            this.mnuAccounting.Name = "mnuAccounting";
            // 
            // mnuNewBooking
            // 
            resources.ApplyResources(this.mnuNewBooking, "mnuNewBooking");
            this.mnuNewBooking.Name = "mnuNewBooking";
            this.mnuNewBooking.Click += new System.EventHandler(this.mnuNewBooking_Click);
            // 
            // mnuNewChartOfAccounts
            // 
            resources.ApplyResources(this.mnuNewChartOfAccounts, "mnuNewChartOfAccounts");
            this.mnuNewChartOfAccounts.Name = "mnuNewChartOfAccounts";
            this.mnuNewChartOfAccounts.Click += new System.EventHandler(this.mnuNewChartOfAccounts_Click);
            // 
            // mnuNewBalances
            // 
            resources.ApplyResources(this.mnuNewBalances, "mnuNewBalances");
            this.mnuNewBalances.Name = "mnuNewBalances";
            this.mnuNewBalances.Click += new System.EventHandler(this.mnuNewBalances_Click);
            // 
            // mnuNewTurnoverBalances
            // 
            resources.ApplyResources(this.mnuNewTurnoverBalances, "mnuNewTurnoverBalances");
            this.mnuNewTurnoverBalances.Name = "mnuNewTurnoverBalances";
            this.mnuNewTurnoverBalances.Click += new System.EventHandler(this.mnuNewTurnoverBalances_Click);
            // 
            // mnuNewAccountMovements
            // 
            resources.ApplyResources(this.mnuNewAccountMovements, "mnuNewAccountMovements");
            this.mnuNewAccountMovements.Name = "mnuNewAccountMovements";
            this.mnuNewAccountMovements.Click += new System.EventHandler(this.mnuNewAccountMovements_Click);
            // 
            // closureToolStripMenuItem
            // 
            resources.ApplyResources(this.closureToolStripMenuItem, "closureToolStripMenuItem");
            this.closureToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openDayToolStripMenuItem,
            this.closeDayToolStripMenuItem});
            this.closureToolStripMenuItem.Name = "closureToolStripMenuItem";
            // 
            // openDayToolStripMenuItem
            // 
            resources.ApplyResources(this.openDayToolStripMenuItem, "openDayToolStripMenuItem");
            this.openDayToolStripMenuItem.Name = "openDayToolStripMenuItem";
            // 
            // closeDayToolStripMenuItem
            // 
            resources.ApplyResources(this.closeDayToolStripMenuItem, "closeDayToolStripMenuItem");
            this.closeDayToolStripMenuItem.Name = "closeDayToolStripMenuItem";
            this.closeDayToolStripMenuItem.Click += new System.EventHandler(this.closeDayToolStripMenuItem_Click);
            // 
            // reportsToolStripMenuItem
            // 
            resources.ApplyResources(this.reportsToolStripMenuItem, "reportsToolStripMenuItem");
            this.reportsToolStripMenuItem.Name = "reportsToolStripMenuItem";
            // 
            // mnuWindow
            // 
            resources.ApplyResources(this.mnuWindow, "mnuWindow");
            this.mnuWindow.Name = "mnuWindow";
            // 
            // mnuHelp
            // 
            resources.ApplyResources(this.mnuHelp, "mnuHelp");
            this.mnuHelp.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.userGuideToolStripMenuItem,
            this.contactMenuItem,
            this.aboutMenuItem,
            this.getHelpFromForumToolStripMenuItem,
            this.visitOpenCBScomToolStripMenuItem});
            this.mnuHelp.Name = "mnuHelp";
            // 
            // userGuideToolStripMenuItem
            // 
            resources.ApplyResources(this.userGuideToolStripMenuItem, "userGuideToolStripMenuItem");
            this.userGuideToolStripMenuItem.Name = "userGuideToolStripMenuItem";
            this.userGuideToolStripMenuItem.Click += new System.EventHandler(this.OpenUserGuid);
            // 
            // contactMenuItem
            // 
            resources.ApplyResources(this.contactMenuItem, "contactMenuItem");
            this.contactMenuItem.Name = "contactMenuItem";
            this.contactMenuItem.Click += new System.EventHandler(this.contactMenuItem_Click);
            // 
            // aboutMenuItem
            // 
            resources.ApplyResources(this.aboutMenuItem, "aboutMenuItem");
            this.aboutMenuItem.Name = "aboutMenuItem";
            this.aboutMenuItem.Click += new System.EventHandler(this.OnAboutMenuItemClick);
            // 
            // getHelpFromForumToolStripMenuItem
            // 
            resources.ApplyResources(this.getHelpFromForumToolStripMenuItem, "getHelpFromForumToolStripMenuItem");
            this.getHelpFromForumToolStripMenuItem.Name = "getHelpFromForumToolStripMenuItem";
            this.getHelpFromForumToolStripMenuItem.Click += new System.EventHandler(this.getHelpFromForumToolStripMenuItem_Click);
            // 
            // visitOpenCBScomToolStripMenuItem
            // 
            resources.ApplyResources(this.visitOpenCBScomToolStripMenuItem, "visitOpenCBScomToolStripMenuItem");
            this.visitOpenCBScomToolStripMenuItem.Name = "visitOpenCBScomToolStripMenuItem";
            this.visitOpenCBScomToolStripMenuItem.Click += new System.EventHandler(this.visitOpenCBScomToolStripMenuItem_Click);
            // 
            // MainView
            // 
            resources.ApplyResources(this, "$this");
            this.Controls.Add(this.mainStatusBar);
            this.Controls.Add(this.mainMenu);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mainMenu;
            this.Name = "MainView";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.LotrasmicMainWindowForm_FormClosing);
            this.Load += new System.EventHandler(this.LotrasmicMainWindowForm_Load);
            this.mainStatusBar.ResumeLayout(false);
            this.mainStatusBar.PerformLayout();
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion

        private ToolStripMenuItem newCorporateToolStripMenuItem;
        private ToolStripMenuItem mnuNewVillage;
        private ToolStripMenuItem miContractCode;
        private ToolStripMenuItem currenciesToolStripMenuItem;
        private NotifyIcon nIUpdateAvailable;
        private OpenFileDialog openCustomizableFileDialog;
        private BrightIdeasSoftware.OLVColumn colAlerts_Address;
        private BrightIdeasSoftware.OLVColumn colAlerts_City;
        private BrightIdeasSoftware.OLVColumn colAlerts_Phone;
        private ToolStripMenuItem branchesToolStripMenuItem;
        private ToolStripStatusLabel toolStripStatusLblDB;
        private BrightIdeasSoftware.OLVColumn colAlerts_BranchName;
        private System.ComponentModel.BackgroundWorker bwUserInformation;
        private ToolStripMenuItem aboutMenuItem;
        private ToolStripMenuItem reportsToolStripMenuItem;
        private ToolStripMenuItem mnuSecurity;
        private ToolStripMenuItem rolesToolStripMenuItem;
        private ToolStripMenuItem menuItemAddUser;
        private ToolStripMenuItem miAuditTrail;
        private ToolStripMenuItem mnuNewPerson;
        private ToolStripSeparator toolStripMenuItem1;
        private ToolStripMenuItem mnuSearchContract;
        private ToolStripMenuItem reasignToolStripMenuItem;
        private ToolStripMenuItem mnuProducts;
        private ToolStripMenuItem mnuPackages;
        private ToolStripMenuItem savingProductsToolStripMenuItem;
        private ToolStripMenuItem changePasswordToolStripMenuItem;
        private ToolStripMenuItem _modulesMenuItem;
        private ToolStripMenuItem _aboutModulesMenuItem;
        private ToolStripMenuItem contactMenuItem;
        private ToolStripMenuItem userGuideToolStripMenuItem;
        private ToolStripMenuItem getHelpFromForumToolStripMenuItem;
        private ToolStripMenuItem visitOpenCBScomToolStripMenuItem;
        private ToolStripMenuItem collateralProductsToolStripMenuItem;
        private ToolStripMenuItem _viewItem;
        private ToolStripMenuItem _startPageItem;
        private ToolStripMenuItem _alertsItem;
        private ToolStripMenuItem _dashboardItem;
        private ToolStripMenuItem loanPurposeToolStripMenuItem;
        private ToolStripMenuItem _searchItem;
        private ToolStripMenuItem menuItemSetting;
        private ToolStripMenuItem menuItemDatabaseControlPanel;
        private ToolStripMenuItem menuItemApplicationDate;
        private ToolStripMenuItem languagesToolStripMenuItem;
        private ToolStripMenuItem frenchToolStripMenuItem;
        private ToolStripMenuItem englishToolStripMenuItem;
        private ToolStripMenuItem russianToolStripMenuItem;
        private ToolStripMenuItem spanishToolStripMenuItem;
        private ToolStripMenuItem portugueseToolStripMenuItem;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripMenuItem loanCalculatorToolStripMenuItem;
        private ToolStripMenuItem entryFeesToolStripMenuItem;
        private ToolStripMenuItem paymentMethodToolStripMenuItem;
        private ToolStripMenuItem mnuAccounting;
        private ToolStripMenuItem mnuNewBooking;
        private ToolStripMenuItem mnuNewChartOfAccounts;
        private ToolStripMenuItem mnuNewBalances;
        private ToolStripMenuItem mnuNewTurnoverBalances;
        private ToolStripMenuItem mnuNewAccountMovements;
        private ToolStripMenuItem closureToolStripMenuItem;
        private ToolStripMenuItem openDayToolStripMenuItem;
        private ToolStripMenuItem closeDayToolStripMenuItem;
    }
}
