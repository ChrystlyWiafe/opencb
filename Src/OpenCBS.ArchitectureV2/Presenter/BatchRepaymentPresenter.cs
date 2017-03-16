﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.ArchitectureV2.Interface.Presenter;
using OpenCBS.ArchitectureV2.Interface.Repository;
using OpenCBS.ArchitectureV2.Interface.View;
using OpenCBS.ArchitectureV2.Message;
using OpenCBS.ArchitectureV2.Model;
using OpenCBS.Controls;
using OpenCBS.CoreDomain;
using OpenCBS.Enums;
using OpenCBS.ExceptionsHandler;
using OpenCBS.Extensions;
using OpenCBS.Services;
using OpenCBS.Shared;

namespace OpenCBS.ArchitectureV2.Presenter
{
    public class BatchRepaymentPresenter : IBatchRepaymentPresenter, IBatchRepaymentPresenterCallbacks
    {
        private readonly IBatchRepaymentView _view;
        private readonly ILoanRepository _loanRepository;
        private readonly IVillageBankRepository _villageBankRepository;
        private readonly IConnectionProvider _connectionProvider;
        private readonly IApplicationController _applicationController;
        private readonly TranslationService _translationService;
        private List<Loan> _loans;
        private int _villageBankId;
        private bool _addaction;

        public BatchRepaymentPresenter(
            IBatchRepaymentView view,
            ILoanRepository loanRepository,
            IVillageBankRepository villageBankRepository,
            IConnectionProvider connectionProvider,
            IApplicationController applicationController)
        {
            _view = view;
            _loanRepository = loanRepository;
            _villageBankRepository = villageBankRepository;
            _connectionProvider = connectionProvider;
            _applicationController = applicationController;

            _translationService = new TranslationService();
            _translationService.Reload();
        }

        public void Run(int villageBankId)
        {
            _villageBankId = villageBankId;
            _view.Attach(this);
            try
            {
                ModifyTotal();
                var villageBank = ServicesProvider.GetInstance().GetClientServices().FindTiers(_villageBankId, OClientTypes.Village);
                var paymentMethods = ServicesProvider.GetInstance().GetPaymentMethodServices().GetAllPaymentMethodsOfBranch(villageBank.Branch.Id);

                if (paymentMethods.Count == 0)
                {
                    throw new OpenCbsException(_translationService.Translate("There are no payment methods for this branch"));
                }

                _view.PaymentMethods = paymentMethods;
                _loans = _loanRepository.GetVillageBankLoans(villageBankId);
                _view.SetLoans(_loans);
                _view.Run();
            }
            catch (Exception error)
            {
                new frmShowError(CustomExceptionHandler.ShowExceptionText(error)).ShowDialog();
            }
        }

        public object View
        {
            get { return _view; }
        }

        private Loan GetLoan(int loanId)
        {
            var loan = _loans.Find(x => x.Id == loanId);
            if (loan == null)
            {
                throw new ApplicationException(string.Format("Loan identified by id={0} not found.", loanId));
            }
            return loan;
        }

        public decimal GetDuePrincipal(int loanId)
        {
            var loan = GetLoan(loanId);
            var date = GetFirstExpectedDateAfterToday(loan);
            if (date.HasValue)
            {
                // There are still some installments ahead
                return loan
                    .Schedule
                    .FindAll(x => x.ExpectedDate <= date)
                    .Sum(x => x.Principal - x.PaidPrincipal);
            }
            // The loan is in the past
            return loan.Schedule.Sum(x => x.Principal - x.PaidPrincipal);
        }

        public DateTime GetExpectedDate(int loanId)
        {
            var loan = GetLoan(loanId);
            return loan
                .Schedule
                .FindAll(x => !x.Repaid)
                .OrderBy(x => x.Number)
                .FirstOrDefault()
                .ExpectedDate;
        }

