using System;
using System.Windows.Forms;

namespace OpenCBS.GUI.VersionCheck
{
    public static class UpdateContextMenu
    {
        public static ContextMenuStrip Create(Action linkClick)
        {
            ContextMenuStrip menu = new ContextMenuStrip();
            ToolStripMenuItem item;
            
            item = new ToolStripMenuItem();
            item.Text = "Link to download new OpenCBS";
            item.Click += (sender, args) => linkClick();
            menu.Items.Add(item);
            return menu;
        }
    }
}