using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.CommandData;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Clients;
using OpenCBS.CoreDomain.Contracts.Collaterals;
using OpenCBS.CoreDomain.Contracts.Guarantees;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.CoreDomain.Contracts.Loans.Installments;
using OpenCBS.CoreDomain.Contracts.Savings;
using OpenCBS.CoreDomain.FundingLines;
using OpenCBS.CoreDomain.Online;
using OpenCBS.CoreDomain.Products;
using OpenCBS.Enums;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Extensions;
using OpenCBS.GUI.Tools;
using OpenCBS.GUI.UserControl;
using OpenCBS.MultiLanguageRessources;
using OpenCBS.Services;
using OpenCBS.Shared;
using OpenCBS.Shared.Settings;

namespace OpenCBS.GUI.Clients
{
    using ML = MultiLanguageStrings;
    public partial class LoanCalculator : SweetForm
    {
        #region *** Fields ***
        private LoanProduct _product;
        private Group _group;
        private Loan _credit;
        private Person _person;
        private readonly Form _mdiParent;

        private OClientTypes _oClientType;
        private readonly bool _closeFormAfterSave;
        private List<LoanShare> _loanShares;
        private FundingLine _fundingLine;
        private Corporate _corporate;
        private List<FollowUp> _followUpList = new List<FollowUp>();
        private bool _toChangeAlignDate;
        private int? _gracePeriodOfLateFees;
        private string _title;
        private Client _client;
        private DateTime _firstInstallmentDate;

        private List<Guarantor> _listGuarantors;
        private List<ContractCollateral> _collaterals;
        private string _typeOfFee;

        private DateTime _oldDisbursmentDate;
        private DateTime _oldFirstInstalmentDate;

        [ImportMany(typeof(ILoanTabs), RequiredCreationPolicy = CreationPolicy.NonShared)]
        public List<ILoanTabs> LoanTabs { get; set; }

        [ImportMany(typeof(ISavingsTabs), RequiredCreationPolicy = CreationPolicy.NonShared)]
        public List<ISavingsTabs> SavingsExtensions { get; set; }

        [ImportMany(typeof(ILoanDetailsButton), RequiredCreationPolicy = CreationPolicy.NonShared)]
        public List<ILoanDetailsButton> LoanDetailsButtons { get; set; }

        [ImportMany(typeof(IPrintButtonContextMenuStrip), RequiredCreationPolicy = CreationPolicy.NonShared)]
        public List<IPrintButtonContextMenuStrip> PrintButtonContextMenuStrips { get; set; }

        [ImportMany(typeof(ILoanExtension))]
        public List<ILoanExtension> LoanExtensions { get; set; }

        [ImportMany(typeof(ILoanApprovalControl))]
        private Lazy<ILoanApprovalControl, IDictionary<string, object>>[] LoanApprovalControls { get; set; }

        private ILoanApprovalControl _loanApprovalControl;

        private readonly IApplicationController _applicationController;

        #endregion

        private LoanCalculator(IApplicationController applicationController = null)
        {
            InitializeComponent();

            MefContainer.Current.Bind(this);
            _applicationController = applicationController;

            _loanApprovalControl = (
                    from c in LoanApprovalControls
                    where
                        c.Metadata.ContainsKey("Implementation") &&
                        c.Metadata["Implementation"].ToString() != "Default"
                    select c.Value).FirstOrDefault();

            if (_loanApprovalControl == null)
            {
                // Otherwise, find the default one
                _loanApprovalControl = (
                                from c in LoanApprovalControls
                                where
                                    c.Metadata.ContainsKey("Implementation") &&
                                    c.Metadata["Implementation"].ToString() == "Default"
                                select c.Value).FirstOrDefault();
            }
            if (_loanApprovalControl == null)
            {
                throw new Exception("Cannot resolve loan approval container.");
            }
            
            var control = _loanApprovalControl.GetControl();
            control.Dock = DockStyle.Fill;

            this.dtpDateOfFirstInstallment.Format = DateTimePickerFormat.Custom;
            this.dtpDateOfFirstInstallment.CustomFormat = ApplicationSettings.GetInstance("").SHORT_DATE_FORMAT;
            this.dateLoanStart.Format = DateTimePickerFormat.Custom;
            this.dateLoanStart.CustomFormat = ApplicationSettings.GetInstance("").SHORT_DATE_FORMAT;
        }

        public LoanCalculator(
            OClientTypes pClientType,
            Form pMdiParent,
            bool pCloseFormAfterSave,
            IApplicationController applicationController = null)
            : this(applicationController)
        {
            _listGuarantors = new List<Guarantor>();
            _collaterals = new List<ContractCollateral>();
            _loanShares = new List<LoanShare>();
            _closeFormAfterSave = pCloseFormAfterSave;
            _mdiParent = pMdiParent;
            InitControls();
            _oClientType = pClientType;

            if (pClientType == OClientTypes.Person) _person = new Person();
            InitializeTitle("Loan Calculator");
        }

        private void InitControls()
        {
            ApplicationSettings dataParam = ApplicationSettings.GetInstance(string.Empty);
            int decimalPlaces = dataParam.InterestRateDecimalPlaces;
            nudInterestRate.DecimalPlaces = decimalPlaces;

            decimal increment = decimal.One;
            for (int exp = 0; exp < decimalPlaces; exp++)
                increment = decimal.Divide(increment, 10m);
            nudInterestRate.Increment = increment;


            var packages= ServiceProvider.GetProductServices().FindAllPackages(false, OClientTypes.Person);
       
            cmbPackages.DataSource = new BindingSource(packages.ToDictionary(val => val.Name, val => val), null);
            cmbPackages.DisplayMember = "Key";
            cmbPackages.ValueMember = "Value";

            _product = packages.FirstOrDefault();

            InitializeTabPageLoansDetails(_product);

        }

        public LoanCalculator(Person pPerson, Form pMdiParent, IApplicationController applicationController = null)
            : this(applicationController)
        {
            _mdiParent = pMdiParent;
            _person = pPerson;
            _client = pPerson;
            _listGuarantors = new List<Guarantor>();
            _collaterals = new List<ContractCollateral>();
            _loanShares = new List<LoanShare>();

            InitControls();
            _oClientType = OClientTypes.Person;
        }

        private static IServices ServiceProvider
        {
            get { return ServicesProvider.GetInstance(); }
        }

