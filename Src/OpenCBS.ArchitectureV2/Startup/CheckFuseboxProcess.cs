using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Dapper;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.ArchitectureV2.Interface.Service;

namespace OpenCBS.ArchitectureV2.Startup
{
    public class CheckFuseboxProcess : IStartupProcess
    {
        private readonly IConnectionProvider _connectionProvider;
        private readonly ITranslationService _translationService;


        public CheckFuseboxProcess(IConnectionProvider connectionProvider, ITranslationService translationService)
        {
            _connectionProvider = connectionProvider;
            translationService.Reload();
            _translationService = translationService;
        }
        public void Run()
        {
            var fuses = GetLastGoodFusesDates();
            if (AllowToUseAccruals() && fuses != null && fuses.Any() && fuses.Max(x => x.Value.Date).Date < DateTime.Today.Date)
            {
                throw new Exception(string.Format(
                    _translationService.Translate("Launching an application is blocked. No accruals on the current day."),
                    fuses.Max(x => x.Value.Date).Date));
            }
        }

        public Dictionary<string, DateTime> GetLastGoodFusesDates()
        {
            const string query = @"
                select
                    fuse_name
                    , max(started_at) started_at
                from
                    dbo.FuseboxLogs
                where
                    error_message is null and fuse_name = 'AccrualFuse'
                group by
                    fuse_name
                ";
            using (var connection = _connectionProvider.GetConnection())
            {
                return connection.Query(query).ToDictionary(i => (string) i.fuse_name, i => (DateTime) i.started_at);
            }
        }

        public bool AllowToUseAccruals()
        {
            const string query = @"
                select
                    isnull(value,0) value
                from
                    dbo.GeneralParameters
                where
                    [key] = 'USE_ACCRUALS_VALIDATION'
                ";
            using (var connection = _connectionProvider.GetConnection())
            {
                return (connection.Query<string>(query).FirstOrDefault()??"0") == "1";
            }
        }
    }
}