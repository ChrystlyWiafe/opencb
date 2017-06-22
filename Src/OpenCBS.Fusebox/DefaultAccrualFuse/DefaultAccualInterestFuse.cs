using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using OpenCBS.Fusebox.Interfaces;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class DefaultAccualInterestFuse : IAdvancedFuse
    {
        List<Tuple<int, DateTime>> _listLastAccrualDates = new List<Tuple<int, DateTime>>();
        public void Activate(IDbTransaction transaction)
        {
            var accrualEngine = new AccrualEngine();
            accrualEngine.ProgressChangedEventHandler = ProgressChangedEventHandler;
            var startedAt = TimeProvider.Now;

            accrualEngine.AccrueInterestForDate(startedAt,  _listLastAccrualDates, transaction);
        }

        public int Order { get { return 2; } }

        public string FuseName { get { return "Default Accrual Interest"; } }

        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
    }
}