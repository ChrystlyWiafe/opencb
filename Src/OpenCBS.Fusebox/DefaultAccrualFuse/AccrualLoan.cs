using System;
using System.Collections.Generic;
using System.Linq;
using OpenCBS.Enums;
using OpenCBS.Shared;

namespace OpenCBS.Fusebox.DefaultAccrualFuse
{
    public class AccrualLoan
    {
        private readonly List<AccrualInstallment> _installments;

        public AccrualLoan(int id,decimal amount, decimal interestRate, string code, DateTime startDate, int productId, int branchId,
            OInterestScheme interestScheme, decimal nonRepaymentPenaltiesBasedOnOverduePrincipal,
            decimal nonRepaymentPenaltiesBasedOnInitialAmount, decimal nonRepaymentPenaltiesBasedOnOlb,
            decimal nonRepaymentPenaltiesBasedOnOverdueInterest,int gracePeriodOfLateFees)
        {
            _installments = new List<AccrualInstallment>();
            Id = id;
            InterestRate = interestRate;
            Code = code;
            StartDate = startDate;
            ProductId = productId;
            BranchId = branchId;
            InterestScheme = interestScheme;
            NonRepaymentPenaltiesBasedOnOlb = nonRepaymentPenaltiesBasedOnOlb;
            NonRepaymentPenaltiesBasedOnInitialAmount = nonRepaymentPenaltiesBasedOnInitialAmount;
            NonRepaymentPenaltiesBasedOnOverdueInterest = nonRepaymentPenaltiesBasedOnOverdueInterest;
            NonRepaymentPenaltiesBasedOnOverduePrincipal = nonRepaymentPenaltiesBasedOnOverduePrincipal;
            Amount = amount;
            GracePeriodOfLateFees = gracePeriodOfLateFees;
        }

        public string ClientType { get; private set; }

        public int NbOfInstallments { get; set; }

        public int ProductId { get; private set; }

        public int ClientId { get; private set; }

        public int BranchId { get; private set; }
        public int Id { get; private set; }
        public string Code { get; private set; }
        public DateTime StartDate { get; private set; }

        public decimal InterestRate { get; private set; }
        public OInterestScheme? InterestScheme { get; private set; }
        public decimal NonRepaymentPenaltiesBasedOnOverduePrincipal { get; private set; }
        public decimal NonRepaymentPenaltiesBasedOnInitialAmount { get; private set; }
        public decimal NonRepaymentPenaltiesBasedOnOlb { get; private set; }
        public decimal NonRepaymentPenaltiesBasedOnOverdueInterest { get; private set; }
        public int GracePeriodOfLateFees { get; set; }

        public void AddInstallment(AccrualInstallment installment)
        {
            _installments.Add(installment);
        }

        public List<AccrualInstallment> GetLateInstallments(DateTime date)
        {
            return _installments.FindAll(x => x.EndDate.Date < date.Date && !x.IsRepaid).ToList();
        }

        public AccrualInstallment GetLastLateInstallment(DateTime date)
        {
            return _installments.FindAll(x => x.EndDate.Date < date.Date && !x.IsRepaid).OrderBy(x => x.EndDate).LastOrDefault();
        }

        public AccrualInstallment GetFirstLateInstallment(DateTime date)
        {
            return _installments.FindAll(x => x.EndDate.Date < date.Date && !x.IsRepaid).OrderBy(x => x.EndDate).FirstOrDefault();
        }

        public decimal GetOlb()
        {
            return _installments.Sum(x => x.Principal - x.PaidPrincipal);
        }

        public decimal GetDuePrincipal(DateTime date)
        {
            return _installments
                .Where(x => x.EndDate.Date < date.Date)
                .Sum(x => x.Principal - x.PaidPrincipal);
        }

        public decimal GetDueInterest(DateTime date)
        {
            return _installments
                .Where(x => x.EndDate.Date < date.Date)
                .Sum(x => x.Interest - x.PaidInterest);
        }

        public decimal GetPlannedOlb(DateTime date)
        {
            return _installments.FindAll(x => x.EndDate.Date >= date.Date).Sum(x => x.Principal);
        }

        public AccrualInstallment GetInstallment(DateTime date)
        {
            return _installments.Find(x => date.Date > x.StartDate.Date && date.Date <= x.EndDate.Date);
        }

        public AccrualInstallment GetInstallment(int number)
        {
            return _installments.Find(x => x.Number == number);
        }

        public int GetNbOfInstallments()
        {
            return _installments.Count;
        }
        public DateTime? GetLastUpaid()
        {
            var installment = _installments.Find(x => x.PaidInterest < x.Interest || x.PaidPrincipal < x.Principal);
            if (installment == null)
                return null;
            return installment.ExpectedDate;
        }

        public int PackageId { get; set; }

        public decimal Amount { get; set; }

        public void AdjustDates()
        {
            // Adjust start dates
            for (var i = _installments.Count - 1; i > 1; i--)
            {
                if (_installments[i].StartDate < _installments[i - 1].EndDate)
                {
                    _installments[i].StartDate = _installments[i - 1].EndDate;
                }
            }
        }

        public void Adjust()
        {
            // Adjust start dates
            for (var i = _installments.Count - 1; i > 1; i--)
            {
                if (_installments[i].StartDate < _installments[i - 1].EndDate)
                {
                    _installments[i].StartDate = _installments[i - 1].EndDate;
                }
            }
            // Adjust end dates
            for (var i = 1; i < _installments.Count; i++)
            {
                if (_installments[i].EndDate > _installments[i].StartDate.AddDays(GetDaysInMonth()))
                {
                    _installments[i].EndDate = _installments[i].StartDate.AddDays(GetDaysInMonth());
                }
            }

            foreach (var installment in _installments)
            {
                if (installment.TrancheFirstRepaymentDate == null) continue;
                installment.EndDate = installment.TrancheFirstRepaymentDate.Value;
            }
        }

        public int GetDaysInYear()
        {
            switch (InterestScheme)
            {
                case OInterestScheme.Actual360:
                    return 360;
                case OInterestScheme.ActualActual:
                    return DateTime.IsLeapYear(TimeProvider.Today.Year) ? 365 : 366;
                case OInterestScheme.ThirtyActual:
                    return DateTime.IsLeapYear(TimeProvider.Today.Year) ? 365 : 366;
                case OInterestScheme.Thirty360:
                    return 360;
                default:
                    throw new Exception("Interest scheme is null");
            }
        }

        public int GetDaysInMonth()
        {
            switch (InterestScheme)
            {
                case OInterestScheme.Actual360:
                    return DateTime.DaysInMonth(TimeProvider.Today.Year, TimeProvider.Today.Month);
                case OInterestScheme.ActualActual:
                    return DateTime.DaysInMonth(TimeProvider.Today.Year, TimeProvider.Today.Month);
                case OInterestScheme.ThirtyActual:
                    return 30;
                case OInterestScheme.Thirty360:
                    return 30;
                default:
                    throw new Exception("Interest scheme is null");
            }
        }
    }
}