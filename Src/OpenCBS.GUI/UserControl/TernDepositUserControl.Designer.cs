namespace OpenCBS.GUI.UserControl
{
    partial class TernDepositUserControl
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TernDepositUserControl));
            this.tabControlSavingsDetails = new System.Windows.Forms.TabControl();
            this.tabPageSavingsEvents = new System.Windows.Forms.TabPage();
            this.lvSavingEvent = new System.Windows.Forms.ListView();
            this.columnHeader21 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader22 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader23 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader27 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader15 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader28 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader29 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader24 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colCancelDate = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.dtpTernDepositDateEnd = new System.Windows.Forms.DateTimePicker();
            this.lblTernDepositDateStarted = new System.Windows.Forms.Label();
            this.lblNumberOfPeriods = new System.Windows.Forms.Label();
            this.nudNumberOfPeriods = new System.Windows.Forms.NumericUpDown();
            this.lblLimitOfTermDepositPeriod = new System.Windows.Forms.Label();
            this.dtpTernDepositDateStarted = new System.Windows.Forms.DateTimePicker();
            this.lblTernDepositDateEnd = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.flowLayoutPanel9 = new System.Windows.Forms.FlowLayoutPanel();
            this.buttonSaveSaving = new System.Windows.Forms.Button();
            this.pnlSavingsButtons = new System.Windows.Forms.FlowLayoutPanel();
            this.buttonSavingsClose = new System.Windows.Forms.Button();
            this.btCancelLastSavingEvent = new System.Windows.Forms.Button();
            this.btnPrintSavings = new OpenCBS.GUI.UserControl.PrintButton();
            this.buttonStart = new System.Windows.Forms.Button();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.buttonRenew = new System.Windows.Forms.Button();
            this.groupBoxSaving = new System.Windows.Forms.GroupBox();
            this.tableLayoutPanel5 = new System.Windows.Forms.TableLayoutPanel();
            this.nudExpectedAmount = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tBSavingCode = new System.Windows.Forms.TextBox();
            this.lBSavingBalance = new System.Windows.Forms.Label();
            this.lbSavingBalanceValue = new System.Windows.Forms.Label();
            this.lBSavingAvBalance = new System.Windows.Forms.Label();
            this.lbSavingAvBalanceValue = new System.Windows.Forms.Label();
            this._currentAccountLabel = new System.Windows.Forms.Label();
            this._currentAccountTextBox = new System.Windows.Forms.TextBox();
            this._dateCreatedLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cmbSavingsOfficer = new System.Windows.Forms.ComboBox();
            this.labelInitialAmount = new System.Windows.Forms.Label();
            this.nudDownInitialAmount = new System.Windows.Forms.NumericUpDown();
            this.lbInitialAmountMinMax = new System.Windows.Forms.Label();
            this.labelInterestRate = new System.Windows.Forms.Label();
            this.nudDownInterestRate = new System.Windows.Forms.NumericUpDown();
            this.lbInterestRateMinMax = new System.Windows.Forms.Label();
            this._dateCreatedValueLabel = new System.Windows.Forms.Label();
            this.dateTimeDateCreated = new System.Windows.Forms.DateTimePicker();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.tabControlSavingsDetails.SuspendLayout();
            this.tabPageSavingsEvents.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudNumberOfPeriods)).BeginInit();
            this.flowLayoutPanel9.SuspendLayout();
            this.pnlSavingsButtons.SuspendLayout();
            this.groupBoxSaving.SuspendLayout();
            this.tableLayoutPanel5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudExpectedAmount)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDownInitialAmount)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDownInterestRate)).BeginInit();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControlSavingsDetails
            // 
            resources.ApplyResources(this.tabControlSavingsDetails, "tabControlSavingsDetails");
            this.tabControlSavingsDetails.Controls.Add(this.tabPageSavingsEvents);
            this.tabControlSavingsDetails.Name = "tabControlSavingsDetails";
            this.tabControlSavingsDetails.SelectedIndex = 0;
            // 
            // tabPageSavingsEvents
            // 
            resources.ApplyResources(this.tabPageSavingsEvents, "tabPageSavingsEvents");
            this.tabPageSavingsEvents.Controls.Add(this.lvSavingEvent);
            this.tabPageSavingsEvents.Name = "tabPageSavingsEvents";
            // 
            // lvSavingEvent
            // 
            resources.ApplyResources(this.lvSavingEvent, "lvSavingEvent");
            this.lvSavingEvent.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader21,
            this.columnHeader22,
            this.columnHeader23,
            this.columnHeader27,
            this.columnHeader15,
            this.columnHeader28,
            this.columnHeader29,
            this.columnHeader24,
            this.colCancelDate});
            this.lvSavingEvent.FullRowSelect = true;
            this.lvSavingEvent.GridLines = true;
            this.lvSavingEvent.Name = "lvSavingEvent";
            this.lvSavingEvent.UseCompatibleStateImageBehavior = false;
            this.lvSavingEvent.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader21
            // 
            resources.ApplyResources(this.columnHeader21, "columnHeader21");
            // 
            // columnHeader22
            // 
            resources.ApplyResources(this.columnHeader22, "columnHeader22");
            // 
            // columnHeader23
            // 
            resources.ApplyResources(this.columnHeader23, "columnHeader23");
            // 
            // columnHeader27
            // 
            resources.ApplyResources(this.columnHeader27, "columnHeader27");
            // 
            // columnHeader15
            // 
            resources.ApplyResources(this.columnHeader15, "columnHeader15");
            // 
            // columnHeader28
            // 
            resources.ApplyResources(this.columnHeader28, "columnHeader28");
            // 
            // columnHeader29
            // 
            resources.ApplyResources(this.columnHeader29, "columnHeader29");
            // 
            // columnHeader24
            // 
            resources.ApplyResources(this.columnHeader24, "columnHeader24");
            // 
            // colCancelDate
            // 
            resources.ApplyResources(this.colCancelDate, "colCancelDate");
            // 
            // dtpTernDepositDateEnd
            // 
            resources.ApplyResources(this.dtpTernDepositDateEnd, "dtpTernDepositDateEnd");
            this.dtpTernDepositDateEnd.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpTernDepositDateEnd.Name = "dtpTernDepositDateEnd";
            // 
            // lblTernDepositDateStarted
            // 
            resources.ApplyResources(this.lblTernDepositDateStarted, "lblTernDepositDateStarted");
            this.lblTernDepositDateStarted.Name = "lblTernDepositDateStarted";
            // 
            // lblNumberOfPeriods
            // 
            resources.ApplyResources(this.lblNumberOfPeriods, "lblNumberOfPeriods");
            this.lblNumberOfPeriods.Name = "lblNumberOfPeriods";
            // 
            // nudNumberOfPeriods
            // 
            resources.ApplyResources(this.nudNumberOfPeriods, "nudNumberOfPeriods");
            this.nudNumberOfPeriods.Name = "nudNumberOfPeriods";
            this.nudNumberOfPeriods.ValueChanged += new System.EventHandler(this.PeriodChanged);
            // 
            // lblLimitOfTermDepositPeriod
            // 
            resources.ApplyResources(this.lblLimitOfTermDepositPeriod, "lblLimitOfTermDepositPeriod");
            this.lblLimitOfTermDepositPeriod.Name = "lblLimitOfTermDepositPeriod";
            // 
            // dtpTernDepositDateStarted
            // 
            resources.ApplyResources(this.dtpTernDepositDateStarted, "dtpTernDepositDateStarted");
            this.dtpTernDepositDateStarted.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpTernDepositDateStarted.Name = "dtpTernDepositDateStarted";
            this.dtpTernDepositDateStarted.ValueChanged += new System.EventHandler(this.PeriodValueChanged);
            // 
            // lblTernDepositDateEnd
            // 
            resources.ApplyResources(this.lblTernDepositDateEnd, "lblTernDepositDateEnd");
            this.lblTernDepositDateEnd.Name = "lblTernDepositDateEnd";
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // flowLayoutPanel9
            // 
            resources.ApplyResources(this.flowLayoutPanel9, "flowLayoutPanel9");
            this.flowLayoutPanel9.Controls.Add(this.buttonSaveSaving);
            this.flowLayoutPanel9.Controls.Add(this.pnlSavingsButtons);
            this.flowLayoutPanel9.Controls.Add(this.btnPrintSavings);
            this.flowLayoutPanel9.Controls.Add(this.buttonStart);
            this.flowLayoutPanel9.Controls.Add(this.buttonUpdate);
            this.flowLayoutPanel9.Controls.Add(this.buttonRenew);
            this.flowLayoutPanel9.Name = "flowLayoutPanel9";
            // 
            // buttonSaveSaving
            // 
            resources.ApplyResources(this.buttonSaveSaving, "buttonSaveSaving");
            this.buttonSaveSaving.Name = "buttonSaveSaving";
            this.buttonSaveSaving.Click += new System.EventHandler(this.Save);
            // 
            // pnlSavingsButtons
            // 
            resources.ApplyResources(this.pnlSavingsButtons, "pnlSavingsButtons");
            this.pnlSavingsButtons.Controls.Add(this.buttonSavingsClose);
            this.pnlSavingsButtons.Controls.Add(this.btCancelLastSavingEvent);
            this.pnlSavingsButtons.Name = "pnlSavingsButtons";
            // 
            // buttonSavingsClose
            // 
            resources.ApplyResources(this.buttonSavingsClose, "buttonSavingsClose");
            this.buttonSavingsClose.Name = "buttonSavingsClose";
            this.buttonSavingsClose.Click += new System.EventHandler(this.Close);
            // 
            // btCancelLastSavingEvent
            // 
            resources.ApplyResources(this.btCancelLastSavingEvent, "btCancelLastSavingEvent");
            this.btCancelLastSavingEvent.Name = "btCancelLastSavingEvent";
            this.btCancelLastSavingEvent.Click += new System.EventHandler(this.CancelLastEvent);
            // 
            // btnPrintSavings
            // 
            resources.ApplyResources(this.btnPrintSavings, "btnPrintSavings");
            this.btnPrintSavings.Image = global::OpenCBS.GUI.Properties.Resources.bullet_arrow_down;
            this.btnPrintSavings.Name = "btnPrintSavings";
            this.btnPrintSavings.ReportInitializer = null;
            this.btnPrintSavings.UseVisualStyleBackColor = true;
            // 
            // buttonStart
            // 
            resources.ApplyResources(this.buttonStart, "buttonStart");
            this.buttonStart.Name = "buttonStart";
            this.buttonStart.Click += new System.EventHandler(this.Start);
            // 
            // buttonUpdate
            // 
            resources.ApplyResources(this.buttonUpdate, "buttonUpdate");
            this.buttonUpdate.Name = "buttonUpdate";
            this.buttonUpdate.Click += new System.EventHandler(this.Update);
            // 
            // buttonRenew
            // 
            resources.ApplyResources(this.buttonRenew, "buttonRenew");
            this.buttonRenew.Name = "buttonRenew";
            this.buttonRenew.Click += new System.EventHandler(this.Renew);
            // 
            // groupBoxSaving
            // 
            resources.ApplyResources(this.groupBoxSaving, "groupBoxSaving");
            this.groupBoxSaving.Controls.Add(this.tableLayoutPanel5);
            this.groupBoxSaving.Name = "groupBoxSaving";
            this.groupBoxSaving.TabStop = false;
            // 
            // tableLayoutPanel5
            // 
            resources.ApplyResources(this.tableLayoutPanel5, "tableLayoutPanel5");
            this.tableLayoutPanel5.Controls.Add(this.dtpTernDepositDateEnd, 4, 5);
            this.tableLayoutPanel5.Controls.Add(this.nudExpectedAmount, 1, 5);
            this.tableLayoutPanel5.Controls.Add(this.label9, 0, 0);
            this.tableLayoutPanel5.Controls.Add(this.lblTernDepositDateStarted, 3, 3);
            this.tableLayoutPanel5.Controls.Add(this.label3, 8, 1);
            this.tableLayoutPanel5.Controls.Add(this.lblTernDepositDateEnd, 3, 5);
            this.tableLayoutPanel5.Controls.Add(this.dtpTernDepositDateStarted, 4, 3);
            this.tableLayoutPanel5.Controls.Add(this.tBSavingCode, 1, 0);
            this.tableLayoutPanel5.Controls.Add(this.label2, 0, 5);
            this.tableLayoutPanel5.Controls.Add(this.lblLimitOfTermDepositPeriod, 5, 2);
            this.tableLayoutPanel5.Controls.Add(this.nudNumberOfPeriods, 4, 2);
            this.tableLayoutPanel5.Controls.Add(this.lblNumberOfPeriods, 3, 2);
            this.tableLayoutPanel5.Controls.Add(this.lBSavingBalance, 3, 0);
            this.tableLayoutPanel5.Controls.Add(this.lbSavingBalanceValue, 4, 0);
            this.tableLayoutPanel5.Controls.Add(this.lBSavingAvBalance, 3, 1);
            this.tableLayoutPanel5.Controls.Add(this.lbSavingAvBalanceValue, 4, 1);
            this.tableLayoutPanel5.Controls.Add(this._currentAccountLabel, 6, 1);
            this.tableLayoutPanel5.Controls.Add(this._currentAccountTextBox, 7, 1);
            this.tableLayoutPanel5.Controls.Add(this._dateCreatedLabel, 6, 0);
            this.tableLayoutPanel5.Controls.Add(this.label1, 0, 1);
            this.tableLayoutPanel5.Controls.Add(this.cmbSavingsOfficer, 1, 1);
            this.tableLayoutPanel5.Controls.Add(this.labelInitialAmount, 0, 2);
            this.tableLayoutPanel5.Controls.Add(this.nudDownInitialAmount, 1, 2);
            this.tableLayoutPanel5.Controls.Add(this.lbInitialAmountMinMax, 2, 2);
            this.tableLayoutPanel5.Controls.Add(this.labelInterestRate, 0, 3);
            this.tableLayoutPanel5.Controls.Add(this.nudDownInterestRate, 1, 3);
            this.tableLayoutPanel5.Controls.Add(this.lbInterestRateMinMax, 2, 3);
            this.tableLayoutPanel5.Controls.Add(this._dateCreatedValueLabel, 0, 6);
            this.tableLayoutPanel5.Controls.Add(this.dateTimeDateCreated, 7, 0);
            this.tableLayoutPanel5.Name = "tableLayoutPanel5";
            // 
            // nudExpectedAmount
            // 
            resources.ApplyResources(this.nudExpectedAmount, "nudExpectedAmount");
            this.nudExpectedAmount.DecimalPlaces = 2;
            this.nudExpectedAmount.Maximum = new decimal(new int[] {
            999999999,
            0,
            0,
            0});
            this.nudExpectedAmount.Name = "nudExpectedAmount";
            // 
            // label9
            // 
            resources.ApplyResources(this.label9, "label9");
            this.label9.BackColor = System.Drawing.Color.Transparent;
            this.label9.Name = "label9";
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // tBSavingCode
            // 
            resources.ApplyResources(this.tBSavingCode, "tBSavingCode");
            this.tableLayoutPanel5.SetColumnSpan(this.tBSavingCode, 2);
            this.tBSavingCode.Name = "tBSavingCode";
            this.tBSavingCode.ReadOnly = true;
            // 
            // lBSavingBalance
            // 
            resources.ApplyResources(this.lBSavingBalance, "lBSavingBalance");
            this.lBSavingBalance.Name = "lBSavingBalance";
            // 
            // lbSavingBalanceValue
            // 
            resources.ApplyResources(this.lbSavingBalanceValue, "lbSavingBalanceValue");
            this.lbSavingBalanceValue.Name = "lbSavingBalanceValue";
            // 
            // lBSavingAvBalance
            // 
            resources.ApplyResources(this.lBSavingAvBalance, "lBSavingAvBalance");
            this.lBSavingAvBalance.Name = "lBSavingAvBalance";
            // 
            // lbSavingAvBalanceValue
            // 
            resources.ApplyResources(this.lbSavingAvBalanceValue, "lbSavingAvBalanceValue");
            this.lbSavingAvBalanceValue.Name = "lbSavingAvBalanceValue";
            // 
            // _currentAccountLabel
            // 
            resources.ApplyResources(this._currentAccountLabel, "_currentAccountLabel");
            this._currentAccountLabel.Name = "_currentAccountLabel";
            // 
            // _currentAccountTextBox
            // 
            resources.ApplyResources(this._currentAccountTextBox, "_currentAccountTextBox");
            this._currentAccountTextBox.Name = "_currentAccountTextBox";
            this._currentAccountTextBox.ReadOnly = true;
            // 
            // _dateCreatedLabel
            // 
            resources.ApplyResources(this._dateCreatedLabel, "_dateCreatedLabel");
            this._dateCreatedLabel.Name = "_dateCreatedLabel";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Name = "label1";
            // 
            // cmbSavingsOfficer
            // 
            resources.ApplyResources(this.cmbSavingsOfficer, "cmbSavingsOfficer");
            this.tableLayoutPanel5.SetColumnSpan(this.cmbSavingsOfficer, 2);
            this.cmbSavingsOfficer.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSavingsOfficer.FormattingEnabled = true;
            this.cmbSavingsOfficer.Name = "cmbSavingsOfficer";
            this.cmbSavingsOfficer.SelectedIndexChanged += new System.EventHandler(this.OffecerChanged);
            // 
            // labelInitialAmount
            // 
            resources.ApplyResources(this.labelInitialAmount, "labelInitialAmount");
            this.labelInitialAmount.BackColor = System.Drawing.Color.Transparent;
            this.labelInitialAmount.Name = "labelInitialAmount";
            // 
            // nudDownInitialAmount
            // 
            resources.ApplyResources(this.nudDownInitialAmount, "nudDownInitialAmount");
            this.nudDownInitialAmount.DecimalPlaces = 2;
            this.nudDownInitialAmount.Maximum = new decimal(new int[] {
            999999999,
            0,
            0,
            0});
            this.nudDownInitialAmount.Name = "nudDownInitialAmount";
            this.nudDownInitialAmount.ValueChanged += new System.EventHandler(this.CalculateExpectedAmount);
            // 
            // lbInitialAmountMinMax
            // 
            resources.ApplyResources(this.lbInitialAmountMinMax, "lbInitialAmountMinMax");
            this.lbInitialAmountMinMax.Name = "lbInitialAmountMinMax";
            // 
            // labelInterestRate
            // 
            resources.ApplyResources(this.labelInterestRate, "labelInterestRate");
            this.labelInterestRate.BackColor = System.Drawing.Color.Transparent;
            this.labelInterestRate.Name = "labelInterestRate";
            // 
            // nudDownInterestRate
            // 
            resources.ApplyResources(this.nudDownInterestRate, "nudDownInterestRate");
            this.nudDownInterestRate.DecimalPlaces = 2;
            this.nudDownInterestRate.Maximum = new decimal(new int[] {
            999999999,
            0,
            0,
            0});
            this.nudDownInterestRate.Name = "nudDownInterestRate";
            this.nudDownInterestRate.ValueChanged += new System.EventHandler(this.CalculateExpectedAmount);
            // 
            // lbInterestRateMinMax
            // 
            resources.ApplyResources(this.lbInterestRateMinMax, "lbInterestRateMinMax");
            this.lbInterestRateMinMax.Name = "lbInterestRateMinMax";
            // 
            // _dateCreatedValueLabel
            // 
            resources.ApplyResources(this._dateCreatedValueLabel, "_dateCreatedValueLabel");
            this._dateCreatedValueLabel.Name = "_dateCreatedValueLabel";
            // 
            // dateTimeDateCreated
            // 
            resources.ApplyResources(this.dateTimeDateCreated, "dateTimeDateCreated");
            this.dateTimeDateCreated.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dateTimeDateCreated.Name = "dateTimeDateCreated";
            // 
            // tableLayoutPanel1
            // 
            resources.ApplyResources(this.tableLayoutPanel1, "tableLayoutPanel1");
            this.tableLayoutPanel1.Controls.Add(this.groupBoxSaving, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.tabControlSavingsDetails, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanel9, 0, 1);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            // 
            // TernDepositUserControl
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "TernDepositUserControl";
            this.tabControlSavingsDetails.ResumeLayout(false);
            this.tabPageSavingsEvents.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.nudNumberOfPeriods)).EndInit();
            this.flowLayoutPanel9.ResumeLayout(false);
            this.flowLayoutPanel9.PerformLayout();
            this.pnlSavingsButtons.ResumeLayout(false);
            this.groupBoxSaving.ResumeLayout(false);
            this.tableLayoutPanel5.ResumeLayout(false);
            this.tableLayoutPanel5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudExpectedAmount)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDownInitialAmount)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDownInterestRate)).EndInit();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControlSavingsDetails;
        private System.Windows.Forms.DateTimePicker dtpTernDepositDateEnd;
        private System.Windows.Forms.Label lblTernDepositDateStarted;
        private System.Windows.Forms.Label lblNumberOfPeriods;
        private System.Windows.Forms.NumericUpDown nudNumberOfPeriods;
        private System.Windows.Forms.Label lblLimitOfTermDepositPeriod;
        private System.Windows.Forms.DateTimePicker dtpTernDepositDateStarted;
        private System.Windows.Forms.Label lblTernDepositDateEnd;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TabPage tabPageSavingsEvents;
        private System.Windows.Forms.ListView lvSavingEvent;
        private System.Windows.Forms.ColumnHeader columnHeader21;
        private System.Windows.Forms.ColumnHeader columnHeader22;
        private System.Windows.Forms.ColumnHeader columnHeader23;
        private System.Windows.Forms.ColumnHeader columnHeader27;
        private System.Windows.Forms.ColumnHeader columnHeader15;
        private System.Windows.Forms.ColumnHeader columnHeader28;
        private System.Windows.Forms.ColumnHeader columnHeader29;
        private System.Windows.Forms.ColumnHeader columnHeader24;
        private System.Windows.Forms.ColumnHeader colCancelDate;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel9;
        private System.Windows.Forms.Button buttonSaveSaving;
        private System.Windows.Forms.FlowLayoutPanel pnlSavingsButtons;
        private System.Windows.Forms.Button buttonSavingsClose;
        private System.Windows.Forms.Button btCancelLastSavingEvent;
        private PrintButton btnPrintSavings;
        private System.Windows.Forms.GroupBox groupBoxSaving;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel5;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox tBSavingCode;
        private System.Windows.Forms.Label lBSavingBalance;
        private System.Windows.Forms.Label lbSavingBalanceValue;
        private System.Windows.Forms.Label lBSavingAvBalance;
        private System.Windows.Forms.Label lbSavingAvBalanceValue;
        private System.Windows.Forms.Label _currentAccountLabel;
        private System.Windows.Forms.TextBox _currentAccountTextBox;
        private System.Windows.Forms.Label _dateCreatedLabel;
        private System.Windows.Forms.Label _dateCreatedValueLabel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbSavingsOfficer;
        private System.Windows.Forms.Label labelInitialAmount;
        private System.Windows.Forms.NumericUpDown nudDownInitialAmount;
        private System.Windows.Forms.Label lbInitialAmountMinMax;
        private System.Windows.Forms.Label labelInterestRate;
        private System.Windows.Forms.NumericUpDown nudDownInterestRate;
        private System.Windows.Forms.Label lbInterestRateMinMax;
        private System.Windows.Forms.NumericUpDown nudExpectedAmount;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.DateTimePicker dateTimeDateCreated;
        private System.Windows.Forms.Button buttonStart;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonRenew;
    }
}
