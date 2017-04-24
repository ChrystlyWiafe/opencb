using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
        private readonly Loan _loan;
        private readonly int _loanId;
        private readonly int _clientId;
        private readonly int _branchId;
        private readonly string _contractCode;
        private readonly CoreDomain.Events.Loan.Event _event;
        private readonly SqlTransaction _transaction;
        private readonly string[] _repaymentTypes = {"RBLE", "RGLE", "APR", "ATR", "APTR"};
        private const decimal TaxDefaultValue = 0.14m;

        public EventInterceptorService(IDictionary<string, object> parameters)
        {
            if (parameters.ContainsKey("Loan"))
            {
                var loan = (Loan) parameters["Loan"];
                _loan = loan;
                _loanId = loan.Id;
                _clientId = loan.Project.Client.Id;
                _branchId = loan.Project.Client.Branch.Id;
                _contractCode = loan.Code;
            }
            else
            {
                _loanId = (int) parameters["LoanId"];
                _loan = ServicesProvider.GetInstance().GetContractServices().SelectLoan(_loanId, true, true, true);
                _clientId = (int) parameters["ClientId"];
                _branchId = (int) parameters["BranchId"];
                _contractCode = parameters.ContainsKey("ContractCode") ? (string) parameters["ContractCode"] : "";
            }
            _event = (CoreDomain.Events.Loan.Event) parameters["Event"];
            _transaction = (SqlTransaction) parameters["SqlTransaction"];
        }

        public IEnumerable<Booking> CreateBookings()
        {
            var bookingEntries = GetBookingEntries(_loan, _event);
            if (bookingEntries == null || _event == null) return null;
            var user = User.CurrentUser.Id != 0 ? User.CurrentUser : new User {Id = 1};

            return bookingEntries
                .Where(
                    entry =>
                        entry.Amount != 0
                        && entry.Debit != null
                        && entry.Credit != null
                        && !string.IsNullOrEmpty(entry.Debit.AccountNumber)
                        && !string.IsNullOrEmpty(entry.Credit.AccountNumber))
                .Select(entry => new Booking
                {
                    Debit = entry.Debit,
                    Credit = entry.Credit,
                    Amount = entry.Amount,
                    Description = entry.Description,
                    Date = _event.Date == new DateTime() ? TimeProvider.Now : _event.Date,
                    ClientId = _clientId,
                    User = user,
                    Branch = new Branch {Id = _branchId},
                    LoanId = _loanId,
                    LoanEventId = _event.Id,
                    SavingEventId = 0,
                    IsManualEditable = false,
                    Doc1 = _event.Doc1,
                    Doc2 = _event.Doc2
                }).ToList();
        }

        public IEnumerable<BookingEntry> GetBookingEntries(Loan loan, CoreDomain.Events.Loan.Event eEvent)
        {
            if (loan.Product == null)
                throw new OpenCbsException("Loan product is empty");

            var product = loan.Product;
            var list = new List<BookingEntry>();

            //Disbursement Event
            if (eEvent.Code == "LODE" || eEvent.Code == "TEET")
            {
                var disbursment = (LoanDisbursmentEvent) eEvent;
                if (!disbursment.PaymentMethodId.HasValue)
                    throw new OpenCbsException("Payment method id is empty");

                var paymentMethodAccountNumber = disbursment.PaymentMethod.AccountNumber;

                foreach (var commission in disbursment.Commissions)
                {
                    var entryFeeAccountNumber =
                        ServicesProvider.GetInstance()
                            .GetEntryFeeServices()
                            .GetEntryFeeAccountNumberByLoanProductEntryFeeId(commission.LoanEntryFee.ProductEntryFeeId,
                                _transaction);

                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = entryFeeAccountNumber},
                        Amount = commission.Fee.Value,
                        Description = "Commission repayment (Registration Fee)"
                    });
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = entryFeeAccountNumber},
                        Credit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Amount = commission.Fee.Value,
                        Description = "Income on commision (Registration Fee)"
                    });
                }


                list.Add(new BookingEntry
                {
                    Credit = new Account { AccountNumber = paymentMethodAccountNumber },
                    Debit = new Account { AccountNumber = product.PrincipalAccountNumber },
                    Amount = disbursment.Amount.Value,
                    Description = "Loan disbursement"
                });
            }

            //Repayment Event
            else if (_repaymentTypes.Contains(eEvent.Code))
            {
                var repayment = (RepaymentEvent) eEvent;
                var paymentMethodAccountNumber = repayment.PaymentMethod.AccountNumber;

                if (repayment.Principal.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = product.PrincipalAccountNumber},
                        Amount = repayment.Principal.Value,
                        Description = "Repayment of principal"
                    });
                }

                if (repayment.Interests.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = product.InterestDueButNotReceivedAccountNumber},
                        Amount = repayment.Interests.Value,
                        Description = "Repayment of interest"
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = product.InterestAccruedButNotDueAccountNumber},
                        Credit = new Account {AccountNumber = product.InterestIncomeAccountNumber},
                        Amount = repayment.Interests.Value,
                        Description = "Interest income"
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = product.InterestAccruedButNotDueAccountNumber },
                        Credit = new Account { AccountNumber = product.InterestIncomeAccountNumber },
                        Amount = repayment.Interests.Value,
                        Description = "Tax on interest"
                    });
                }

                if (repayment.Penalties.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = product.InterestAccruedButNotDueAccountNumber },
                        Credit = new Account { AccountNumber = product.InterestIncomeAccountNumber },
                        Amount = repayment.Interests.Value,
                        Description = "Repayment of penalty"
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = product.InterestAccruedButNotDueAccountNumber },
                        Credit = new Account { AccountNumber = product.InterestIncomeAccountNumber },
                        Amount = repayment.Interests.Value,
                        Description = "Tax on penalty"
                    });
                }
            }

            //Accrual Interest Event
            else if (eEvent.Code == "AILE")
            {
                var accrual = (LoanInterestAccrualEvent) eEvent;

                list.Add(
                    new BookingEntry
                    {
                        Debit = new Account {AccountNumber = product.InterestDueButNotReceivedAccountNumber},
                        Credit = new Account {AccountNumber = product.InterestAccruedButNotDueAccountNumber},
                        Amount = accrual.Interest.Value,
                        Description = "Interest accrual for " + _contractCode
                    });

                var lastNonRepaidInstallment = loan.GetLastNotFullyRepaidInstallment();
                if (lastNonRepaidInstallment.ExpectedDate.Date == accrual.Date.Date)
                {
                    // TODO Need to know an account for balance
                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account {AccountNumber = product.InterestDueButNotReceivedAccountNumber},
                            Credit = new Account {AccountNumber = product.InterestAccruedButNotDueAccountNumber},
                            Amount = accrual.Interest.Value,
                            Description = "Interest accrual for " + _contractCode
                        });
                }
                else if (lastNonRepaidInstallment.ExpectedDate.Date > accrual.Date.Date)
                {
                    // TODO Need to know an account for balance
                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account {AccountNumber = product.InterestDueButNotReceivedAccountNumber},
                            Credit = new Account {AccountNumber = product.InterestAccruedButNotDueAccountNumber},
                            Amount = accrual.Interest.Value,
                            Description = "Interest accrual for " + _contractCode
                        });
                }
            }

            //Accrual Penalty Event
            else if (eEvent.Code == "LPAE")
            {
                var accrual = (LoanPenaltyAccrualEvent) eEvent;

                list.Add(new BookingEntry
                {
                    Debit = new Account {AccountNumber = product.InterestDueButNotReceivedAccountNumber},
                    Credit = new Account {AccountNumber = product.InterestAccruedButNotDueAccountNumber},
                    Amount = accrual.Penalty.Value,
                    Description = "Penalty accrual for " + _contractCode
                });
            }

            return list;
        }
    }
}
