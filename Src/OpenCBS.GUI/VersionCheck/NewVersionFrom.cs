// Octopus MFS is an integrated suite for managing a Micro Finance Institution: 
// clients, contracts, accounting, reporting and risk
// Copyright © 2006,2007 OCTO Technology & OXUS Development Network
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
// Website: http://www.opencbs.com
// Contact: contact@opencbs.com

using System.ComponentModel;
using System.Diagnostics;
using System.Windows.Forms;
using OpenCBS.GUI.VersionCheck;
using OpenCBS.Shared.Settings;

namespace OpenCBS.GUI
{
	/// <summary>
	/// Summary description for AboutForm.
	/// </summary>
	public class NewVersionForm : Form
    {
        private PictureBox aboutPictureBox;
        private Label developedByLabel;
        private Label label1;
        private Label label2;
        private LinkLabel linkForx86;
        private LinkLabel linkForx64;
        private IContainer components;
	    private VersionInformation _versionInformation;

		public NewVersionForm(VersionInformation versionInformation)
		{
			InitializeComponent();
		    _versionInformation = versionInformation;
            linkForx86.Text = versionInformation.Version + " " + linkForx86.Text;
            linkForx64.Text = versionInformation.Version + " " + linkForx64.Text;
        }

		/// <summary>
		/// Clean up any resources being used.
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

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(NewVersionForm));
            this.aboutPictureBox = new System.Windows.Forms.PictureBox();
            this.developedByLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.linkForx86 = new System.Windows.Forms.LinkLabel();
            this.linkForx64 = new System.Windows.Forms.LinkLabel();
            ((System.ComponentModel.ISupportInitialize)(this.aboutPictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // aboutPictureBox
            // 
            resources.ApplyResources(this.aboutPictureBox, "aboutPictureBox");
            this.aboutPictureBox.BackColor = System.Drawing.Color.Transparent;
            this.aboutPictureBox.BackgroundImage = global::OpenCBS.GUI.Properties.Resources.LOGO;
            this.aboutPictureBox.Name = "aboutPictureBox";
            this.aboutPictureBox.TabStop = false;
            // 
            // developedByLabel
            // 
            resources.ApplyResources(this.developedByLabel, "developedByLabel");
            this.developedByLabel.Name = "developedByLabel";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // linkForx86
            // 
            resources.ApplyResources(this.linkForx86, "linkForx86");
            this.linkForx86.Name = "linkForx86";
            this.linkForx86.TabStop = true;
            this.linkForx86.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkForx86_LinkClicked);
            // 
            // linkForx64
            // 
            resources.ApplyResources(this.linkForx64, "linkForx64");
            this.linkForx64.Name = "linkForx64";
            this.linkForx64.TabStop = true;
            this.linkForx64.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkForx64_LinkClicked);
            // 
            // NewVersionForm
            // 
            resources.ApplyResources(this, "$this");
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.linkForx64);
            this.Controls.Add(this.linkForx86);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.developedByLabel);
            this.Controls.Add(this.aboutPictureBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "NewVersionForm";
            ((System.ComponentModel.ISupportInitialize)(this.aboutPictureBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

		}

        #endregion

        private void linkForx86_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                var url = _versionInformation.x86Link;
                Process.Start(url);
            }
            catch
            { }
        }

        private void linkForx64_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                var url = _versionInformation.x64Link;
                Process.Start(url);
            }
            catch
            { }
        }
    }
}