        private void InitializeTitle(string title)
        {
            if (_person != null)
            {
                Text = string.IsNullOrEmpty(title) ? MultiLanguageStrings.GetString(Ressource.ClientForm, "Person.Text") : title;
                if (_person.BadClient)
                {
                    Text += "  " + MultiLanguageStrings.GetString(Ressource.ClientForm, "Bad.Text");
                    lblTitle.BackColor = Color.Red;
                }
                else
                {
                    lblTitle.BackColor = Color.FromArgb(0, 81, 152);
                }
            }
            else if (_group != null)
            {
                Text = string.IsNullOrEmpty(title) ? MultiLanguageStrings.GetString(Ressource.ClientForm, "Group.Text") : title + " - (" + _group.LoanCycle + ")";

                if (_group.BadClient)
                {
                    Text += "  " + MultiLanguageStrings.GetString(Ressource.ClientForm, "Bad.Text");
                    lblTitle.BackColor = Color.Red;
                }
                else
                {
                    lblTitle.BackColor = Color.FromArgb(0, 81, 152);
                }
            }
            else
            {
                Text = string.IsNullOrEmpty(title) ? MultiLanguageStrings.GetString(Ressource.ClientForm, "Corporate.Text") : title;
                if (_corporate.BadClient)
                {
                    Text += "  " + MultiLanguageStrings.GetString(Ressource.ClientForm, "Bad.Text");
                    lblTitle.BackColor = Color.Red;
                }
                else
                {
                    lblTitle.BackColor = Color.FromArgb(0, 81, 152);
                }
            }
            _title = Text;
        }

        private void InitializeTabPageLoansDetails(LoanProduct pPackage)
        {
            _credit = new Loan(User.CurrentUser, ServicesProvider.GetInstance().GetGeneralSettings(),
                ServicesProvider.GetInstance().GetNonWorkingDate(),
                CoreDomainProvider.GetInstance().GetProvisioningTable());
            _credit.Product = pPackage;

            nudLoanAmount.Text = string.Empty;
            InitInstallmentType(pPackage.InstallmentType);
            InitScheduleType(pPackage.LoanType, pPackage.ScriptName);
            InitializePackageNumberOfInstallments(_credit,true);
            InitializePackageGracePeriod(_credit.Product, true);
            FillInstallmentListForScheduleControl("loanDetailsScheduleControl", _credit);
            InitializeFundingLine();
            _credit.FundingLine = _fundingLine;
            _credit.LoanOfficer = User.CurrentUser;
            labelCurrencyValue.Text = pPackage.Currency.Name;
            SetPackageValuesForLoanDetails(_credit, true);
            InitializeEntryFees();
        }

        private void InitInstallmentType(InstallmentType installmentType)
        {
            _installmentTypeComboBox.Items.Clear();
            var items = ServicesProvider.GetInstance().GetProductServices().FindAllInstallmentTypes();
            var selectedIndex = 0;
            var i = 0;
            foreach (var item in items)
            {
                _installmentTypeComboBox.Items.Add(item);
                if (item.Id == installmentType.Id)
                {
                    selectedIndex = i;
                }
                i++;
            }
            _installmentTypeComboBox.SelectedIndex = selectedIndex;
            _installmentTypeComboBox.Enabled = installmentType.Id == 0;

            if (_credit.InstallmentType == null)
            {
                _credit.InstallmentType = (InstallmentType)_installmentTypeComboBox.SelectedItem;
            }
        }

        private void InitScheduleType(OLoanTypes loanType, string scriptName)
        {
            _scheduleTypeComboBox.Items.Clear();
            _scheduleTypeComboBox.Items.Add(GetString("FrmAddLoanProduct", "Flat.Text"));
            _scheduleTypeComboBox.Items.Add(GetString("FrmAddLoanProduct", "DecliningFixedPrincipal.Text"));
            _scheduleTypeComboBox.Items.Add(GetString("FrmAddLoanProduct", "DecliningFixedInstallments.Text"));

            var scripts = ServicesProvider.GetInstance().GetProductServices().SelectLoanProuctTypeScripts();
            foreach (var script in scripts)
            {
                _scheduleTypeComboBox.Items.Add(script);
            }

            var scheduleGeneratorNames =
                ServicesProvider.GetInstance().GetContractServices().GetScheduleGeneratorNames();
            foreach (var name in scheduleGeneratorNames)
            {
                _scheduleTypeComboBox.Items.Add(name);
            }

            switch (loanType)
            {
                case OLoanTypes.All:
                    _scheduleTypeComboBox.SelectedIndex = 0;
                    break;

                case OLoanTypes.Flat:
                    _scheduleTypeComboBox.SelectedIndex = 0;
                    break;

                case OLoanTypes.DecliningFixedPrincipal:
                    _scheduleTypeComboBox.SelectedIndex = 1;
                    break;

                case OLoanTypes.DecliningFixedInstallments:
                    _scheduleTypeComboBox.SelectedIndex = 2;
                    break;

                case OLoanTypes.CustomLoanType:
                    _scheduleTypeComboBox.Text = scriptName;
                    break;
            }

            _scheduleTypeComboBox.Enabled = loanType == OLoanTypes.All;
        }

        private void InitializeFundingLine()
        {
            _fundingLine = _product.FundingLine;
        }

        private void InitializeLabelMinMax()
        {
            labelLoanAmountMinMax.Text = String.Empty;
            lbLoanInterestRateMinMax.Text = String.Empty;


            labelLoanNbOfInstallmentsMinMax.Text = String.Empty;
            labelLoanGracePeriodMinMax.Text = String.Empty;
        }

