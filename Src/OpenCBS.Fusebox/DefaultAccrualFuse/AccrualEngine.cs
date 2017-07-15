using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Events;
using OpenCBS.Enums;
using OpenCBS.Services;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class AccrualEngine
    {
        public ProgressChangedEventHandler ProgressChangedEventHandler { get; set; }
        

        public void AccrueInterestForDate(DateTime date, List<Tuple<int, DateTime>> listLastAccrualDates = null,
            IDbTransaction tx = null)
        {
            date = new DateTime(date.Year, date.Month, date.Day, 1, 0, 0);

            var ids = AccrualEngineData.GetActiveLoansIds(date, tx);
            var i = 0;
            foreach (var id in ids)
            {
                i++;
                var progress = 100 * i / ids.Length;

                AccrueInterestForLoan(date, id, tx, listLastAccrualDates);
                ProgressChangedEventHandler(this, new ProgressChangedEventArgs(progress, this));
            }
        }

        public static void AccrueInterestForLoan(DateTime date, int loanId, IDbTransaction tx = null, List<Tuple<int, DateTime>> listLastAccrualDates = null)
        {
            var accrualDate = AccrualEngineData.GetLastInterestAccrualDate(loanId, tx).Date.AddDays(1);
            if (listLastAccrualDates != null) listLastAccrualDates.Add(new Tuple<int, DateTime>(loanId, accrualDate.AddDays(-1)));
            while (accrualDate <= date.Date)
            {
                var accrualDateTime = accrualDate.Date.AddHours(1); // 01:00 AM
                var loan = AccrualEngineData.GetLoan(accrualDateTime, loanId, tx);
                AccrueInterest(loan, accrualDateTime, tx);
                accrualDate = accrualDate.AddDays(1);
            }
        }

        private static void AccrueInterest(AccrualLoan loan, DateTime date, IDbTransaction transaction = null)
        {
            // Return if not installment includes the given date
            var installment = loan.GetInstallment(date);
            if (installment == null) return;

            // Get sum of interest accrued up to the date
            var accruedAmount = AccrualEngineData.GetAccruedAmount(loan, installment, transaction);

            // Return if there is nothing to accrue
            if (installment.Interest == accruedAmount) return;

            // Now calculate the amount that should be accrued for the given date

            decimal amount;
            if (date.Date == installment.EndDate)
            {
                // This is the last accrual day, hence this is the last chance to perform accrual.
                // Thus accrue as much as necessary to make sure the total equals to the amount
                // stored in the schedule.
                amount = installment.Interest - accruedAmount;
            }
            else
            {
                // Calculate portfolio
                var olb = loan.GetPlannedOlb(date);
                olb -= AccrualEngineData.GetPartiallyEarlyPaidAmount(loan, installment, date, transaction);

                // Calculate daily amount
                var interestRate = AccrualEngineData.GetInterestRate(loan, date, transaction);
                amount = Math.Round(olb * interestRate / loan.GetDaysInYear(), 2);

                if (loan.InterestScheme == OInterestScheme.Thirty360 || loan.InterestScheme == OInterestScheme.ThirtyActual)
                {
                    if (date.Day > 30) return;
                    else if (DateTime.DaysInMonth(date.Year, date.Month) == 28 && date.Day == 28) amount *= 3;
                    else if (DateTime.DaysInMonth(date.Year, date.Month) == 29 && date.Day == 29) amount *= 2;
                }

                var diff = installment.Interest - accruedAmount;
                if (diff < amount)
                {
                    amount = diff;
                }
                else
                {
                    // If it turns out that the accrued amount that would follow the current one
                    // is significantly less than the daily amount (less than half of it) then
                    // it must be a rounding error compensation. In such a case, we should consider
                    // the current accrual as the last one.
                    diff = Math.Abs(installment.Interest - accruedAmount - amount);
                    if (diff < 0.5m * amount)
                    {
                        amount = installment.Interest - accruedAmount;
                    }
                }
            }

            var product = ServicesProvider.GetInstance().GetProductServices().FindPackage(loan.ProductId);
            // Write down the interest accrual event in the database
            var connection = transaction == null ? DatabaseConnection.GetConnection() : transaction.Connection;
            try
            {
                var query = @"
                    insert into dbo.ContractEvents
                    (
                        event_type, contract_id, event_date, user_id, is_deleted, entry_date
                    )
                    values 
                    (
                        'AILE', @loanId, @date, 1, 0, getdate()
                    )
                    select cast(scope_identity() as int)
                ";
                var eventId = connection.Query<int>(query, new { loanId = loan.Id, date }, transaction).First();

                query = @"insert into dbo.AccrualInterestLoanEvents (id, interest) values (@eventId, @amount)";
                connection.Execute(query, new { eventId, amount }, transaction);
                var accrualEvent = new LoanInterestAccrualEvent()
                {
                    Id = eventId,
                    Date = date,
                    Code = "AILE",
                    ContracId = loan.Id,
                    Interest = amount,
                };
                AccrualEngineData.CallInterceptor(accrualEvent, loan, product, transaction);
            }
            finally
            {
                if (transaction == null) connection.Dispose();
            }
        }

        public void AccruePenaltyForDate(DateTime date, IDbTransaction tx = null)
        {
            var ids = AccrualEngineData.GetLateLoansIds(date, tx);
            var i = 0;
            foreach (var id in ids)
            {
                i++;
                var progress = 100 * i / ids.Length;

                AccruePenaltyForLoan(date, id, tx);
                ProgressChangedEventHandler(this, new ProgressChangedEventArgs(progress, this));
            }
        }

        public static void AccruePenaltyForLoan(DateTime date, int loanId, IDbTransaction tx = null)
        {
            var accrualDate = AccrualEngineData.GetLastPenaltyAccrualDate(date, loanId, tx).Date.AddDays(1);
            while (accrualDate <= date.Date)
            {
                var accrualDateTime = accrualDate
                    .Date
                    .AddHours(date.Hour)
                    .AddMinutes(date.Minute)
                    .AddSeconds(date.Second);
                var loan = AccrualEngineData.GetLoan(accrualDateTime, loanId, tx);
                if (loan != null)
                {
                    AccruePenalty(loan, accrualDateTime, tx);
                }
                accrualDate = accrualDate.AddDays(1);
            }
        }
        
        private static void AccruePenalty(AccrualLoan loan, DateTime date, IDbTransaction tx = null)
        {
            var installments = loan.GetLateInstallments(date);
            if (installments.Count == 0) return;

            //var amount = loan.GetDuePrincipal(date) + loan.GetDueInterest(date);
            //amount = Math.Round(amount * 0.36m / 365);
            //if (amount == 0) return;

            var connection = tx == null ? DatabaseConnection.GetConnection() : tx.Connection;
            try
            {
                foreach (var installment in installments)
                {
                    var amount = installment.Principal + installment.Interest - installment.PaidPrincipal - installment.PaidInterest;
                    amount = Math.Round(amount * 0.36m / loan.GetDaysInYear(), 2);
                    var query = @"
                        insert into dbo.ContractEvents
                        (
                            event_type, contract_id, event_date, user_id, is_deleted, entry_date
                        )
                        values 
                        (
                            'LPAE', @loanId, @date, 1, 0, getdate()
                        )
                        select cast(scope_identity() as int)
                        ";
                    var eventId = connection.Query<int>(query, new { loanId = loan.Id, date }, tx).First();

                    query = @"
                        insert into dbo.LoanPenaltyAccrualEvents 
                        (id, penalty, installment_number)
                        values (@eventId, @amount, @Number)";
                    connection.Execute(query, new { eventId, amount, installment.Number }, tx);
                }
            }
            finally
            {
                if (tx == null) connection.Close();
            }
        }
    }
}