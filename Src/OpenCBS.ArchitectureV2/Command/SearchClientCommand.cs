﻿using System.Reflection;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.CommandData;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.Enums;

namespace OpenCBS.ArchitectureV2.Command
{
    public class SearchClientCommand : ICommand<SearchClientCommandData>
    {
        private readonly IApplicationController _applicationController;

        public SearchClientCommand(IApplicationController applicationController)
        {
            _applicationController = applicationController;
        }

        public void Execute(SearchClientCommandData commandData)
        {
            var assembly = Assembly.Load("OpenCBS.GUI");
            var viewType = assembly.GetType("OpenCBS.GUI.SearchClientForm", true);
            Form form ;
            if (commandData.OpeningNewClientForm)
            {
                 form = (Form) viewType.GetMethod("GetInstance", new[] { typeof(Control), typeof(IApplicationController) }).Invoke(null, new object[] { null, _applicationController});
            }
            else
            {
                form = (Form) viewType.GetMethod("GetInstance", new[] { typeof(OClientTypes),typeof(bool), typeof(IApplicationController), typeof(OSearchClientVariants) }).Invoke(null, new object[] { commandData.TiersType,commandData.IncludeNotactiveOnly, _applicationController, commandData.SearchClientVariant});
            }
            form.BringToFront();
            form.WindowState = FormWindowState.Normal;
            form.Show();
        }
    }
}
