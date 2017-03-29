﻿using System;
using System.Collections.Generic;
using System.Data;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;
using OpenCBS.CoreDomain.Events.Saving;
using OpenCBS.Manager.Accounting;

namespace OpenCBS.Services.Accounting
{
    public class BookingService : MarshalByRefObject
    {
        private BookingRepository _repository;

        public BookingService(User pUser)
        {
            _repository = new BookingRepository(pUser);
        }

        public void SaveBookings(IEnumerable<Booking> entity, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                if (entity == null) return;
                _repository.Save(entity, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public void SaveBooking(Booking booking, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                booking.Id = _repository.Save(booking, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public void UpdateBookings(IEnumerable<Booking> entity, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                if (entity == null) return;
                _repository.Update(entity, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public void DeleteBooking(int bookingId, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                _repository.Delete(bookingId, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public decimal GetAccountBalance(DateTime date, Account account, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                var result = _repository.GetAccountBalance(date, account, tx);

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

        public void DeleteBookingsByEvent(IDictionary<string, object> entity, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                var eEvent = entity.ContainsKey("Event") ? (CoreDomain.Events.Loan.Event)entity["Event"] : null;
                if (eEvent == null) return;
                if (eEvent is SavingEvent)
                {
                    _repository.DeleteBySavingEvent(eEvent.Id, tx);
                    return;
                }
                var loanEventId = eEvent.ParentId ?? eEvent.Id;
                _repository.DeleteByLoanEvent(loanEventId, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public Booking Get(int bookingId, IEnumerable<User> users, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                var result = _repository.Get(bookingId, users, tx);

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

        public IEnumerable<BookingDto> SelectBookings(DateTime from, DateTime to, Account debit, Account credit, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                var result = from > to ? new List<BookingDto>() : _repository.SelectBookings(from, to, debit, credit, tx);

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

        public IEnumerable<Account> SelectAllAccounts(IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                var result = _repository.SelectAllAccounts(tx);

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

        public BookingRepository Repository
        {
            set { _repository = value; }
        }

        public void CloseAccount(DateTime date, Account account, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                : transaction;

            try
            {
                _repository.CloseAccount(date, account, tx);

                if (transaction == null)
                    tx.Commit();
            }
            catch (Exception error)
            {
                if (transaction == null)
                    tx.Rollback();

                throw new Exception(error.Message);
            }
        }

        public void RecoverAccount(Account account, IDbTransaction transaction = null)
        {
            // ReSharper disable once ConvertConditionalTernaryToNullCoalescing
            var tx = transaction == null
                     ? CoreDomain.DatabaseConnection.GetConnection().BeginTransaction()
                     : transaction;

            try
            {
                _repository.RecoverAccount(account, tx);

                if (transaction == null)
                    tx.Commit();
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