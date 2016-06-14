using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using OpenCBS.Fusebox.Interfaces;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class AccrualFuse : IAdvancedFuse
    {
        List<Tuple<int, DateTime>> _listLastAccrualDates = new List<Tuple<int, DateTime>>();
        public void Activate(IDbTransaction transaction)
        {
            var accrualEngine = new AccrualEngine();
            accrualEngine.ProgressChangedEventHandler = ProgressChangedEventHandler;
            var startedAt = DateTime.Now;

            accrualEngine.AccrueInterestForDate(startedAt,  _listLastAccrualDates, transaction);
            //accrualEngine.AccruePenaltyForDate(startedAt, transaction); // TODO not need now, but will be need in future
        }

        public int Order { get { return 2; } }

        public string FuseName { get { return "Default Fusebox"; } }

        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}