using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OPENCBS.Fusebox;
using StructureMap.Graph;
using Container = StructureMap.Container;

namespace OpenCBS.Fusebox
{
    public partial class FuseBoxExecutingForm : Form
    {
        private const string Source = "OpenCBS Fusebox";
        private const string Log = "Application";
        private const string ExtensionsPath = "Extensions";

        private readonly Container _container;

        public FuseBoxExecutingForm()
        {
            _container = GetFusesContainer();

            InitializeComponent();
        }

        private void FuseBoxExecutingForm_Load(object sender, EventArgs e)
        {

        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            var bw = new BackgroundWorker
            {
                WorkerReportsProgress = true,
                WorkerSupportsCancellation = true
            };
            bw.DoWork += (obj, args) =>
            {
                Activate();
                Run(_container);
            };
            bw.RunWorkerCompleted += (obj, args) =>
            {
                MessageBox.Show(@"End");
            };
            bw.RunWorkerAsync();
        }

        public static Container GetFusesContainer()
        {
            if (!EventLog.SourceExists(Source))
            {
                EventLog.CreateEventSource(Source, Log);
            }

            EventLog.WriteEntry(Source,
                "Fusebox launched in " + Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));

            var container = new Container();
            try
            {
                container.Configure(x =>
                {
                    x.Scan(scanner =>
                    {
                        scanner.WithDefaultConventions();
                        scanner.TheCallingAssembly();
                        if (Directory.Exists(ExtensionsPath))
                        {
                            scanner.AssembliesFromPath(ExtensionsPath);
                        }
                        scanner.LookForRegistries();
                    });

                });
            }
            catch (Exception e)
            {
                EventLog.WriteEntry(Source, "Failed to initialize container:\r\n\r\n" + e.Message,
                    EventLogEntryType.Error);
            }
            return container;
        }

        public void Run(Container container)
        {
            var logEntries = new List<FuseBoxLogEntry>();
            FuseBoxLogEntry currentLogEntry = null;
            var connection = DatabaseConnection.GetConnection();
            var transaction = connection.BeginTransaction();
            try
            {
                var routines = container.GetAllInstances<IAdvancedFuse>().OrderBy(x => x.Order);
                progressBarFuses.Minimum = 0;
                progressBarFuses.Maximum = routines.Count();
                foreach (var routine in routines)
                {
                    currentLogEntry = new FuseBoxLogEntry();
                    currentLogEntry.FuseName = routine.GetType().Name;
                    currentLogEntry.StartedAt = DateTime.Now;
                    label2.Text = routine.FuseName;

                    routine.SetIncreaseAction((max, value) =>
                    {
                        progressBarLoans.Minimum = 0;
                        progressBarLoans.Maximum = max;
                        progressBarLoans.Value = value;
                    });
                    routine.Activate(transaction);
                    
                    currentLogEntry.EndedAt = DateTime.Now;
                    logEntries.Add(currentLogEntry);
                    progressBarFuses.Value++;
                }

                transaction.Commit();
            }
            catch (Exception error)
            {
                if (currentLogEntry != null)
                {
                    currentLogEntry.EndedAt = DateTime.Now;
                    currentLogEntry.ErrorMessage = error.Message;
                    currentLogEntry.StackTrace = error.StackTrace;
                    logEntries.Add(currentLogEntry);
                }
                transaction.Rollback();

                EventLog.WriteEntry(Source, "Error while running fuses:\r\n\r\n" + error.Message,
                    EventLogEntryType.Error);
            }
            finally
            {
                Logger.Log(logEntries, connection);
                connection.Dispose();
            }
        }
    }
}
