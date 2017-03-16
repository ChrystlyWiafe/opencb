﻿using System;
using System.Linq;
using OpenCBS.ArchitectureV2.Accounting.Interface.Presenter;
using OpenCBS.ArchitectureV2.Accounting.Interface.View;
using OpenCBS.ArchitectureV2.Accounting.Message;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.Manager.Accounting;
using OpenCBS.Services;
using OpenCBS.Services.Accounting;

namespace OpenCBS.ArchitectureV2.Accounting.Presenter
{
    public class BookingPresenter : IBookingPresenter, IBookingPresenterCallbacks
    {
        private readonly IBookingView _view;
        private readonly BookingService _bookingService;
        private readonly AccountRepository _accountRepository;
        private readonly IApplicationController _applicationController;

        public BookingPresenter(
            IBookingView view,
            BookingService bookingService,
            AccountRepository accountRepository,
            IApplicationController applicationController)
        {
            _view = view;
            _bookingService = bookingService;
            _accountRepository = accountRepository;
            _applicationController = applicationController;
            Initialize();
        }

        public void Initialize()
        {
            _view.SaveButtonEnabled = false;
        }

        public object View
        {
            get { return _view; }
        }

        public void Run(int? bookingId)
        {
            _view.Accounts = _accountRepository.SelectAllAccounts().Where(i => i.IsDirect).ToList();
            _view.Branches = User.CurrentUser.Branches.ToList();
            if (bookingId != null)
            {
                var users = ServicesProvider.GetInstance().GetUserServices().FindAll(true);
                var booking = _bookingService.Get(bookingId.Value, users);
                _view.Booking = booking;
                _view.Amount = booking.Amount;
                _view.Debit = booking.Debit;
                _view.Credit = booking.Credit;
                _view.Description = booking.Description;
                _view.Date = booking.Date;
                _view.Branch = booking.Branch;
            }
            _view.Attach(this);
            _view.Run();
        }

        public void Save()
        {
            var debitAmount = _bookingService.GetAccountBalance(_view.Date, _view.Debit);
            var creditAmount = _bookingService.GetAccountBalance(_view.Date, _view.Credit);
            if (!_view.Debit.IsDebit)
            {
                if (!_view.Debit.CanBeNegative)
                    if (debitAmount < Convert.ToDecimal(_view.Amount))
                    {
                        _view.Warning(_view.Debit, debitAmount);
                        return;
                    }
            }
            if (_view.Credit.IsDebit)
            {
                if (!_view.Credit.CanBeNegative)
                    if (creditAmount < Convert.ToDecimal(_view.Amount))
                    {
                        _view.Warning(_view.Credit, creditAmount);
                        return;
                    }
            }

            if (_view.Booking == null) _view.Booking = new Booking();
            _view.Booking.Amount = _view.Amount;
            _view.Booking.Debit = _view.Debit;
            _view.Booking.Credit = _view.Credit;
            _view.Booking.Description = _view.Description;
            _view.Booking.Date = _view.Date;
            _view.Booking.Branch = _view.Branch;
            _view.Booking.User = User.CurrentUser;
            _view.Booking.ClientFirstName = "-";
            _view.Booking.ClientLastName = "-";
            _view.Booking.IsManualEditable = true;
            _view.Stop();
            _applicationController.Publish(new AddBookingMessage(this, _view.Booking));
        }
    }
}