        private static DateTime? GetFirstExpectedDateAfterToday(Loan loan)
        {
            var today = TimeProvider.Today;
            var installment = loan.Schedule
                .Where(x => !x.Repaid)
                .OrderBy(x => x.ExpectedDate)
                .FirstOrDefault(x => today <= x.ExpectedDate);
            return installment == null ? (DateTime?)null : installment.ExpectedDate;
        }

        public decimal GetDueInterest(int loanId)
        {
            var loan = GetLoan(loanId);
            var date = GetFirstExpectedDateAfterToday(loan);
            if (date.HasValue)
            {
                // There are still some installments ahead
                return loan
                    .Schedule
                    .FindAll(x => x.ExpectedDate <= date)
                    .Sum(x => x.Interest - x.PaidInterest);
            }
            // The loan is in the past
            return loan.Schedule.Sum(x => x.Interest - x.PaidInterest);
        }

        public decimal[] DistributeTotal(int loanId, decimal total)
        {
            var loan = GetLoan(loanId).Copy();
            var installments = loan.Schedule.Where(x => !x.Repaid).ToList();
            var principal = 0m;
            var interest = 0m;
            foreach (var installment in installments)
            {
                if (installment.UnpaidInterest > total)
                {
                    interest += total;
                    break;
                }
                total -= installment.UnpaidInterest;
                interest += installment.UnpaidInterest;
                installment.PaidInterest = installment.Interest;

                if (installment.UnpaidPrincipal > total)
                {
                    principal += total;
                    break;
                }
                total -= installment.UnpaidPrincipal;
                principal += installment.UnpaidPrincipal;
                installment.PaidPrincipal = installment.Principal;
            }

            return new[] { principal, interest };
        }

        private static void DistributeTotal(Loan loan, decimal total)
        {
            var installments = loan.Schedule.Where(x => !x.Repaid).ToList();
            var date = TimeProvider.Now;
            foreach (var installment in installments)
            {
                if (installment.UnpaidInterest > total)
                {
                    installment.PaidInterest += total;
                    installment.PaymentDate = date;
                    break;
                }
                total -= installment.UnpaidInterest;
                installment.PaidInterest = installment.Interest;
                installment.PaymentDate = date;

                if (installment.UnpaidPrincipal > total)
                {
                    installment.PaidPrincipal += total;
                    installment.PaymentDate = date;
                    break;
                }
                total -= installment.UnpaidPrincipal;
                installment.PaidPrincipal = installment.Principal;
                installment.PaymentDate = date;

                if (total == 0)
                {
                    break;
                }
            }
        }

        public decimal GetMaxDueTotal(int loanId)
        {
            var loan = GetLoan(loanId);
            return loan.Schedule.Sum(x => x.Principal + x.Interest - x.PaidPrincipal - x.PaidInterest);
        }

        private List<RepaymentEvent> GetRepaymentEvents(Loan loan, Loan repaidLoan)
        {
            var unpaidInstallments = loan.Schedule.Where(x => !x.Repaid);
            var repaymentEvents = new List<RepaymentEvent>();
            foreach (var unpaidInstallment in unpaidInstallments)
            {
                var distributedInstallment =
                    repaidLoan.Schedule.FirstOrDefault(val => val.Number == unpaidInstallment.Number);
                if (distributedInstallment.PaidInterest > 0 || distributedInstallment.PaidPrincipal > 0)
                {
                    var lateDays = (TimeProvider.Today - unpaidInstallment.ExpectedDate.Date).Days;
                    lateDays = lateDays < 0 ? 0 : lateDays;

                    var repaymentEvent = new RepaymentEvent();
                    repaymentEvent.LoanId = loan.Id;
                    repaymentEvent.Code = lateDays > 0 ? "RBLE" : "RGLE";
                    repaymentEvent.InstallmentNumber = unpaidInstallment.Number;
                    repaymentEvent.EventDate = TimeProvider.Now;
                    repaymentEvent.UserId = User.CurrentUser.Id;
                    repaymentEvent.LateDays = lateDays;

                    repaymentEvent.Principal = distributedInstallment.PaidPrincipal - unpaidInstallment.PaidPrincipal;
                    repaymentEvent.Interest = distributedInstallment.PaidInterest - unpaidInstallment.PaidInterest;
                    repaymentEvent.PaymentMethodId = _view.SelectedPaymentMethod.Id;
                    repaymentEvents.Add(repaymentEvent);
                }

            }

            return repaymentEvents;
        }

