using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.CoreDomain.Contracts.Loans;
using OpenCBS.CoreDomain.Events;
using OpenCBS.CoreDomain.Events.Loan;
using OpenCBS.CoreDomain.Products;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Services;
using OpenCBS.Shared;

namespace OpenCBS.ArchitectureV2.Accounting.DefaultInterceptors
{
    public class EventInterceptorService
    {
        private readonly LoanProduct _product;
        private readonly int _loanId;
        private readonly int _clientId;
        private readonly int _branchId;
        private readonly decimal _taxValue;
        private readonly string _contractCode;
        private readonly CoreDomain.Events.Loan.Event _event;
        private readonly SqlTransaction _transaction;
        private readonly string[] _repaymentTypes = {"RBLE", "RGLE", "APR", "ATR", "APTR"};

        public EventInterceptorService(IDictionary<string, object> parameters)
        {
            try
            {
                if (parameters.ContainsKey("Loan"))
                {
                    var loan = (Loan) parameters["Loan"];
                    _product = ((Loan) parameters["Loan"]).Product;
                    _loanId = loan.Id;
                    _clientId = loan.Project.Client.Id;
                    _branchId = loan.Project.Client.Branch.Id;
                    _contractCode = loan.Code;
                }
                else
                {
                    if (!parameters.ContainsKey("Product") || !parameters.ContainsKey("LoanId") ||
                        !parameters.ContainsKey("ClientId") || !parameters.ContainsKey("BranchId"))
                        throw new OpenCbsException();

                    _product = (LoanProduct) parameters["Product"];
                    _loanId = (int) parameters["LoanId"];
                    _clientId = (int) parameters["ClientId"];
                    _branchId = (int) parameters["BranchId"];
                }

                _taxValue = _product != null && _product.TaxValue.HasValue
                    ? Convert.ToDecimal(_product.TaxValue.Value)
                    : 0m;
                _contractCode = parameters.ContainsKey("ContractCode") && string.IsNullOrEmpty(_contractCode)
                    ? (string) parameters["ContractCode"]
                    : _contractCode;
                _event = (CoreDomain.Events.Loan.Event) parameters["Event"];
                _transaction = (SqlTransaction) parameters["SqlTransaction"];
            }
            catch
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

                foreach (var commission in disbursment.Commissions??(new List<LoanEntryFeeEvent>()))
                {
                    var entryFeeAccountNumber =
                        ServicesProvider.GetInstance()
                            .GetEntryFeeServices()
                            .GetEntryFeeAccountNumberByLoanProductEntryFeeId(commission.LoanEntryFee.ProductEntryFeeId,
                                _transaction);
                    var entryFeeIncomeAccountNumber =
                        ServicesProvider.GetInstance()
                            .GetEntryFeeServices()
                            .GetIncomeAccountNumberByLoanProductEntryFeeId(commission.LoanEntryFee.ProductEntryFeeId,
                                _transaction);

                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber },
                        Credit = new Account {AccountNumber = entryFeeAccountNumber},
                        Amount = commission.Fee.Value,
                        Description = commission.LoanEntryFee.ProductEntryFee.Name + " for " + _contractCode,
                        LoanEventId = disbursment.Id
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = entryFeeAccountNumber },
                        Credit = new Account { AccountNumber = entryFeeIncomeAccountNumber },
                        Amount = commission.Fee.Value,
                        Description = "Income on " + commission.LoanEntryFee.ProductEntryFee.Name + " for " + _contractCode,
                        LoanEventId = disbursment.Id
                    });
                }

                list.Insert(0, new BookingEntry
                {
                    Debit = new Account {AccountNumber = _product.PrincipalAccountNumber },
                    Credit = new Account {AccountNumber = paymentMethodAccountNumber},
                    Amount = disbursment.Amount.Value,
                    Description = "Loan disbursement for " + _contractCode,
                    LoanEventId = disbursment.Id
                });
            }

            //Repayment Event
            else if (_repaymentTypes.Contains(eEvent.Code))
            {
                var repayment = (RepaymentEvent) eEvent;
                var paymentMethodAccountNumber = repayment.PaymentMethod.AccountNumber;

                var interestAccount = eEvent.Code == "RBLE"
                    ? _product.InterestDueButNotReceivedAccountNumber
                    : _product.InterestDueAccountNumber;


                if (repayment.Principal.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account {AccountNumber = paymentMethodAccountNumber},
                        Credit = new Account {AccountNumber = _product.PrincipalAccountNumber },
                        Amount = repayment.Principal.Value,
                        Description = "Repayment of principal for " + _contractCode,
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
                        Description = "Repayment of interest for " + _contractCode,
                        LoanEventId = repayment.Id
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.TaxOnInterestsAccountNumber },
                        Credit = new Account { AccountNumber = paymentMethodAccountNumber },
                        Amount = repayment.Interests.Value*_taxValue,
                        Description = "Tax on interest for " + _contractCode,
                        LoanEventId = repayment.Id
                    });
                }

                if (repayment.Penalties.Value > 0m)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = paymentMethodAccountNumber },
                        Credit = new Account { AccountNumber = _product.AccruedPenaltyAccountNumber },
                        Amount = repayment.Penalties.Value,
                        Description = "Repayment of penalty for " + _contractCode,
                        LoanEventId = repayment.Id
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.TaxOnPenaltyAccountNumber },
                        Credit = new Account { AccountNumber = paymentMethodAccountNumber },
                        Amount = repayment.Interests.Value*_taxValue,
                        Description = "Tax on penalty for " + _contractCode,
                        LoanEventId = repayment.Id
                    });
                }
            }

            //Accrual Interest Event
            else if (eEvent.Code == "AILE")
            {
                var accrual = (LoanInterestAccrualEvent)eEvent;

                var installments =
                    ServicesProvider.GetInstance()
                        .GetContractServices()
                        .GetInstallments(_loanId, _transaction);

                var installment =
                    installments.First(
                        item =>
                            accrual.Date.Date >= item.StartDate.Date &&
                            accrual.Date.Date <= item.LastInterestAccrualDate.Date);

                var previousInstallment = installments.FirstOrDefault(item => item.Number == installment.Number - 1);

                list.Add(
                    new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.InterestAccruedButNotDueAccountNumber },
                        Credit = new Account { AccountNumber = _product.InterestIncomeAccountNumber },
                        Amount = accrual.Interest.Value,
                        Description = "Interest accrual for " + _contractCode,
                        LoanEventId = accrual.Id
                    });

                if (installment != null && installment.ExpectedDate.Date == accrual.Date.Date)
                {
                    var account = new Account { AccountNumber = _product.InterestAccruedButNotDueAccountNumber };
                    var balance =
                        ServicesProvider.GetInstance()
                            .GetBookingService()
                            .GetAccountBalanceByLoanId(accrual.Date, account, _loanId, _transaction);
                    balance += accrual.Interest.Value;

                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account { AccountNumber = _product.InterestDueAccountNumber },
                            Credit = new Account { AccountNumber = _product.InterestAccruedButNotDueAccountNumber },
                            Amount = balance,
                            Description = "Interest due for " + _contractCode,
                            LoanEventId = accrual.Id
                        });
                }
                else if (previousInstallment != null && previousInstallment.ExpectedDate.Date.AddDays(1) == accrual.Date.Date)
                {
                    var amount = previousInstallment.InterestsRepayment.Value - previousInstallment.PaidInterests.Value;

                    list.Add(
                        new BookingEntry
                        {
                            Debit = new Account { AccountNumber = _product.InterestDueButNotReceivedAccountNumber },
                            Credit = new Account { AccountNumber = _product.InterestDueAccountNumber },
                            Amount = amount,
                            Description = "Interest for " + _contractCode,
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
                    Debit = new Account {AccountNumber = _product.AccruedPenaltyAccountNumber },
                    Credit = new Account {AccountNumber = _product.PenaltyIncomeAccountNumber},
                    Amount = accrual.Penalty.Value,
                    Description = "Penalty accrual for " + _contractCode,
                    LoanEventId = accrual.Id
                });
            }

            else if (eEvent.Code == "WROE")
            {
                var wroe = (WriteOffEvent) eEvent;

                if (wroe.WriteOffMethod == 1)
                {
                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.WriteOffPrincipalAccountNumber },
                        Credit = new Account { AccountNumber = _product.PrincipalAccountNumber },
                        Amount = wroe.OLB.Value,
                        Description = "Write off overdue principal for " + _contractCode
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.WriteOffInterestAccountNumber },
                        Credit = new Account { AccountNumber = _product.InterestAccruedButNotDueAccountNumber },
                        Amount = wroe.AccruedInterests.Value,
                        Description = "Write off overdue interest for " + _contractCode
                    });

                    list.Add(new BookingEntry
                    {
                        Debit = new Account { AccountNumber = _product.WriteOffPenaltyAccountNumber },
                        Credit = new Account { AccountNumber = _product.AccruedPenaltyAccountNumber },
                        Amount = wroe.AccruedPenalties.Value,
                        Description = "Write off overdue penalty for " + _contractCode
                    });
                }                
            }

            return list;
        }
    }
}
