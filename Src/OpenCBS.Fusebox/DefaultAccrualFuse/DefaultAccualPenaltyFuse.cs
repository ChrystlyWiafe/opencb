using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using OpenCBS.Fusebox.Interfaces;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class DefaultAccrualPenaltyFuse : IAdvancedFuse
    {
        List<Tuple<int, DateTime>> _listLastAccrualDates = new List<Tuple<int, DateTime>>();
        public void Activate(IDbTransaction transaction)
        {
            var accrualEngine = new AccrualEngine();
            accrualEngine.ProgressChangedEventHandler = ProgressChangedEventHandler;
            var startedAt = DateTime.Now;

            accrualEngine.AccruePenaltyForDate(startedAt, transaction);
        }

        public int Order { get { return 3; } }

        public string FuseName { get { return "Default Accrual Penalty"; } }

        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}