using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.CoreDomain.Clients;
using OpenCBS.Manager.Accounting;
using OpenCBS.Shared.Settings;

namespace OpenCBS.Services.Accounting
{
    public class AccountService : MarshalByRefObject
    {
        private readonly AccountRepository _accountRepository;

        public AccountService(User user)
        {
            _accountRepository = new AccountRepository(user);
        }

        public void SaveAccount(Account entity)
        {
            _accountRepository.Save(entity);
        }

        public void SaveAccount(Account entity, SqlTransaction transaction)
        {
            _accountRepository.Save(entity, transaction);
        }

        public void UpdateAccount(Account entity, SqlTransaction transaction)
        {
            _accountRepository.Update(entity, transaction);
        }

        public void DeleteAccount(Account entity)
        {
            _accountRepository.Delete(entity);
        }

        public IEnumerable<Account> SelectAccounts()
        {
            return _accountRepository.SelectAllAccounts();
        }

        public Account SelectAccountByNumber(string accountNumber, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;
            try
            {
                var result = _accountRepository.SelectAccountByNumber(accountNumber, tx);

                if (transaction == null)
                    tx.Commit();

                return result;
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public void AddAccountsForLoan(string portfolioAccount, string interestAccount, string transitAccount,
                                       int loanId,
                                       SqlTransaction transaction)
        {
            _accountRepository.AddAccountsForLoan(portfolioAccount, interestAccount, transitAccount, loanId, transaction);
        }

        public void DeleteAccounts(int loanId, SqlTransaction transaction)
        {
            _accountRepository.DeleteAccounts(loanId, transaction);
        }

        public void DeleteAccount(string accountNumber, SqlTransaction transaction)
        {
            _accountRepository.DeleteAccount(accountNumber, transaction);
        }

        public void CreateSavingForLaon(int loanId, string code, int userId, DateTime creationDate,
                                SqlTransaction transaction)
        {
            _accountRepository.CreateSavingForLaon(loanId, code, userId, creationDate, transaction);
        }

        public void AddClientAccount(IClient client,IDbTransaction transaction = null)
        {
            if (client == null) throw new ArgumentNullException();
            if (client.Id == 0) throw new ArgumentException();
            var parentAccountNumber = ApplicationSettings.GetInstance(User.CurrentUser.Md5).ParentClientAccount;
            var parentAccount = SelectAccountByNumber(parentAccountNumber);
            if (!string.IsNullOrEmpty(parentAccountNumber))
            {
                var account = new Account
                {
                    AccountNumber = parentAccountNumber + client.Id.ToString("D4"),
                    Label = "Account for client -" + client.Name,
                    Parent = parentAccountNumber,
                    IsDebit = parentAccount.IsDebit,
                    Type = AccountType.Balance,
                };
                _accountRepository.Save(account, transaction);
            }
        }

        public string SelectParentClientAccount(IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;
            try
            {
                var result = _accountRepository.SelectParentClientAccount(tx);

                if (transaction == null)
                    tx.Commit();

                return result;
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }
    }
}
