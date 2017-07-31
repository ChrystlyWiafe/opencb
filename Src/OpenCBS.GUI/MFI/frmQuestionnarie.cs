using System;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OpenCBS.Services;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Shared;

namespace OpenCBS.GUI.MFI
{
    public partial class frmQuestionnarie : Form
    {
        private QuestionnaireItem _questionnaire;

        public frmQuestionnarie(QuestionnaireItem questionnaire = null)
        {
            InitializeComponent();
            if (questionnaire != null)
            {
                _questionnaire = questionnaire;
                FillQuestionnarie();
            }

        }

        private void FillQuestionnarie()
        {
            if (_questionnaire == null)
                return;
            textBoxCompanyName.Text = _questionnaire.CompanyName;
            textBoxEmail.Text = _questionnaire.Email;
            textBoxFirstName.Text = _questionnaire.FirstName;
            textBoxLastName.Text = _questionnaire.LastName;
        }

        private void buttonValidate_Click(object sender, EventArgs e)
        {
			_questionnaire = new QuestionnaireItem
			{
                FirstName = textBoxFirstName.Name,
                LastName = textBoxLastName.Text,
                CompanyName = textBoxCompanyName.Text,
                Email = textBoxEmail.Text,
                AddedAt = TimeProvider.Now
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
