using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OPENCBS.Fusebox;
using StructureMap.Graph;
using Container = StructureMap.Container;

namespace OpenCBS.Fusebox
{
    public class Fusebox
    {
        private const string Source = "OpenCBS Fusebox";
        private const string Log = "Application";
        private const string ExtensionsPath = "Extensions";

        private BackgroundWorker _bw;
        private readonly Container _container;
        public event ProgressChangedEventHandler LoansProgressChanged;
        public event EventHandler FuseChanged;

        public Fusebox()
        {
            _container = GetFusesContainer();
            _bw = new BackgroundWorker()
            {
                WorkerSupportsCancellation = true,
                WorkerReportsProgress = true
            };
        }

        public Container Container { get { return _container; } }

        public Container GetFusesContainer()
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


        private void Execute()
        {
            var logEntries = new List<FuseBoxLogEntry>();
            FuseBoxLogEntry currentLogEntry = null;
            var connection = DatabaseConnection.GetConnection();
            var transaction = connection.BeginTransaction();
            try
            {
                var routines = _container.GetAllInstances<IAdvancedFuse>().OrderBy(x => x.Order);
                var index = 0;
                foreach (var routine in routines)
                {
                    index++;
                    OnFuseChanged(new FuseChangedEventArgs {FuseName = routine.FuseName,PercentageValue = (index * 100)/ routines.Count() });
                    currentLogEntry = new FuseBoxLogEntry();
                    currentLogEntry.FuseName = routine.GetType().Name;
                    currentLogEntry.StartedAt = DateTime.Now;
                    routine.ProgressChangedEventHandler += (sender, args) =>
                    {
                        if (_bw.CancellationPending)
                        {
                            Thread.CurrentThread.Abort();
                        }
                    };
                    routine.ProgressChangedEventHandler += LoansProgressChanged;
                    routine.Activate(transaction);

                    currentLogEntry.EndedAt = DateTime.Now;
                    logEntries.Add(currentLogEntry);
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

        public void Run()
        {
            RefreshBackGroundWorker();
            _bw.DoWork += (obj, args) =>
            {
                Execute();
            };
            _bw.RunWorkerCompleted += (obj, args) =>
            {
                MessageBox.Show(@"Fusebox executing complete.");
            };
            _bw.RunWorkerAsync();
        }

        public void Stop()
        {
            if(_bw.IsBusy)
                _bw.CancelAsync();
        }

        private void RefreshBackGroundWorker()
        {
            _bw = new BackgroundWorker()
            {
                WorkerSupportsCancellation = true,
                WorkerReportsProgress = true
            };
        }

        protected virtual void OnFuseChanged(FuseChangedEventArgs e)
        {
            EventHandler handler = FuseChanged;
            if (handler != null)
            {
                handler(this, e);
            }
        }
    }
}
