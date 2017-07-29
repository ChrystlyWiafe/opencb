using System;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OpenCBS.Services;
using OpenCBS.ExceptionsHandler;

namespace OpenCBS.GUI.MFI
{
    public partial class frmQuestionnarie : Form
    {
        private QuestionnaireItem _questionnaire;

        public frmQuestionnarie(bool pSynchro)
        {
            InitializeComponent();
        }

        public frmQuestionnarie()
        {
            InitializeComponent();
        }

        private void buttonValidate_Click(object sender, EventArgs e)
        {
			_questionnaire = new QuestionnaireItem()
			{
                FirstName = textBoxFirstName.Name,
                LastName = textBoxLastName.Text,
                CompanyName = textBoxCompanyName.Text,
                Email = textBoxEmail.Text
			};
            DialogResult = DialogResult.OK;
            Close();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            Close();
        }

        public QuestionnaireItem GetQuestionnaire()
        {
            return _questionnaire;
        }
    }
}
