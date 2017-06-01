using System.Collections.Generic;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Interface.Presenter;
using OpenCBS.ArchitectureV2.Interface.Service;
using OpenCBS.ArchitectureV2.Interface.View;
using OpenCBS.ArchitectureV2.Model;
using OpenCBS.ArchitectureV2.Presenter;

namespace OpenCBS.ArchitectureV2.View
{
    public partial class VillageBankView : Form, IVillageBankView
    {
        private readonly ITranslationService _translationService ;
        public VillageBankView()
        {
            InitializeComponent();
            _memberActiveColumn.AspectToStringConverter = v => ((bool) v) ? "Yes" : "No";
            _loanAmountColumn.AspectToStringConverter = v => ((decimal) v).ToString("N0");
            _loanOlbColumn.AspectToStringConverter = v => ((decimal) v).ToString("N0");
            _translationService = new TranslationService();
            _translationService.Reload();
        }

        public void Attach(IVillageBankPresenterCallbacks presenterCallbacks)
        {
            _repayButton.Click += (sender, e) => presenterCallbacks.Repay();
            FormClosing += (sender, e) => presenterCallbacks.DetachView();
        }

        public void SetVillageBank(VillageBank villageBank)
        {
            Name = "VillageBankView" + villageBank.Id;
            Text = "Village Bank - " + villageBank.Name;
            _membersListView.SetObjects(villageBank.Members);
            _loansListView.SetObjects(TranslateStatusOfLoans(villageBank.Loans));
            _nameTextBox.Text = villageBank.Name;
            _repayButton.Enabled = villageBank.Loans.Count > 0;
        }

        private IEnumerable<VillageBankLoan> TranslateStatusOfLoans(List<VillageBankLoan> loans)
        {
            foreach (var loan in loans)
                loan.Status = _translationService.Translate(loan.Status);
            return loans;
        }
    }
}