        private void InitializeEntryFees()
        {
            lvEntryFees.Items.Clear();

            _credit.LoanEntryFeesList =
                ServicesProvider.GetInstance().GetContractServices().GetDefaultLoanEntryFees(_credit, _client);

            foreach (LoanEntryFee entryFee in _credit.LoanEntryFeesList)
            {
                ListViewItem item = new ListViewItem(entryFee.ProductEntryFee.Name)
                {
                    UseItemStyleForSubItems = true,
                    Tag = entryFee
                };

                OCurrency feeValue = entryFee.FeeValue < entryFee.ProductEntryFee.Min ? entryFee.ProductEntryFee.Min : entryFee.FeeValue;
                if (entryFee.ProductEntryFee.IsRate)
                    item.SubItems.Add(feeValue.GetFormatedValue(true));
                else
                    item.SubItems.Add(feeValue.GetFormatedValue(_credit.Product.Currency.UseCents));

                _typeOfFee = entryFee.ProductEntryFee.IsRate ? "%" : _credit.Product.Currency.Name;

                item.SubItems.Add(_typeOfFee);
                OCurrency loanAmount = nudLoanAmount.Value;
                OCurrency amount;
                if (entryFee.ProductEntryFee.IsRate)
                    amount = loanAmount.Value * feeValue.Value / 100;
                else
                    amount = feeValue.Value;

                OCurrency calculated = amount;

                if (entryFee.ProductEntryFee.MaxSum.HasValue
                    && entryFee.ProductEntryFee.MaxSum > 0
                    && amount > entryFee.ProductEntryFee.MaxSum)
                {
                    amount = entryFee.ProductEntryFee.MaxSum;
                    entryFee.FeeValue = amount.Value * 100 / nudLoanAmount.Value;
                }
                item.SubItems.Add(calculated.GetFormatedValue(_credit.Product.Currency.UseCents));
                item.SubItems.Add(((OCurrency)entryFee.ProductEntryFee.MaxSum).GetFormatedValue(_credit.Product.Currency.UseCents));
                item.SubItems.Add(amount.GetFormatedValue(_credit.Product.Currency.UseCents));

                lvEntryFees.Items.Add(item);
            }

            lvEntryFees.Columns[2].Text = string.Format("% / {0}", _credit.Product.Currency.Name);
            string total = MultiLanguageStrings.GetString(Ressource.ClientForm, "TotalEntryFees");
            ListViewItem itemTotal = new ListViewItem("")
            {
                UseItemStyleForSubItems = true,
                Tag = "TotalFees"
            };
            itemTotal.Font = new Font("Arial", 9F, FontStyle.Bold);

            itemTotal.SubItems.Add("");
            itemTotal.SubItems.Add(total);
            itemTotal.SubItems.Add("");
            itemTotal.SubItems.Add("");
            itemTotal.SubItems.Add("");
            itemTotal.SubItems.Add("");
            lvEntryFees.Items.Add(itemTotal);
            ShowTotalFeesInListViewByNudLoanAmount();
        }

        private void SetPackageValuesForLoanDetails(Loan pLoan, bool pForCreation)
        {
            gbxLoanDetails.Text = MultiLanguageStrings.GetString(Ressource.CreditContractForm, "LoanType.Text") + pLoan.Product.Name;
            if (pForCreation)
            {
                dateLoanStart.Value = TimeProvider.Today;
            }
            else
            {
                _toChangeAlignDate = false;
                dateLoanStart.Value = _credit.StartDate;
                _toChangeAlignDate = true;
            }
            _oldDisbursmentDate = dateLoanStart.Value;
            dtpDateOfFirstInstallment.Value = pForCreation ? GetFirstInstallmentDate() : _credit.FirstInstallmentDate;
            _oldFirstInstalmentDate = dtpDateOfFirstInstallment.Value;
            InitializeLabelMinMax();
            InitializePackageGracePeriod(pLoan.Product, pForCreation);
            InitializeAmount(pLoan, pForCreation);
            InitializePackageInterestRate(pLoan, pForCreation);
            InitializePackageNumberOfInstallments(pLoan, pForCreation);
        }

