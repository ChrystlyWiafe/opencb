using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.CoreDomain.Events;
using OpenCBS.CoreDomain.Events.Loan;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Services;
using OpenCBS.Shared;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public class EventInterceptorService
    {
        private readonly LoanDetails _loanDetails;
        private readonly CoreDomain.Events.Loan.Event _event;
        private readonly SqlTransaction _transaction;
        private readonly LoanInterceptorService _loanInterceptorService;

        public EventInterceptorService(IDictionary<string, object> parameters)
        {
            try
            {
                _event = (CoreDomain.Events.Loan.Event)parameters["Event"];
                _transaction = (SqlTransaction)parameters["SqlTransaction"];

                _loanInterceptorService = new LoanInterceptorService();
                if (parameters.ContainsKey("Loan"))
                {
                    var coreLoan = (Loan) parameters["Loan"];
                    _loanDetails = new LoanDetails(coreLoan);
                }
                else
                {
                    var loanId = (int) parameters["LoanId"];
                    _loanDetails = EventInterceptorData.GetLoanDetails(loanId, _transaction);
                }
            }
            catch(Exception ex)
            {
                throw new OpenCbsException("Error while intialize interceptor parameters");
            }
        }

        public IEnumerable<Booking> CreateBookings()
        {
            var bookingEntries = GetBookingEntries(_event);
            if (bookingEntries == null || _event == null) return null;
            var user = User.CurrentUser.Id != 0 ? User.CurrentUser : new User {Id = 1};

            return bookingEntries
                .Where(
                    entry =>
                        entry.Amount > 0m
                        && entry.Debit != null
                        && entry.Credit != null
                        && !string.IsNullOrEmpty(entry.Debit.AccountNumber)
                        && !string.IsNullOrEmpty(entry.Credit.AccountNumber)
                        && entry.Debit.AccountNumber != entry.Credit.AccountNumber)
                .Select(entry => new Booking
                {
                    Debit = entry.Debit,
                    Credit = entry.Credit,
                    Amount = entry.Amount,
                    Description = entry.Description,
                    Date = _event.Date == new DateTime() ? TimeProvider.Now : _event.Date,
                    ClientId = _loanDetails.ClientId,
                    User = user,
                    Branch = new Branch {Id = _loanDetails.BranchId},
                    LoanId = _loanDetails.Id,
                    LoanEventId = _event.Id,
                    SavingEventId = 0,
                    IsManualEditable = false,
                    Doc1 = _event.Doc1,
                    Doc2 = _event.Doc2
                }).ToList();
        }

        public IEnumerable<BookingEntry> GetBookingEntries(CoreDomain.Events.Loan.Event eEvent)
        {
            var list = new List<BookingEntry>();

            //Disbursement Event
            if (eEvent.Code == "LODE" || eEvent.Code == "TEET")
            {
                var disbursment = (LoanDisbursmentEvent) eEvent;
                if (!disbursment.PaymentMethodId.HasValue)
                    throw new OpenCbsException("Payment method id is empty");

                var paymentMethodAccountNumber = disbursment.PaymentMethod.AccountNumber;

                var commissionsAmount = 0m;

                foreach (var commission in disbursment.Commissions??(new List<LoanEntryFeeEvent>()))
                {
                    var entryFeeAccountNumber =
                        ServicesProvider.GetInstance()
                            .GetEntryFeeServices()
                            .GetEntryFeeAccountNumberByLoanProductEntryFeeId(commission.LoanEntryFee.ProductEntryFeeId,
                                _transaction);

                    commissionsAmount += commission.Fee.Value;

                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = _loanDetails.PrincipalAccountNumber },
                        Credit = new Account {AccountNumber = entryFeeAccountNumber},
                        Amount = commission.Fee.Value,
                        Description = string.Format("Commission for {0}" ,_loanDetails.ContractCode),
                        LoanEventId = disbursment.Id
                    });
                }

                list.Insert(0, new BookingEntry
                {
                    Debit = new Account {AccountNumber = _loanDetails.PrincipalAccountNumber },
                    Credit = new Account {AccountNumber = paymentMethodAccountNumber},
                    Amount = disbursment.Amount.Value - commissionsAmount,
                    Description = "Loan disbursement for " + _loanDetails.ContractCode,
                    LoanEventId = disbursment.Id
                });
            }

            //Repayment Event
            else if (_repaymentTypes.Contains(eEvent.Code))
            {
                var repayment = (RepaymentEvent) eEvent;
                var paymentMethodAccountNumber = repayment.PaymentMethod.AccountNumber;

                var interestAccount = eEvent.Code == "RBLE"
                    ? _loanDetails.InterestDueButNotReceivedAccountNumber
                    : _loanDetails.InterestDueAccountNumber;


                if (repayment.Principal.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = _loanDetails.PrincipalAccountNumber },
                        Amount = repayment.Principal.Value,
                        Description = "Repayment of principal for " + _loanDetails.ContractCode,
                        LoanEventId = repayment.Id
                    });
                }

                if (repayment.Interests.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = interestAccount},
                        Amount = repayment.Interests.Value,
                        Description = "Repayment of interest for " + _loanDetails.ContractCode,
                        LoanEventId = repayment.Id
                    });
                }

                if (repayment.Penalties.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = paymentMethodAccountNumber },
                        Credit = new Account { AccountNumber = _loanDetails.PenaltyIncomeAccountNumber },
                        Amount = repayment.Penalties.Value,
                        Description = "Repayment of penalty for " + _loanDetails.ContractCode,
                        LoanEventId = repayment.Id
                    });
                }
            }

            //Accrual Interest Event
            else if (eEvent.Code == "AILE")
            {
                var accrual = (LoanInterestAccrualEvent) eEvent;

                var installments =
                    ServicesProvider.GetInstance()
                        .GetContractServices()
                        .GetInstallments(_loanDetails.Id, _transaction);

                var installment =
                    installments.First(
                        item =>
                            accrual.Date.Date >= item.StartDate.Date &&
                            accrual.Date.Date <= item.LastInterestAccrualDate.Date);

                var previousInstallment = installments.FirstOrDefault(item => item.Number == installment.Number - 1);

                list.Add(
                    new BookingEntry
                    {
                        Debit = new Account {AccountNumber = _loanDetails.InterestAccruedButNotDueAccountNumber },
                        Credit = new Account {AccountNumber = _loanDetails.InterestIncomeAccountNumber},
                        Amount = accrual.Interest.Value,
                        Description = "Interest accrual for " + _loanDetails.ContractCode,
                        LoanEventId = accrual.Id
                    });

                if (installment != null && installment.ExpectedDate.Date == accrual.Date.Date)
                {
                    var account = new Account {AccountNumber = _loanDetails.InterestAccruedButNotDueAccountNumber};
                    var balance =
                        ServicesProvider.GetInstance()
                            .GetBookingService()
                            .GetAccountBalanceByLoanId(accrual.Date, account, _loanDetails.Id, _transaction);
                    balance += accrual.Interest.Value;

                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account {AccountNumber = _loanDetails.InterestDueAccountNumber },
                            Credit = new Account {AccountNumber = _loanDetails.InterestAccruedButNotDueAccountNumber },
                            Amount = balance,
                            Description = "Interest due for " + _loanDetails.ContractCode,
                            LoanEventId = accrual.Id
                        });
                }
                else if (previousInstallment != null && previousInstallment.ExpectedDate.Date.AddDays(1) == accrual.Date.Date)
                {
                    var amount = previousInstallment.InterestsRepayment.Value - previousInstallment.PaidInterests.Value;

                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account {AccountNumber = _loanDetails.InterestDueButNotReceivedAccountNumber },
                            Credit = new Account {AccountNumber = _loanDetails.InterestDueAccountNumber },
                            Amount = amount,
                            Description = "Interest for " + _loanDetails.ContractCode,
                            LoanEventId = accrual.Id
                        });
                }
            }

            //Accrual Penalty Event
            else if (eEvent.Code == "LPAE")
            {
                var accrual = (LoanPenaltyAccrualEvent) eEvent;

                list.Add(new BookingEntry
                {
                    Debit = new Account {AccountNumber = _loanDetails.AccruedPenaltyAccountNumber },
                    Credit = new Account {AccountNumber = _loanDetails.PenaltyIncomeAccountNumber},
                    Amount = accrual.Penalty.Value,
                    Description = "Penalty accrual for " + _loanDetails.ContractCode,
                    LoanEventId = accrual.Id
                });
            }

            //Reschedule Event
            else if (eEvent.Code == "ROLE")
            {
                var rescheduleEvent = (RescheduleLoanEvent)eEvent;

                list.Add(new BookingEntry
                {
                    Debit = new Account {AccountNumber = _loanDetails.RescheduleAccountNumber},
                    Credit = new Account {AccountNumber = _loanDetails.PrincipalAccountNumber},
                    Amount = rescheduleEvent.Amount.Value,
                    Description = "Reschedule for " + _loanDetails.ContractCode,
                    LoanEventId = rescheduleEvent.Id
                });

                _loanInterceptorService.SetPrincipalAccount(_loanDetails.Id, _loanDetails.RescheduleAccountNumber, _transaction);
            }

            return list;
        }

        public void ReturnPrincipalAccount()
        {
            if(_event.Code == "ROLE" && !IsRescheduled())
                SetPrincipalAccount(_loanDetails.OriginalPrincipalAccountNumber);
        }

        private bool IsRescheduled()
        {
            const string query =
            @"
                SELECT
	                COUNT(*)
                FROM
	                dbo.ContractEvents ce
                WHERE
	                ce.id = @loanId
	                AND ce.is_deleted = 0
	                AND ce.event_type = 'ROLE'
            ";
            return
                _transaction.Connection.Query<int>(query, new {@loanId = _loanDetails.Id}, _transaction).First() > 0;
        }

        private void SetPrincipalAccount(string accountNumber)
        {
            const string query =
            @"
                UPDATE
	                dbo.Credit
                SET
	                principal_account = @principalAccountNumber
            ";
            _transaction.Connection.Execute(query, new
            {
                @principalAccountNumber = accountNumber
            }, _transaction);
        }

        private readonly string[] _repaymentTypes = { "RBLE", "RGLE", "APR", "ATR", "APTR" };
    }
}
