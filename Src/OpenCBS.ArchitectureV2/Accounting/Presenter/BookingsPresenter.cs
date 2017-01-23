﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Accounting.CommandData;
using OpenCBS.ArchitectureV2.Accounting.Interface.Presenter;
using OpenCBS.ArchitectureV2.Accounting.Interface.View;
using OpenCBS.ArchitectureV2.Accounting.Message;
using OpenCBS.ArchitectureV2.Accounting.Model;
using OpenCBS.ArchitectureV2.Accounting.Service;
using OpenCBS.ArchitectureV2.CommandData;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.ArchitectureV2.Interface.Service;
using OpenCBS.ArchitectureV2.Message;
using OpenCBS.CoreDomain;
using OpenCBS.Shared.Settings;

namespace OpenCBS.ArchitectureV2.Accounting.Presenter
{
    public class BookingsPresenter : IBookingsPresenter, IBookingsPresenterCallbacks
    {
        private readonly IBookingsView _view;
        private readonly IBookingService _bookingService;
        private readonly ITranslationService _translationService;
        private readonly IApplicationController _applicationController;
        private List<Account> _accounts;
        private bool _addAction;
        private bool _editAction;
        private bool _deleteAction;
        private bool _printAction;
        private bool _isContinueAddNewBooking;

        public BookingsPresenter(
            IBookingsView view,
            IBookingService bookingService,
            ITranslationService translationService,
            IApplicationController applicationController)
        {
            _view = view;
            _bookingService = bookingService;
            _translationService = translationService;
            _applicationController = applicationController;
            Setup();
        }

        public void Setup()
        {
            var addAction = new ActionItemObject("Accounting", "EntryTransaction");
            _addAction = User.CurrentUser.UserRole.IsActionAllowed(addAction);

            var editAction = new ActionItemObject("Accounting", "EditTransaction");
            _editAction = User.CurrentUser.UserRole.IsActionAllowed(editAction);

            var deleteAction = new ActionItemObject("Accounting", "DeleteTransaction");
            _deleteAction = User.CurrentUser.UserRole.IsActionAllowed(deleteAction);

            var printAction = new ActionItemObject("Accounting", "PrintTransaction");
            _printAction = User.CurrentUser.UserRole.IsActionAllowed(printAction);

            _accounts = _bookingService.SelectAllAccounts().ToList();
            var accounts = new List<Account>
            {
                new Account {AccountNumber = _translationService.Translate("All"), Lft = 0, Rgt = int.MaxValue}
            };
            accounts.AddRange(_accounts);
            _view.Accounts = accounts;

            OnCheck();
        }

        public void Run()
        {
            Refresh();
            _view.Attach(this);
            _applicationController.Publish(new ShowViewMessage(this, _view));
        }

        private void OnRefreshBookings()
        {
            Refresh();
            OnCheck();
        }

        public object View
        {
            get { return _view; }
        }

        public void OnCheck()
        {
            if (_view.SelectedBooking == null) return;

            if (!_addAction)
            {
                _view.AddButtonDisabled();
            }

            if (!_editAction)
            {
                _view.EditButtonDisabled();
            }
            else
            {
                _view.EditButtonEnabled();
                if (!_view.SelectedBooking.IsManualEditable)
                {
                    _view.EditButtonDisabled();
                }
            }

            if (!_deleteAction)
            {
                _view.DeleteButtonDisabled();
            }
            else
            {
                _view.DeleteButtonEnabled();
                if (_view.SelectedBooking.IsDeleted)
                {
                    _view.DeleteButtonDisabled();
                }
                if (!_view.SelectedBooking.IsManualEditable)
                {
                    _view.DeleteButtonDisabled();
                }
            }

            if (!_printAction)
            {
                _view.PrintButtonDisabled();
            }
        }

        public void Add()
        {
            _applicationController.Subscribe<AddBookingMessage>(this, SaveBooking);
            _applicationController.Execute(new AddBookingCommandData());
            if (!_isContinueAddNewBooking) return;
            _isContinueAddNewBooking = false;
            Add();
        }

        public void Edit()
        {
            if (_view.SelectedBooking == null) return;
            if (!_view.SelectedBooking.IsManualEditable) return;
            _applicationController.Subscribe<AddBookingMessage>(this, SaveBooking);
            _applicationController.Execute(new EditBookingCommandData {Id = _view.SelectedBooking.Id});
            _applicationController.Unsubscribe(this);
        }

        public void OnDeleteBooking()
        {
            if (_view.SelectedBooking == null) return;
            _applicationController.Execute(new DeleteBookingCommandData {Id = _view.SelectedBooking.Id});
            Refresh();
        }

        public void Refresh()
        {
            var debit = _view.DebitAccount;
            var credit = _view.CreditAccount;
            var bookings = _bookingService.SelectBookings(_view.DateFrom.Date, _view.DateTo.Date, debit, credit);
            _view.SetBookings(bookings);
        }

        public void SaveBooking(AddBookingMessage message)
        {
            if (message.Booking.Id == 0)
            {
                _bookingService.SaveBooking(message.Booking);

                var dialogResult = _view.ShowMessage("Do you want continue work on manual transaction form?");
                _isContinueAddNewBooking = dialogResult == DialogResult.Yes;
            }
            else
            {
                _bookingService.UpdateBookings(new List<Booking> {message.Booking});
            }
            OnRefreshBookings();
            _applicationController.Publish(new BookingSavedMessage(this, message.Booking));
        }

        public void OnFiltering()
        {
            Refresh();
        }

        public void OnControlPrint()
        {
            _applicationController.Execute(new PrintControlCommandData {Control = _view.Control});
        }

        public void DetachView()
        {
            _applicationController.Unsubscribe(this);
        }
    }
}