        private void InitializePackageNumberOfInstallments(Loan credit, bool pForCreation)
        {
            if (pForCreation)
            {
                nudLoanNbOfInstallments.Enabled = true;
                if (credit.Product.CycleId == null)//if product doesn't use a loan cycle
                {
                    nudLoanNbOfInstallments.Enabled = true;
                    if (credit.Product.NbOfInstallments.HasValue)
                    {
                        nudLoanNbOfInstallments.Minimum = credit.Product.NbOfInstallments.Value;
                        nudLoanNbOfInstallments.Maximum = credit.Product.NbOfInstallments.Value;
                        labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                         credit.Product.NbOfInstallments.Value,
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                         credit.Product.NbOfInstallments.Value);
                        nudLoanNbOfInstallments.Value = credit.Product.NbOfInstallments.Value;
                    }
                    else
                    {
                        nudLoanNbOfInstallments.Minimum = credit.Product.NbOfInstallmentsMin.Value;
                        nudLoanNbOfInstallments.Maximum = credit.Product.NbOfInstallmentsMax.Value;
                        labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                         credit.Product.NbOfInstallmentsMin.Value,
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                         credit.Product.NbOfInstallmentsMax.Value);
                        nudLoanNbOfInstallments.Value = credit.Product.NbOfInstallmentsMin.Value;
                    }
                }
                else //product uses a loan cycle
                {
                    nudLoanNbOfInstallments.Minimum = credit.Product.NbOfInstallmentsMin.Value;
                    nudLoanNbOfInstallments.Maximum = credit.Product.NbOfInstallmentsMax.Value;
                    labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                     MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                     credit.Product.NbOfInstallmentsMin.Value,
                     MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                     credit.Product.NbOfInstallmentsMax.Value);
                    nudLoanNbOfInstallments.Value = credit.Product.NbOfInstallmentsMin.Value;
                }
            }
            else//it is an existing contract
            {
                if (credit.Product.CycleId == null)//contract doesn't use loan cycles
                {
                    if (!credit.Product.NbOfInstallments.HasValue)//if it is range value
                    {
                        try
                        {
                            nudLoanNbOfInstallments.Minimum = credit.Product.NbOfInstallmentsMin.Value;
                            nudLoanNbOfInstallments.Maximum = credit.Product.NbOfInstallmentsMax.Value;
                            labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                             MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                             credit.Product.NbOfInstallmentsMin.Value,
                             MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                             credit.Product.NbOfInstallmentsMax.Value);
                            nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                        }
                        catch
                        {
                            nudLoanNbOfInstallments.Minimum = nudLoanNbOfInstallments.Maximum = credit.NbOfInstallments;
                            nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                        }
                    }
                    else
                    {
                        try
                        {
                            nudLoanNbOfInstallments.Minimum = credit.Product.NbOfInstallments.Value;
                            nudLoanNbOfInstallments.Maximum = credit.Product.NbOfInstallments.Value;
                            labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                             MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                             credit.Product.NbOfInstallments.Value,
                             MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                             credit.Product.NbOfInstallments.Value);
                            nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                        }
                        catch
                        {
                            nudLoanNbOfInstallments.Minimum = nudLoanNbOfInstallments.Maximum = credit.NbOfInstallments;
                            nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                        }
                    }
                }
                else //contract uses loan cycle
                {
                    try
                    {
                        nudLoanNbOfInstallments.Minimum = credit.NmbOfInstallmentsMin.Value;
                        nudLoanNbOfInstallments.Maximum = credit.NmbOfInstallmentsMin.Value;
                        labelLoanNbOfInstallmentsMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                         credit.Product.NbOfInstallmentsMin.Value,
                         MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                         credit.Product.NbOfInstallmentsMax.Value);
                        nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                    }
                    catch
                    {
                        nudLoanNbOfInstallments.Minimum = nudLoanNbOfInstallments.Maximum = credit.NbOfInstallments;
                        nudLoanNbOfInstallments.Value = credit.NbOfInstallments;
                    }
                }
            }
        }

        private void InitializePackageInterestRate(Loan credit, bool pForCreation)
        {
            LoanProduct creditProduct = credit.Product;
            string annualType = "";

            if (pForCreation) //if it is new contract
            {
                nudInterestRate.Enabled = true;
                if (!creditProduct.UseLoanCycle) //if product doesn't use any loan cycles
                {
                    if (!creditProduct.InterestRate.HasValue) //if interest rate is a range value
                    {
                        decimal? interestRateMin = creditProduct.InterestRateMin * 100;
                        decimal? interestRateMax = creditProduct.InterestRateMax * 100;
                        nudInterestRate.Minimum = interestRateMin.Value;
                        nudInterestRate.Maximum = interestRateMax.Value;
                        lbLoanInterestRateMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                            annualType + MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMin.Value, false),
                            MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMax.Value, false));
                        nudInterestRate.Value = interestRateMin.Value;
                    }
                    else// if interest rate is a fixed value
                    {
                        decimal? interestRate = creditProduct.InterestRate * 100;
                        nudInterestRate.Minimum = nudInterestRate.Maximum = creditProduct.InterestRate.Value * 100;
                        nudInterestRate.Value = interestRate.Value;
                        lbLoanInterestRateMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                            annualType + MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRate.Value, false),
                            MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRate.Value, false));
                    }
                }
                else //if product uses a loan cycle
                {
                    decimal? interestRateMin = creditProduct.InterestRateMin * 100;
                    decimal? interestRateMax = creditProduct.InterestRateMax * 100;
                    nudInterestRate.Minimum = interestRateMin.Value;
                    nudInterestRate.Maximum = interestRateMax.Value;
                    lbLoanInterestRateMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                        annualType + MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                        ServicesHelper.ConvertNullableDecimalToString(interestRateMin.Value, false),
                        MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                        ServicesHelper.ConvertNullableDecimalToString(interestRateMax.Value, false));
                    nudInterestRate.Value = interestRateMin.Value;
                }
            }
            else // if it is an existing contract
            {
                //if contract doesn't use a loan cycle
                if (credit.LoanCycle == null && credit.InterestRateMin == null && credit.InterestRateMax == null)
                {
                    try
                    {
                        decimal? interestRateMin = creditProduct.InterestRateMin * 100;
                        decimal? interestRateMax = creditProduct.InterestRateMax * 100;
                        nudInterestRate.Minimum = interestRateMin.Value;
                        nudInterestRate.Maximum = interestRateMax.Value;
                        lbLoanInterestRateMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                            annualType + MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMin.Value, false),
                            MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMax.Value, false));
                        nudInterestRate.Value = credit.InterestRate * 100;
                    }
                    catch
                    {
                        nudInterestRate.Minimum = nudInterestRate.Maximum = credit.InterestRate * 100;
                        nudInterestRate.Value = credit.InterestRate * 100;
                    }

                }
                else //contract uses a loan cycle
                {
                    try
                    {
                        decimal? interestRateMin = creditProduct.InterestRateMin * 100;
                        decimal? interestRateMax = creditProduct.InterestRateMax * 100;
                        nudInterestRate.Minimum = interestRateMin.Value;
                        nudInterestRate.Maximum = interestRateMax.Value;
                        lbLoanInterestRateMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                            annualType + MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMin.Value, false),
                            MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                            ServicesHelper.ConvertNullableDecimalToString(interestRateMax.Value, false));
                        nudInterestRate.Value = credit.InterestRate * 100;
                    }
                    catch
                    {
                        nudInterestRate.Minimum = nudInterestRate.Maximum = credit.InterestRate * 100;
                        nudInterestRate.Value = credit.InterestRate * 100;
                    }
                }
            }
        }

        private DecimalValueRange _amountValueRange;
        private void InitializeAmount(Loan credit, bool pForCreation)
        {
            if (pForCreation) //if it is new contract
            {
                nudLoanAmount.DecimalPlaces = (credit.Product.Currency.UseCents || _credit.UseCents) ? 2 : 0;
                if (!credit.Product.UseLoanCycle) //If product doesn't use any loan cycle
                {
                    if (!credit.Product.Amount.HasValue) //if credit amount is a range value
                    {
                        try
                        {
                            _amountValueRange = new DecimalValueRange(credit.Product.AmountMin, credit.Product.AmountMax);
                            nudLoanAmount.Enabled = true;
                            labelLoanAmountMinMax.SetRangeText(_amountValueRange.Min, _amountValueRange.Max);
                            nudLoanAmount.Minimum = _amountValueRange.Min.Value;
                            nudLoanAmount.Maximum = _amountValueRange.Max.Value;
                            nudLoanAmount.Value = _amountValueRange.Min.Value;
                        }
                        catch
                        {
                            nudLoanAmount.Minimum = nudLoanAmount.Maximum = credit.Amount.Value;
                            nudLoanAmount.Value = credit.Amount.Value;
                        }
                    }
                    else //if credit amount is a fixed value
                    {
                        try
                        {
                            _amountValueRange = new DecimalValueRange(credit.Product.Amount);
                            OCurrency valueCurrency = _amountValueRange.Value;
                            decimal value = valueCurrency.Value;
                            labelLoanAmountMinMax.SetRangeText(valueCurrency);
                            nudLoanAmount.Minimum = value;
                            nudLoanAmount.Maximum = value;
                            nudLoanAmount.Value = value;
                            nudLoanAmount.Enabled = false;
                        }
                        catch
                        {
                            nudLoanAmount.Minimum = nudLoanAmount.Maximum = credit.Amount.Value;
                            nudLoanAmount.Value = credit.Amount.Value;
                        }
                    }
                }
                else //if product uses loan cycles
                {
                    _amountValueRange = new DecimalValueRange(credit.Product.AmountMin, credit.Product.AmountMax);
                    nudLoanAmount.Enabled = true;
                    labelLoanAmountMinMax.SetRangeText(_amountValueRange.Min, _amountValueRange.Max);
                    nudLoanAmount.Minimum = _amountValueRange.Min.Value;
                    nudLoanAmount.Maximum = _amountValueRange.Max.Value;
                    nudLoanAmount.Value = _amountValueRange.Min.Value;
                }
            }
            else //if it is an existing contract
            {
                nudLoanAmount.DecimalPlaces = (credit.Product.Currency.UseCents) ? 2 : 0;

                if (credit.LoanCycle == null && !credit.AmountMin.HasValue && !credit.AmountMax.HasValue)//if contract doesn't use any loan cycles
                {
                    if (credit.Product.Amount.HasValue)//if credit amount is a fixed value
                    {
                        try
                        {
                            _amountValueRange = new DecimalValueRange(credit.Product.Amount);
                            labelLoanAmountMinMax.SetRangeText(_amountValueRange.Value);
                            nudLoanAmount.Minimum = nudLoanAmount.Maximum = _amountValueRange.Value.Value;
                        }
                        catch (Exception)
                        {
                            nudLoanAmount.Minimum = nudLoanAmount.Maximum = credit.Amount.Value;
                            nudLoanAmount.Value = credit.Amount.Value;
                        }

                    }
                    else //if credit amount is range vale
                    {
                        try
                        {
                            _amountValueRange = new DecimalValueRange(credit.Product.AmountMin, credit.Product.AmountMax);
                            labelLoanAmountMinMax.SetRangeText(_amountValueRange.Min, _amountValueRange.Max);
                            nudLoanAmount.Minimum = _amountValueRange.Min.Value;
                            nudLoanAmount.Maximum = _amountValueRange.Max.Value;
                            nudLoanAmount.Value = credit.Amount.Value;
                        }
                        catch
                        {
                            nudLoanAmount.Minimum = nudLoanAmount.Maximum = credit.Amount.Value;
                            nudLoanAmount.Value = credit.Amount.Value;
                        }
                    }
                }
                else //if product  uses loan cycles
                {
                    try
                    {
                        _amountValueRange = new DecimalValueRange(credit.AmountMin, credit.AmountMax);
                        nudLoanAmount.Enabled = true;
                        labelLoanAmountMinMax.SetRangeText(_amountValueRange.Min, _amountValueRange.Max);
                        nudLoanAmount.Minimum = _amountValueRange.Min.Value;
                        nudLoanAmount.Maximum = _amountValueRange.Max.Value;
                        nudLoanAmount.Value = credit.Amount.Value;
                    }
                    catch
                    {
                        nudLoanAmount.Minimum = nudLoanAmount.Maximum = credit.Amount.Value;
                        nudLoanAmount.Value = credit.Amount.Value;
                    }
                }
            }
            _credit.Amount = nudLoanAmount.Value;
            nudLoanAmount.Text = nudLoanAmount.Value.ToString(); //Workaround for text emptyness
        }

        private void InitializePackageGracePeriod(LoanProduct pPackage, bool pForCreation)
        {
            if (!pPackage.GracePeriod.HasValue) //Min and Max
            {
                numericUpDownLoanGracePeriod.Enabled = true;
                if (pForCreation)
                {
                    numericUpDownLoanGracePeriod.Minimum = pPackage.GracePeriodMin.Value;
                    numericUpDownLoanGracePeriod.Maximum = pPackage.GracePeriodMax.Value;
                }
                labelLoanGracePeriodMinMax.Text = string.Format("{0}{1}\r\n{2}{3}",
                                MultiLanguageStrings.GetString(Ressource.CreditContractForm, "min.Text"),
                                pPackage.GracePeriodMin.Value,
                                MultiLanguageStrings.GetString(Ressource.CreditContractForm, "max.Text"),
                                pPackage.GracePeriodMax.Value);
                if (!pForCreation) numericUpDownLoanGracePeriod.Value = _credit.GracePeriod.Value;
            }
            else //value
            {

                numericUpDownLoanGracePeriod.Enabled = false;
                numericUpDownLoanGracePeriod.Minimum = pForCreation ? pPackage.GracePeriod.Value : (_credit.GracePeriod ?? 0);
                numericUpDownLoanGracePeriod.Maximum = pForCreation ? pPackage.GracePeriod.Value : (_credit.GracePeriod ?? 0);
                numericUpDownLoanGracePeriod.Value = pForCreation ? pPackage.GracePeriod.Value : (_credit.GracePeriod ?? 0);
            }
        }
        
        private void buttonLoanPreview_Click(object sender, EventArgs e)
        {
            Preview();
        }
        private void btnPrint_Click(object sender, EventArgs e)
        {
            Preview();
            Print();
        }

        private OLoanTypes GetScheduleType()
        {
            switch (_scheduleTypeComboBox.SelectedIndex)
            {
                case 0:
                    return OLoanTypes.Flat;

                case 1:
                    return OLoanTypes.DecliningFixedPrincipal;

                case 2:
                    return OLoanTypes.DecliningFixedInstallments;

                default:
                    return OLoanTypes.CustomLoanType;
            }
        }

        private string GetScriptName()
        {
            if (_scheduleTypeComboBox.SelectedIndex >= 3)
            {
                return _scheduleTypeComboBox.Text;
            }
            return null;
        }

        private Loan CreateAndSetContract()
        {
            _credit.Guarantors = _listGuarantors;
            _credit.Collaterals = _collaterals;
            _credit.LoanShares = _loanShares;
            _credit.Amount = ServicesHelper.ConvertStringToDecimal(nudLoanAmount.Text, _credit.UseCents);
            _credit.StartDate = dateLoanStart.Value;
            _credit.FirstInstallmentDate = dtpDateOfFirstInstallment.Value;
            dtpDateOfFirstInstallment.Value = _credit.FirstInstallmentDate;
            _credit.InterestRate = ServicesHelper.ConvertStringToNullableDecimal(nudInterestRate.Text, true, -1).Value;
            _credit.NbOfInstallments = Convert.ToInt32(nudLoanNbOfInstallments.Value);
            _credit.InstallmentType = (InstallmentType) _installmentTypeComboBox.SelectedItem;
            _credit.ScheduleType = GetScheduleType();
            _credit.ScriptName = GetScriptName();
            if (_credit.ContractStatus == OContractStatus.Pending)
            {
                _credit.AlignDisbursementDate = _credit.CalculateAlignDisbursementDate(_credit.FirstInstallmentDate);
            }
            _credit.EconomicActivityId = 1;
            _credit.GracePeriod = Convert.ToInt32(numericUpDownLoanGracePeriod.Value);
            _credit.GracePeriodOfLateFees = _gracePeriodOfLateFees;

            _credit.LoanOfficer = User.CurrentUser;
            _credit.LoanInitialOfficer = _credit.LoanOfficer;

            if (!_credit.Disbursed && !_credit.ScheduleChangedManually)
                _credit.InstallmentList =
                    ServicesProvider.GetInstance().GetContractServices().SimulateScheduleCreation(_credit) ??
                    new List<Installment>();

            _credit.LoanEntryFeesList = new List<LoanEntryFee>();
            foreach (ListViewItem item in lvEntryFees.Items)
            {
                if (item.Tag is LoanEntryFee)
                {
                    ((LoanEntryFee) item.Tag).FeeValue = decimal.Parse(item.SubItems[1].Text);
                    _credit.LoanEntryFeesList.Add((LoanEntryFee) item.Tag);
                }
            }

            if (_credit.InstallmentList != null && _credit.InstallmentList.Count > 0)
            {
                var firstInstallment = _credit.InstallmentList.First();
                _credit.InitialEmi = firstInstallment.CapitalRepayment + firstInstallment.InterestsRepayment;
            }

            return _credit;
        }

        private Loan Preview()
        {
            try
            {
                Loan credit = CreateAndSetContract();
                ServicesProvider.GetInstance().GetContractServices().CheckLoanFilling(credit);
                DisplayInstallments(ref credit);
                labelXirrValue.Text = GetXIRRStr();
                return credit;
            }
            catch (Exception ex)
            {
                new frmShowError(CustomExceptionHandler.ShowExceptionText(ex)).ShowDialog();
            }

            return null;
        }

        public void Print()
        {
            _applicationController.Execute(new ExtendedPrintControlCommandData { Control = _loanDetailsScheduleControl1.Control , AdditionalValues = GetReportData(), StartPosition = "A10"});
        }

        private Dictionary<string,string> GetReportData()
        {
            var result = new Dictionary<string, string>();
            result.Add("B1", "Name of product:");
            result.Add("C1", _product.Name);

            result.Add("B2", "Amount:");
            result.Add("C2", _credit.Amount.ToString());

            result.Add("B3", "Grace period:");
            result.Add("C3", _credit.GracePeriod.ToString());

            result.Add("B4", "Number of installments:");
            result.Add("C4", _credit.NbOfInstallments.ToString());

            result.Add("B5", "Installment type:");
            result.Add("C5", _credit.InstallmentType.Name);

            result.Add("B6", "Schedule type:");
            result.Add("C6", GetString("FrmAddLoanProduct", _credit.ScheduleType+".Text"));

            result.Add("B7", "EIR:");
            result.Add("C7", GetXIRRStr());

            result.Add("B8", "Currency:");
            result.Add("C8", _credit.Product.Currency.Name);

            var i = 1;
            foreach (var loanEntryFee in _credit.LoanEntryFeesList)
            {
                result.Add("E" + i, loanEntryFee.ProductEntryFee.Name);
                result.Add("F" + i, GetEntryFeeValue(loanEntryFee).GetFormatedValue(_credit.Product.Currency.UseCents));
                i++;
            }
            return result;
        }

        private OCurrency GetEntryFeeValue(LoanEntryFee entryFee)
        {
            OCurrency feeValue;
            OCurrency loanAmount = nudLoanAmount.Value;
            OCurrency maxSum = entryFee.ProductEntryFee.MaxSum;
            OCurrency feeAmount = entryFee.FeeValue < entryFee.ProductEntryFee.Min
                ? entryFee.ProductEntryFee.Min
                : entryFee.FeeValue;

            if (entryFee.ProductEntryFee.IsRate)
                feeValue = feeAmount*loanAmount/100m;
            else
                feeValue = feeAmount;

            if (feeValue > maxSum && maxSum > 0)
                feeValue = maxSum;

                return feeValue;
        }

        private double GetXIRR()
        {
            var startDate = _credit.StartDate;
            var totalFeesAmount = GetTotalFeesInListViewByNudLoanAmount();
            var cashFlows =
                _credit.InstallmentList.Select(
                    val =>
                        new
                        {
                            N = -(val.ExpectedDate - startDate).TotalDays/365.0,
                            Amount = Convert.ToDouble(val.CapitalRepayment.Value + val.InterestsRepayment.Value)
                        }).ToList();
            decimal amount = (_credit.InstallmentList.Sum(val => val.CapitalRepayment.Value) - totalFeesAmount.Value);
            cashFlows.Insert(0,new
            {
                N = 0.0,
                Amount = -Convert.ToDouble(amount)
            });

            double rate = 0;
            double err = 0.00000001;
            var i = 0;
            while (i < 10 && amount > 0)
            {
                var val = cashFlows.Sum(t => t.Amount*Math.Pow(1 + rate, t.N));
                var pval = cashFlows.Sum(t => t.Amount*t.N*Math.Pow(1 + rate, t.N - 1));
                var temp = rate - val/pval;
                if (Math.Abs(temp - rate) < err)
                {
                    rate = temp;
                    break;
                }
                rate = temp;
                i++;
            }
            return rate;
        }

        private string GetXIRRStr()
        {
            return Math.Round(GetXIRR()*100, 2) + "%";
        }

        private void DisplayInstallments(ref Loan pCredit)
        {
            FillInstallmentListForScheduleControl("loanDetailsScheduleControl", _credit);
            if (ApplicationSettings.GetInstance(User.CurrentUser.Md5).ShowExtraInterestColumn)
                _loanDetailsScheduleControl1.ShowExtraColumn();
            if (pCredit.InstallmentList.Count == 0)
            {
                pCredit.Product = _product;
            }
        }

        private void FillInstallmentListForScheduleControl(string nameOfSchedule, Loan credit)
        {
            var ifShowTotalRowInSchedule = ServicesProvider.GetInstance().GetGeneralSettings().IsShowTotalRowInSchedule;

            _loanDetailsScheduleControl1.UseTotalRow = ifShowTotalRowInSchedule;
            _loanDetailsScheduleControl1.SetScheduleFor(credit);
        }

        private void cmbPackages_SelectedIndexChanged(object sender, EventArgs e)
        {
            var keyValuePair = (KeyValuePair<string, LoanProduct>) cmbPackages.SelectedItem;
            _product = keyValuePair.Value;
            InitializeTabPageLoansDetails(_product);

        }

        private DateTime GetFirstInstallmentDate()
        {
            DateTime date = dateLoanStart.Value;

            bool isSet = false;

            if (_credit.InstallmentType != null)
            {
                if (_credit.InstallmentType.NbOfDays > 0)
                {
                    date = date.AddDays(_credit.InstallmentType.NbOfDays);
                }

                if (_credit.InstallmentType.NbOfMonths > 0)
                {
                    date = date.AddMonths(_credit.InstallmentType.NbOfMonths);
                }

                isSet = true;
            }

            if (_product != null && !isSet)
            {
                if (_product.InstallmentType.NbOfDays > 0)
                {
                    date = date.AddDays(_product.InstallmentType.NbOfDays);
                }

                if (_product.InstallmentType.NbOfMonths > 0)
                {
                    date = date.AddMonths(_product.InstallmentType.NbOfMonths);
                }
            }

            if (_group != null)
            {
                if (_group.MeetingDay.HasValue)
                {
                    int delta = ServicesProvider.GetInstance().GetGeneralSettings().IsIncrementalDuringDayOff ? 1 : -1;
                    while (date.DayOfWeek != _group.MeetingDay)
                    {
                        date = date.AddDays(delta);
                    }

                    date = ServicesProvider.GetInstance().GetNonWorkingDate().GetTheNearestValidDate(date,
                                                                                                     ServicesProvider.
                                                                                                         GetInstance().
                                                                                                         GetGeneralSettings().
                                                                                                         IsIncrementalDuringDayOff,
                                                                                                     ServicesProvider.
                                                                                                         GetInstance().
                                                                                                         GetGeneralSettings().
                                                                                                         DoNotSkipNonWorkingDays,
                                                                                                     false);
                }
            }
            return date;
        }

        private void dateLoanStart_ValueChanged(object sender, EventArgs e)
        {
            dtpDateOfFirstInstallment.Value = GetFirstInstallmentDate();
            _oldFirstInstalmentDate = dtpDateOfFirstInstallment.Value;
            try
            {
                if (_oldDisbursmentDate.Date != dateLoanStart.Value.Date && _oldDisbursmentDate != new DateTime(1, 1, 1))
                    ServicesProvider.GetInstance().GetContractServices().ModifyDisbursementDate(
                        dateLoanStart.Value.Date);

                if (dateLoanStart.Value > dtpDateOfFirstInstallment.Value)
                {
                    dtpDateOfFirstInstallment.Value = dateLoanStart.Value;
                }

                if (_credit != null && _credit.Product != null && _toChangeAlignDate)
                {
                    _credit.AlignDisbursementDate = _credit.CalculateAlignDisbursementDate(dtpDateOfFirstInstallment.Value);
                    _firstInstallmentDate = dtpDateOfFirstInstallment.Value;
                }

                lblDay.Text = dtpDateOfFirstInstallment.Value.Date.DayOfWeek.ToString();
                _oldDisbursmentDate = dateLoanStart.Value.Date;
            }
            catch (Exception ex)
            {
                dateLoanStart.Value = _oldDisbursmentDate;
                new frmShowError(CustomExceptionHandler.ShowExceptionText(ex)).ShowDialog();
                throw;
            }
        }

        private void dtpDateOfFirstInstallment_ValueChanged(object sender, EventArgs e)
        {
            lblDay.Text = dtpDateOfFirstInstallment.Value.Date.DayOfWeek.ToString();
        }

        private void lvEntryFees_SubItemClicked(object sender, SubItemEventArgs e)
        {
            decimal min, max;
            if (!(e.Item.Tag is LoanEntryFee)) return;
            if (((LoanEntryFee)e.Item.Tag).ProductEntryFee.Min != null && ((LoanEntryFee)e.Item.Tag).ProductEntryFee.Max != null)
            {
                min = (decimal)((LoanEntryFee)e.Item.Tag).ProductEntryFee.Min;
                max = (decimal)((LoanEntryFee)e.Item.Tag).ProductEntryFee.Max;
            }
            else
            {
                min = (decimal)((LoanEntryFee)e.Item.Tag).ProductEntryFee.Value;
                max = (decimal)((LoanEntryFee)e.Item.Tag).ProductEntryFee.Value;
            }

            numEntryFees.Minimum = min;
            numEntryFees.Maximum = max;

            numEntryFees.DecimalPlaces = 0;
            numEntryFees.Increment = 1;

            if (_credit.Product.Currency.UseCents || ((LoanEntryFee)e.Item.Tag).ProductEntryFee.IsRate)
            {
                numEntryFees.DecimalPlaces = 2;
                numEntryFees.Increment = (decimal)0.01;
            }

            if (1 == e.SubItem && e.Item.Index < _credit.LoanEntryFeesList.Count)
            {
                lvEntryFees.StartEditing(numEntryFees, e.Item, e.SubItem);
            }
        }

        private void lvEntryFees_Click(object sender, EventArgs e)
        {
            decimal min, max;
            ListViewItem item = lvEntryFees.SelectedItems[0];
            if (!(item.Tag is LoanEntryFee)) return;
            if (((LoanEntryFee)item.Tag).ProductEntryFee.Min != null && ((LoanEntryFee)item.Tag).ProductEntryFee.Max != null)
            {
                min = (decimal)((LoanEntryFee)item.Tag).ProductEntryFee.Min;
                max = (decimal)((LoanEntryFee)item.Tag).ProductEntryFee.Max;
            }
            else
            {
                min = (decimal)((LoanEntryFee)item.Tag).ProductEntryFee.Value;
                max = (decimal)((LoanEntryFee)item.Tag).ProductEntryFee.Value;
            }

            string symbol = ((LoanEntryFee)item.Tag).ProductEntryFee.IsRate ? "%" : _credit.Product.Currency.Code;

            if (((LoanEntryFee)item.Tag).ProductEntryFee.IsRate)
                lblMinMaxEntryFees.Text = string.Format("Min: {0}\n\rMax: {1}",
                                                    ((OCurrency)(min)).GetFormatedValue(true) + symbol,
                                                    ((OCurrency)(max)).GetFormatedValue(true) + symbol);
            else
                lblMinMaxEntryFees.Text = string.Format("Min: {0}\n\rMax: {1}",
                                                        ((OCurrency)(min)).GetFormatedValue(
                                                            _credit.Product.Currency.UseCents) + " " + symbol,
                                                        ((OCurrency)(max)).GetFormatedValue(
                                                            _credit.Product.Currency.UseCents) + " " + symbol);
            lblMinMaxEntryFees.Visible = true;
        }

        private void ShowTotalFeesInListViewByNudLoanAmount()
        {
            OCurrency totalEntryFeeValue = 0m;
            foreach (ListViewItem item in lvEntryFees.Items)
            {
                if (item.Tag.Equals("TotalFees"))
                    item.SubItems[5].Text = totalEntryFeeValue.GetFormatedValue(_credit.Product.Currency.UseCents) + @" " + _credit.Product.Currency.Code;
                else
                    totalEntryFeeValue += Convert.ToDecimal(item.SubItems[5].Text);
            }
        }

        private OCurrency GetTotalFeesInListViewByNudLoanAmount()
        {
            OCurrency totalEntryFeeValue = 0m;
            foreach (ListViewItem item in lvEntryFees.Items)
            {
                if (!item.Tag.Equals("TotalFees"))
                    totalEntryFeeValue += Convert.ToDecimal(item.SubItems[5].Text);
            }
            return totalEntryFeeValue;
        }

        private void lvEntryFees_SubItemEndEditing(object sender, SubItemEndEditingEventArgs e)
        {
            _credit.LoanEntryFeesList.Clear();
            OCurrency loanAmount = nudLoanAmount.Value;
            OCurrency inputFee = decimal.Parse(numEntryFees.Value.ToString());
            inputFee = decimal.Parse(inputFee.GetFormatedValue(_credit.Product.Currency.UseCents));
            foreach (ListViewItem item in lvEntryFees.Items)
            {
                if (item.Tag is LoanEntryFee)
                {
                    _credit.LoanEntryFeesList.Add((LoanEntryFee)item.Tag);
                    if (e.Item.Index == item.Index)
                    {
                        ((LoanEntryFee)item.Tag).FeeValue = inputFee.Value;
                        var maxSum = ((LoanEntryFee)item.Tag).ProductEntryFee.MaxSum;
                        item.SubItems[4].Text = ((OCurrency)maxSum).GetFormatedValue(_credit.Product.Currency.UseCents);
                        if (((LoanEntryFee)item.Tag).ProductEntryFee.IsRate)
                        {
                            OCurrency feeAmount = loanAmount * inputFee / 100;
                            item.SubItems[3].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                            if (maxSum.HasValue && maxSum > 0 && feeAmount > maxSum)
                            {
                                feeAmount = maxSum;
                                numEntryFees.Minimum = 0;
                                numEntryFees.Value = 100m*feeAmount.Value/_credit.Amount.Value;//(_credit.Amount.HasValue ?_credit.Amount.Value : loanAmount.Value);
                            }
                            else
                                item.SubItems[1].Text = inputFee.GetFormatedValue(_credit.Product.Currency.UseCents);

                            item.SubItems[5].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                            ((LoanEntryFee)item.Tag).FeeValue = Convert.ToDecimal(item.SubItems[1].Text);
                        }
                        else
                        {
                            OCurrency feeAmount = inputFee;
                            item.SubItems[3].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                            if (maxSum.HasValue && maxSum > 0 && feeAmount > maxSum)
                            {
                                feeAmount = maxSum;
                                numEntryFees.Minimum = 0;
                                numEntryFees.Value = 100m*feeAmount.Value/_credit.Amount.Value;//(_credit.Amount.HasValue ? _credit.Amount.Value : loanAmount.Value);
                            }
                            else
                                item.SubItems[1].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);

                            item.SubItems[5].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                        }
                    }
                }
            }
            ShowTotalFeesInListViewByNudLoanAmount();
        }

        private void nudLoanAmount_ValueChanged(object sender, EventArgs e)
        {
            OCurrency amount = 0;
            if (_credit != null)
            {
                decimal loanAmount;
                if (decimal.TryParse(nudLoanAmount.Text, out loanAmount))
                    amount = ServicesHelper.ConvertStringToDecimal(nudLoanAmount.Text, 0, _credit.Product.UseCents);


                if (_credit.LoanEntryFeesList != null)
                {
                    //_credit.LoanEntryFeesList.Clear();

                    foreach (ListViewItem item in lvEntryFees.Items)
                    {
                        if (item.Tag is LoanEntryFee)
                        {
                            var entryFee = (LoanEntryFee)item.Tag;
                            OCurrency feeAmount = entryFee.FeeValue < entryFee.ProductEntryFee.Min
                                ? entryFee.ProductEntryFee.Min
                                : entryFee.FeeValue;

                            if (entryFee.ProductEntryFee.IsRate)
                            {
                                feeAmount = amount * feeAmount / 100;
                                item.SubItems[3].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                                entryFee.FeeValue = feeAmount.Value * 100 / nudLoanAmount.Value;
                                if (feeAmount > entryFee.ProductEntryFee.MaxSum && entryFee.ProductEntryFee.MaxSum > 0m)
                                {
                                    feeAmount = entryFee.ProductEntryFee.MaxSum;
                                }
                            }
                            else
                            {
                                item.SubItems[3].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                                entryFee.FeeValue = feeAmount.Value;
                                if (feeAmount > entryFee.ProductEntryFee.MaxSum && entryFee.ProductEntryFee.MaxSum > 0m)
                                {
                                    feeAmount = entryFee.ProductEntryFee.MaxSum;
                                }
                            }
                            OCurrency rateValue = entryFee.FeeValue;
                            item.SubItems[1].Text = rateValue.GetFormatedValue(_credit.Product.Currency.UseCents);
                            item.SubItems[5].Text = feeAmount.GetFormatedValue(_credit.Product.Currency.UseCents);
                        }
                    }
                    ShowTotalFeesInListViewByNudLoanAmount();
                }
            }
            if(_credit!=null && _credit.Amount.HasValue)
            Preview();
        }

        private void LoanCalculator_Load(object sender, EventArgs e)
        {
            Preview();
        }
    }
        
    }
