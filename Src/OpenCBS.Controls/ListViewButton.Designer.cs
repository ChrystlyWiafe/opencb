namespace OpenCBS.Controls
{
    partial class ListViewButton
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ListViewButton));
            this._menu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.SuspendLayout();
            // 
            // _menu
            // 
            this._menu.Name = "_menu";
            this._menu.Size = new System.Drawing.Size(61, 4);
            // 
            // ListViewButton
            // 
            this.ContextMenuStrip = this._menu;
            this.Image = ((System.Drawing.Image)(resources.GetObject("$this.Image")));
            this.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip _menu;
    }
}
