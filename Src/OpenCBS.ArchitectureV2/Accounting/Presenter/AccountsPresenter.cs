﻿using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Accounting.CommandData;
using OpenCBS.ArchitectureV2.Accounting.Interface.Presenter;
using OpenCBS.ArchitectureV2.Accounting.Interface.View;
using OpenCBS.ArchitectureV2.Accounting.Message;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.ArchitectureV2.Message;
using OpenCBS.CoreDomain;
using OpenCBS.Manager.Accounting;
using OpenCBS.Shared.Settings;

namespace OpenCBS.ArchitectureV2.Accounting.Presenter
{
    public class AccountsPresenter : IAccountsPresenter, IAccountsPresenterCallbacks
    {
        private readonly IAccountsView _view;
        private readonly AccountRepository _accountRepository;
        private readonly IApplicationController _applicationController;
        private bool _addAction;
        private bool _editAction;
        private bool _deleteAction;

        public AccountsPresenter(IAccountsView view,
            AccountRepository accountRepository,
            IApplicationController applicationController)
        {
            _view = view;
            _accountRepository = accountRepository;
            _applicationController = applicationController;
            Setup();
        }

        private void Setup()
        {
            var addAction = new ActionItemObject("Accounting", "EntryAccount");
            _addAction = User.CurrentUser.UserRole.IsActionAllowed(addAction);

            var editAction = new ActionItemObject("Accounting", "EditAccount");
            _editAction = User.CurrentUser.UserRole.IsActionAllowed(editAction);

            var deleteAction = new ActionItemObject("Accounting", "DeleteAccount");
            _deleteAction = User.CurrentUser.UserRole.IsActionAllowed(deleteAction);
        }

        public object View
        {
            get { return _view; }
        }

        public void Run()
        {
            _view.Attach(this);
            _applicationController.Publish(new ShowViewMessage(this, _view));
            _applicationController.Subscribe<AccountSavedMessage>(this, m => Refresh());
            Refresh();
            OnCheck();
        }

        public void Add()
        {
            _applicationController.Execute(new AddAccountCommandData());
        }

        public void Edit()
        {
            var account = _view.SelectedAccount;
            if (account == null) return;
            _applicationController.Execute(new EditAccountCommandData {Account = account});
        }

        public void Delete()
        {
            var account = _view.SelectedAccount;
            if (account == null) return;
            _applicationController.Execute(new DeleteAccountCommandData {Account = account});
        }

        public void Refresh()
        {
            _view.SetAccounts(_accountRepository.SelectAllAccounts());
        }

        public void DetachView()
        {
            _applicationController.Unsubscribe(this);
        }

        private void OnCheck()
        {
            if (!_addAction)
            {
                _view.AddButtonDisabled();
            }
            if (!_editAction)
            {
                _view.EditButtonDisabled();
            }
            if (!_deleteAction)
            {
                _view.DeleteButtonDisabled();
            }
        }
    }
}
