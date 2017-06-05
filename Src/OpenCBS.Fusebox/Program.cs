using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using OpenCBS.CoreDomain;
using StructureMap;
using StructureMap.Graph;

namespace OPENCBS.Fusebox
{
    public class Program
    {
        private const string Source = "OpenCBS Fusebox";
        private const string Log = "Application";

        public static void Main()
        {
            if (!EventLog.SourceExists(Source))
            {
                EventLog.CreateEventSource(Source, Log);
            }

            EventLog.WriteEntry(Source, "Fusebox launched in " + Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));

            var container = new Container();
            try
            {
                container.Configure(x =>
                {
                    x.Scan(scanner =>
                    {
                        scanner.WithDefaultConventions();
                        scanner.TheCallingAssembly();
                        if (Directory.Exists("Extensions"))
                        {
                            scanner.AssembliesFromPath("Extensions");
                        }
                        scanner.LookForRegistries();
                    });

                });
            }
            catch (Exception e)
            {
                EventLog.WriteEntry(Source, "Failed to initialize container:\r\n\r\n" + e.Message, EventLogEntryType.Error);
                return;
            }

#if DEBUG
            Console.WriteLine("Press any key to start");
            Console.ReadKey();
#endif

            var logEntries = new List<FuseBoxLogEntry>();
            FuseBoxLogEntry currentLogEntry = null;
            var connection = DatabaseConnection.GetConnection();
            var transaction = connection.BeginTransaction();
            try
            {
                var routines = container.GetAllInstances<IFuse>().OrderBy(x => x.Order);
                foreach (var routine in routines)
                {
                    currentLogEntry = new FuseBoxLogEntry();
                    currentLogEntry.FuseName = routine.GetType().Name;
                    currentLogEntry.StartedAt = DateTime.Now;

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

                Console.WriteLine(error.Message);
                Console.WriteLine(error.StackTrace);

                EventLog.WriteEntry(Source, "Error while running fuses:\r\n\r\n" + error.Message, EventLogEntryType.Error);
            }
            finally
            {
                Logger.Log(logEntries, connection);

                connection.Dispose();
            }
#if DEBUG
            Console.WriteLine("Press any key");
            Console.ReadKey();
#endif
        }
    }
}