        private static CloseEvent GetCloseEvent(Loan loan)
        {
            var closeEvent = new CloseEvent();
            closeEvent.Code = "LOCE";
            closeEvent.LoanId = loan.Id;
            closeEvent.UserId = User.CurrentUser.Id;
            closeEvent.EventDate = TimeProvider.Now;
            return closeEvent;
        }

        public void Repay()
        {
            var tx = _connectionProvider.GetTransaction();
            try
            {
                foreach (var id in _view.SelectedLoanIds)
                {
                    var total = _view.GetTotal(id);

                    var loan = GetLoan(id);
                    var repaidLoan = loan.Copy();
                    DistributeTotal(repaidLoan, total);

                    var repaymentEvents = GetRepaymentEvents(loan, repaidLoan);
                    foreach (var repaymentEvent in repaymentEvents)
                    {
                        repaymentEvent.Comment = _view.GetComment(id);
                        repaymentEvent.ReceiptNumber = _view.GetReceiptNumber(id);

                        var repaymentEvent2 = _loanRepository.SaveRepaymentEvent(repaymentEvent, tx);
                        var interceptors = _applicationController.GetAllInstances<IEventInterceptor>();
                        foreach (var interceptor in interceptors)
                        {
                            var e = new CoreDomain.Events.RepaymentEvent
                            {
                                Id = repaymentEvent2.Id,
                                Code = repaymentEvent2.Code,
                                Principal = repaymentEvent2.Principal,
                                Interests = repaymentEvent2.Interest,
                                Penalties = 0,
                                Comment = repaymentEvent2.Comment,
                                Doc2 = repaymentEvent2.ReceiptNumber,
                                PaymentMethodId = repaymentEvent2.PaymentMethodId,
                                PaymentMethod = _view.SelectedPaymentMethod
                            };
                            interceptor.CallInterceptor(new Dictionary<string, object>
                            {
                                {"LoanId", loan.Id},
                                {"ClientId", loan.ClientId},
                                {"BranchId", loan.BranchId},
                                {"ProductId", loan.ProductId},
                                {"ProductCode", loan.ProductCode},
                                {"Event", e},
                                {"SqlTransaction", tx}
                            });
                        }
                        _loanRepository.ArchiveSchedule(loan.Id, repaymentEvent2.Id, loan.Schedule, repaidLoan.Schedule,
                            tx);
                    }

                    var closed = repaidLoan.Schedule.Last().Repaid;
                    if (closed)
                    {
                        var closeEvent = GetCloseEvent(repaidLoan);
                        _loanRepository.SaveCloseEvent(closeEvent, tx);
                        _loanRepository.SetLoanStatusToClosed(loan.Id, tx);
                        _loanRepository.UpdateBorrowerStatus(loan.Id, tx);
                    }
                }
                _villageBankRepository.SyncVillageBankStatus(_villageBankId, tx);
                tx.Commit();

                _view.Stop();
                _applicationController.Publish(new VillageBankRepayMessage(this, _villageBankId));
            }
            catch (Exception error)
            {
                tx.Rollback();
                MessageBox.Show(error.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ModifyTotal()
        {
            var addaction = new ActionItemObject("LoanServices", "ModifyTotal");
            _addaction = User.CurrentUser.UserRole.IsActionAllowed(addaction);
            if (_addaction)
            {
                _view.EnableTotalEdit();
                return;
            }
            _view.DisableTotalEdit();
        }
    }
}
