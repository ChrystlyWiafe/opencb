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

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using OpenCBS.Controls.Models;
using OpenCBS.Reports;

namespace OpenCBS.Controls
{
    public partial class ListViewButton : Button
    {
        private List<ListViewButtonModel> actions;
        private ContextMenuStrip Menu;

        public List<ListViewButtonModel> Actions
        {
            set
            {
                actions = value;
                InitializeMenu();
            }
            get { return actions; }
        }

        public ListViewButton()
        {

            InitializeComponent();
            Init();
            InitializeMenu();
        }

        private void InitializeMenu()
        {
            Menu = new ContextMenuStrip();
            if(actions == null || actions.Count <=0) return;

            foreach (var action in actions)
            {
                ToolStripMenuItem item = new ToolStripMenuItem(action.Title)
                {
                    ForeColor = Color.FromArgb(0, 81, 152),
                    Enabled = action.Enabled
                };
                item.Click += action.EventHandler;
                Menu.Items.Add(item);
            }
        }

        private void Init()
        {
            AttachmentPoint = AttachmentPoint.None;
            Visibility = Visibility.All;
        }

        protected override void OnPaint(PaintEventArgs pe)
        {
            base.OnPaint(pe);
        }

        [Browsable(true), DefaultValue(AttachmentPoint.None)]
        public AttachmentPoint AttachmentPoint { get; set; }

        [Browsable(true), DefaultValue(Visibility.All)]
        public Visibility Visibility { get; set; }

        protected override void OnClick(EventArgs e)
        {
            base.OnClick(e);
            Menu.Show(this, 0, Height);
        }
    }
}
