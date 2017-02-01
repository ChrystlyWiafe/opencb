using System.Collections.Generic;
using System.Windows.Forms;
using OpenCBS.GUI.UserControl;
using Fee = OpenCBS.CoreDomain.EntryFee;

namespace OpenCBS.GUI.Configuration.EntryFee
{
    public partial class EntryFeeAddEdit : SweetBaseForm
    {
        private Fee _entryFee;
        private List<Fee> _entryFees;
        private bool IsRate {
            get { return _comboBoxRate.SelectedIndex == 0; }
        }

        public EntryFeeAddEdit(List<Fee> entryFees)
        {
            _entryFees = entryFees;
            InitializeComponent();
            _comboBoxRate.SelectedIndex = 0;
            Initialize();
            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleAdd");
        }

        public EntryFeeAddEdit(Fee entryFee, List<Fee> entryFees)
        {
            InitializeComponent();
            _entryFee = entryFee;
            _entryFees = entryFees;
            FillFieldsByEntryFee(entryFee);
            Initialize();
            // ReSharper disable once VirtualMemberCallInContructor
            Text = GetString("titleEdit");
        }

        #region MainFunctions

        private bool SaveNewEntryFee()
        {
            var entryFee = new Fee
            {
                Name = _textBoxName.Text,
                Min = _numericUpDownMin.Value,
                Max = _numericUpDownMax.Value,
                IsRate = this.IsRate,
                MaxSum = _numericUpDownMaxSum.Value
            };

            if (!ValidateEntryFee(entryFee))
                return false;

            Services.GetEntryFeeServices().SaveNewEntryFee(entryFee);

            return true;
        }

        private bool UpdateEntryFee()
        {
            _entryFee.Name = _textBoxName.Text;
            _entryFee.Min = _numericUpDownMin.Value;
            _entryFee.Max = _numericUpDownMax.Value;
            _entryFee.IsRate = IsRate;
            _entryFee.MaxSum = _numericUpDownMaxSum.Value;

            if (!ValidateEntryFee(_entryFee))
                return false;

            Services.GetEntryFeeServices().UpdateEntryfee(_entryFee);

            return true;
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

        private void OnAnyChanged(KeyEventArgs e)
        {
            _timer.Stop();
            if (e.KeyCode == Keys.Return)
                ValidateEntryFee(GetFeeFromForm());
            else _timer.Start();
        }

        private void SaveClick(object sender, System.EventArgs e)
        {
            var operationComplete = _entryFee == null ? SaveNewEntryFee() : UpdateEntryFee();

            if (operationComplete)
                Close();
        }

        private void MinMaxChanged(object sender, System.EventArgs e)
        {
            ValidateEntryFee(GetFeeFromForm());
        }

        private void RateChanged(object sender, System.EventArgs e)
        {
            _numericUpDownMaxSum.Visible = _labelMaxSum.Visible = true;

            if (IsRate)
            {
                
            }
        }

        #endregion

        #region Validation

        private bool ValidateEntryFee(Fee entryFee)
        {
            _labelError.Text = string.Empty;
            _buttonSave.Enabled = true;

            if (string.IsNullOrEmpty(entryFee.Name))
            {
                _labelError.Text = GetString("nameEmpty");
                _buttonSave.Enabled = false;
                return false;
            }

            if (ValidateMinMaxIsZero(entryFee))
            {
                _labelError.Text = GetString("minMaxIsZero");
                _buttonSave.Enabled = false;
                return false;
            }

            if (ValidateMinGreaterMax())
            {
                _labelError.Text = GetString("minGreaterMax");//TODO Translate
                _buttonSave.Enabled = false;
                return false;
            }

            return true;
        }

        private static bool ValidateMinMaxIsZero(Fee entryFee)
        {
            return entryFee.Min == 0m && entryFee.Max == 0m;
        }

        private bool ValidateMinGreaterMax()
        {
            return _numericUpDownMin.Value > _numericUpDownMax.Value;
        }

        #endregion

        private void Initialize()
        {
            _timer.Tick += (sender, e) =>
            {
                _timer.Stop();
                ValidateEntryFee(GetFeeFromForm());
            };

            _textBoxName.KeyDown += (sender, e) =>
            {
                OnAnyChanged(e);
            };

            _numericUpDownMin.KeyDown += (sender, e) =>
            {
                OnAnyChanged(e);
            };

            _numericUpDownMax.KeyDown += (sender, e) =>
            {
                OnAnyChanged(e);
            };
        }

        private Fee GetFeeFromForm()
        {
            var fee = new Fee
                        {
                            Name = _textBoxName.Text,
                            Min = _numericUpDownMin.Value,
                            Max = _numericUpDownMax.Value,
                            IsRate = IsRate,
                            MaxSum = _numericUpDownMaxSum.Value
                        };
            return fee;
        }
    }
}
