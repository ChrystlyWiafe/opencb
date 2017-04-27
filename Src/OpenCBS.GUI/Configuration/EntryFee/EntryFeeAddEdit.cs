using System;
using System.Windows.Forms;
using OpenCBS.GUI.UserControl;
using Fee = OpenCBS.CoreDomain.EntryFee;

namespace OpenCBS.GUI.Configuration.EntryFee
{
    public sealed partial class EntryFeeAddEdit : SweetBaseForm
    {
        private readonly Fee _entryFee;
        private const int Decimals = 2;

        private bool IsRate {
            get { return _comboBoxRate.SelectedIndex == 0; }
        }

        public EntryFeeAddEdit()
        {
            InitializeComponent();
            _comboBoxRate.SelectedIndex = 0;
            Text = GetString("titleAdd");
        }

        public EntryFeeAddEdit(Fee entryFee)
        {
            InitializeComponent();
            _entryFee = entryFee;
            FillFieldsByEntryFee(entryFee);
            Text = GetString("titleEdit");
        }

        #region MainFunctions

        private bool SaveNewEntryFee()
        {
            var entryFee = GetFeeFromForm();
            var validResult = ValidateEntryFee(entryFee);

            if (validResult)
            {
                Services.GetEntryFeeServices().SaveNewEntryFee(entryFee);
                return true;
            }

            return false;
        }

        private bool UpdateEntryFee()
        {
            UpdateLocalEntryFee();

            var validResult = ValidateEntryFee(_entryFee);

            if (validResult)
            {
                Services.GetEntryFeeServices().UpdateEntryfee(_entryFee);
                return true;
            }

            return false;
        }

        private void UpdateLocalEntryFee()
        {
            _entryFee.Name = _textBoxName.Text;
            _entryFee.Min = _numericUpDownMin.Text == "" ? 0m : Math.Round(_numericUpDownMin.Value, Decimals);
            _entryFee.Max = _numericUpDownMax.Text == "" ? 0m : Math.Round(_numericUpDownMax.Value, Decimals);
            _entryFee.IsRate = IsRate;
            _entryFee.MaxSum = _numericUpDownMaxSum.Text == "" ? 0m : Math.Round(_numericUpDownMaxSum.Value, Decimals);
        }

        private void FillFieldsByEntryFee(Fee entryFee)
        {
            _textBoxId.Text = entryFee.Id.ToString();
            _textBoxName.Text = entryFee.Name;
            _numericUpDownMin.Value = entryFee.Min.HasValue ? entryFee.Min.Value : 0;
            _numericUpDownMax.Value = entryFee.Max.HasValue ? entryFee.Max.Value : 0;
            _comboBoxRate.SelectedIndex = entryFee.IsRate ? 0 : 1;
            _numericUpDownMaxSum.Value = entryFee.MaxSum.HasValue ? entryFee.MaxSum.Value : 0;
        }
        
        #endregion

        #region ControlEvents

        private void SaveClick(object sender, System.EventArgs e)
        {
            var operationComplete = _entryFee == null ? SaveNewEntryFee() : UpdateEntryFee();

            if (operationComplete)
                Close();
        }

        private void RateChanged(object sender, System.EventArgs e)
        {
            _numericUpDownMaxSum.Enabled = _labelMaxSum.Enabled = IsRate;

            if (!IsRate)
            {
                _numericUpDownMaxSum.Value = 0m;
            }
        }

        #endregion

        #region Validation

        private bool ValidateEntryFee(Fee entryFee)
        {
            if (string.IsNullOrEmpty(entryFee.Name))
            {
                return ShowErrorMessageAndReturnFalse("nameEmpty");
            }

            if (MinMaxIsZero(entryFee))
            {
                return ShowErrorMessageAndReturnFalse("minMaxIsZero");
            }

            if (MinGreaterMax())
            {
                return ShowErrorMessageAndReturnFalse("minGreaterMax");
            }

            return true;
        }

        private bool ShowErrorMessageAndReturnFalse(string errorMessage)
        {
            MessageBox.Show(GetString(errorMessage));
            return false;
        }

        private static bool MinMaxIsZero(Fee entryFee)
        {
            return entryFee.Min == 0m && entryFee.Max == 0m;
        }

        private bool MinGreaterMax()
        {
            return _numericUpDownMin.Value > _numericUpDownMax.Value;
        }

        #endregion

        private Fee GetFeeFromForm()
        {
            var fee = new Fee
                        {
                            Name = _textBoxName.Text,
                            Min = _numericUpDownMin.Text == "" ? 0m : Math.Round(_numericUpDownMin.Value,Decimals),
                            Max = _numericUpDownMax.Text == "" ? 0m : Math.Round(_numericUpDownMax.Value, Decimals),
                            IsRate = IsRate,
                            MaxSum = _numericUpDownMaxSum.Text == "" ? 0m : Math.Round(_numericUpDownMaxSum.Value, Decimals)
                        };
            return fee;
        }
    }
}
