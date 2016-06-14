using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using OpenCBS.CoreDomain;
using OpenCBS.Fusebox.Interfaces;
using StructureMap.Graph;
using Container = StructureMap.Container;

namespace OpenCBS.Fusebox.Fusebox
{
    public class Fusebox
    {
        private BackgroundWorker _bw;
        private readonly Container _container;
        private List<FuseBoxLogEntry> _logEntries;
        private string _currentFuseBoxEntryName;
        public event ProgressChangedEventHandler LoansProgressChanged;
        public event EventHandler FuseChanged;
        public event EventHandler FuseboxComplited;

        public Fusebox()
        {
            _container = GetFusesContainer();
            InitializeBackGroundWorker();
            _logEntries = new List<FuseBoxLogEntry>();
        }

        private Container GetFusesContainer()
        {
            var container = new Container();
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
            return container;
        }

        private void InitializeBackGroundWorker()
        {
            _bw = new BackgroundWorker()
            {
                WorkerSupportsCancellation = true,
                WorkerReportsProgress = true
            };
        }

        public void Run()
        {
            InitializeBackGroundWorker();
            _bw.DoWork += (obj, args) =>
            {
                TryExecute();
            };
            _bw.RunWorkerCompleted += (obj, args) =>
            {
                OnFuseComplited();
                MessageBox.Show(@"Fusebox executing complete.");
            };
            _bw.RunWorkerAsync();
        }

        private void TryExecute()
        {
            var connection = DatabaseConnection.GetConnection();
            var transaction = connection.BeginTransaction();
            try
            {
                ExecuteFuses(transaction);
                ExecuteAdvancedFuses(transaction);

                transaction.Commit();
            }
            catch (Exception error)
            {
                _logEntries.Add(GetErrorFuseBoxLogEntry(error));
                transaction.Rollback();
            }
            finally
            {
                Logger.Log(_logEntries, connection);
                connection.Dispose();
            }
        }

        private void ExecuteFuses(IDbTransaction transaction)
        {
            var routines = GetRoutines<IFuse>();
            var index = 0;
            foreach (var routine in routines)
            {
                index++;

                _currentFuseBoxEntryName = routine.GetType().FullName;
                OnFuseChanged(new FuseChangedEventArgs(_currentFuseBoxEntryName, GetPercentageValue(index, routines.Length)));

                routine.Activate(transaction);
            }
        }

        private void ExecuteAdvancedFuses(IDbTransaction transaction)
        {
            var routines = GetRoutines<IAdvancedFuse>();
            var index = 0;
            foreach (var routine in routines)
            {
                index++;
                _currentFuseBoxEntryName = routine.GetType().FullName;

                OnFuseChanged(new FuseChangedEventArgs(routine.FuseName, GetPercentageValue(index, routines.Length)));

                SetAdvancedFusesEvents(routine);

                routine.Activate(transaction);

                _logEntries.Add(GetDefaultFuseBoxLogEntry());
            }
        }

        private void SetAdvancedFusesEvents(IAdvancedFuse routine)
        {
            routine.ProgressChangedEventHandler += (sender, args) =>
            {
                if (_bw.CancellationPending)
                    Thread.CurrentThread.Abort();
            };
            routine.ProgressChangedEventHandler += LoansProgressChanged;
        }

        private int GetPercentageValue(int value, int max)
        {
            return value * 100 / max;
        }

        protected virtual void OnFuseChanged(FuseChangedEventArgs e)
        {
            EventHandler handler = FuseChanged;
            if (handler != null)
                handler(this, e);
        }

        protected virtual void OnFuseComplited()
        {
            EventHandler handler = FuseboxComplited;
            if (handler != null)
                handler(this, new EventArgs());
        }

        private FuseBoxLogEntry GetDefaultFuseBoxLogEntry()
        {
            return new FuseBoxLogEntry
            {
                FuseName = _currentFuseBoxEntryName,
                StartedAt = DateTime.Now,
                EndedAt = DateTime.Now
            };
        }

        private FuseBoxLogEntry GetErrorFuseBoxLogEntry(Exception error)
        {
            return new FuseBoxLogEntry
            {
                FuseName = _currentFuseBoxEntryName??"",
                StartedAt = DateTime.Now,
                EndedAt = DateTime.Now,
                ErrorMessage = error.Message,
                StackTrace = error.StackTrace
            };
        }

        public void Stop()
        {
            _bw.CancelAsync();
        }

        private T[] GetRoutines<T>()
        {
            var defaultRoutines =
                _container.GetAllInstances<T>().Where(item => item.GetType().Name.StartsWith("Default")).ToArray();
            var extensionRoutines =
                _container.GetAllInstances<T>().Where(item => !item.GetType().Name.StartsWith("Default")).ToArray();
            return extensionRoutines.Length > 0 ? extensionRoutines : defaultRoutines;
        }

        private const string ExtensionsPath = "Extensions";
    }
}
