using System.Collections.Generic;
using System.Data;
using Dapper;

namespace OpenCBS.Fusebox.Fusebox
{
    internal static class Logger
    {
        public static void Log(List<FuseBoxLogEntry> logs, IDbConnection connection)
        {
            const string query = @"
                insert into dbo.FuseboxLogs
                (
                    fuse_name, started_at, ended_at, error_message, stack_trace
                )
                values
                (
                    @FuseName, @StartedAt, @EndedAt, @ErrorMessage, @StackTrace
                )
            ";
            foreach (var log in logs)
            {
                connection.Execute(query, log);
            }
        }
    }
}
