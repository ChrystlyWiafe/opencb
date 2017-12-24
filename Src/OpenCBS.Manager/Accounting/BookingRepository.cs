using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain;
using OpenCBS.CoreDomain.Accounting.Model;

namespace OpenCBS.Manager.Accounting
{
    public class BookingRepository : Manager
    {
        private readonly SqlConnection _connection;

        public BookingRepository(User pUser) : base(pUser)
        {
            _connection = CoreDomain.DatabaseConnection.GetConnection();
        }

        public void Save(IEnumerable<Booking> entity, IDbTransaction tx)
        {
            var rows = entity.Select(booking => booking.Map()).ToList();
                const string query = @"
                    insert into
                        dbo.Booking 
                    (
                        DebitAccount
                        , CreditAccount
                        , Amount
                        , Date
                        , LoanEventId
                        , UserId
                        , SavingEventId
                        , LoanId
                        , ClientId
                        , BranchId
                        , Description
                        , IsDeleted
                        , AdvanceId
                        , StaffId
                        , IsManualEditable
                        , Doc1
                        , Doc2
                    ) 
                    values 
                    (
                        @DebitAccount
                        , @CreditAccount
                        , @Amount
                        , @Date
                        , @LoanEventId
                        , @UserId
                        , @SavingEventId
                        , @LoanId
                        , @ClientId
                        , @BranchId
                        , @Description
                        , @IsDeleted
                        , @AdvanceId
                        , @StaffId
                        , @IsManualEditable
                        , @Doc1
                        , @Doc2
                    )
                    ";
                tx.Connection.Execute(query, rows, tx);
        }

        public int Save(Booking entity, IDbTransaction tx)
        {
            const string query = @"
                    insert into
                        dbo.Booking 
                    (
                        DebitAccount
                        , CreditAccount
                        , Amount
                        , Date
                        , LoanEventId
                        , UserId
                        , SavingEventId
                        , LoanId
                        , ClientId
                        , BranchId
                        , Description
                        , IsDeleted
                        , AdvanceId
                        , StaffId
                        , IsManualEditable
                        , Doc1
                        , Doc2
                    ) 
                    output 
                        inserted.id
                    values 
                    (
                        @DebitAccount
                        , @CreditAccount
                        , @Amount
                        , @Date
                        , @LoanEventId
                        , @UserId
                        , @SavingEventId
                        , @LoanId
                        , @ClientId
                        , @BranchId
                        , @Description
                        , @IsDeleted
                        , @AdvanceId
                        , @StaffId
                        , @IsManualEditable
                        , @Doc1
                        , @Doc2
                    )
                    ";
            return tx.Connection.Query<int>(query, entity.Map(), tx).FirstOrDefault();
        }

        public void Update(IEnumerable<Booking> entity, IDbTransaction tx)
        {
            var rows = entity.Select(i => i.Map()).ToList();
            const string query = @"
                    update 
                        dbo.Booking 
                    set 
                        DebitAccount = @DebitAccount
                        , CreditAccount = @CreditAccount
                        , Amount = @Amount
                        , Date = @Date
                        , LoanEventId = @LoanEventId
                        , BranchId = @BranchId
                        , SavingEventId = @SavingEventId
                        , LoanId = @LoanId
                        , UserId = @UserId
                        , ClientId = @ClientId
                        , Description = @Description
                        , IsDeleted = @IsDeleted 
                        , Doc1 = @Doc1
                        , Doc2 = @Doc2
                    where 
                        Id = @Id
                    ";
            tx.Connection.Execute(query, rows, tx);
        }

        public void Delete(int bookingId, IDbTransaction tx)
        {
            const string query = @"
                    update 
                        dbo.Booking 
                    set 
                        IsDeleted = 1,
                        CancelDate = getdate()  
                    where 
                        Id = @bookingId
                    ";
            tx.Connection.Execute(query, new {bookingId}, tx);
        }

        public void DeleteByLoanEvent(int loanEventId, IDbTransaction tx)
        {
            const string query = @"
                    update 
                        dbo.Booking 
                    set 
                        IsDeleted = 1,
                        CancelDate = getdate()  
                    where 
                        LoanEventId = @loanEventId 
                    ";
            tx.Connection.Execute(query, new {loanEventId}, tx);
        }

        public void DeleteBySavingEvent(int savingEventId, IDbTransaction tx)
        {
            const string query = @"
                    update 
                        dbo.Booking 
                    set 
                        IsDeleted = 1,
                        CancelDate = getdate()
                    where 
                        SavingEventId = @savingEventId
                    ";
            tx.Connection.Execute(query, new {savingEventId}, tx);
        }

        public Booking Get(int id, IEnumerable<User> users, IDbTransaction tx)
        {
            const string query = @"
                    select 
                        b.*
                        , coalesce(p.last_name, g.name, c.name, '-') ClientLastName
                        , isnull(p.first_name, '-') ClientFirstName 
                    from 
                        dbo.Booking b 
                    left join 
                        dbo.Tiers t on t.id = b.ClientId
                    left join 
                        dbo.Persons p on p.id = t.id
                    left join 
                        dbo.Corporates c on c.id = t.id
                    left join 
                        dbo.Groups g on g.id = t.id
                    where 
                        b.Id = @id
                    ";
            var row = tx.Connection.Query<BookingDto>(query, new {id}, tx).Single();
            var accounts = SelectAllAccounts(tx).ToList();
            var booking = row.Map();
            booking.Credit = accounts.FirstOrDefault(i => i.AccountNumber == row.CreditAccount);
            booking.Debit = accounts.FirstOrDefault(i => i.AccountNumber == row.DebitAccount);
            booking.User = users.FirstOrDefault<User>(i => i.Id == row.UserId);
            return booking;
        }

        public IEnumerable<BookingDto> SelectBookings(DateTime from, DateTime to, Account debit, Account credit,
            IDbTransaction transaction)
        {
            const string query = @"
                    select 
                        b.*
                        , coalesce(p.last_name, g.name, c.name, '-') ClientLastName
                        , isnull(p.first_name, '-') ClientFirstName 
                        , u.first_name + ' ' + u.last_name UserName
                    from 
                        dbo.Booking b 
                    left join 
                        dbo.Tiers t on t.id = b.ClientId
                    left join 
                        dbo.Persons p on p.id = t.id
                    left join 
                        dbo.Corporates c on c.id = t.id
                    left join 
                        dbo.Groups g on g.id = t.id
                    left join
                        dbo.Users u on u.id = b.UserId
                    left join
						dbo.Accounts da on da.account_number = b.DebitAccount
					left join
						dbo.Accounts ca on ca.account_number = b.CreditAccount
                    where 
                        convert(date, b.Date) >= @from 
                        and convert(date, b.Date) <= @to
                        and da.lft >= @debitLeft and da.rgt <= @debitRight
                        and ca.lft >= @creditLeft and ca.rgt <= @creditRight

                    ";
            return transaction.Connection.Query<BookingDto>(query, new
            {
                from,
                to,
                debitLeft = debit.Lft,
                debitRight = debit.Rgt,
                creditLeft = credit.Lft,
                creditRight = credit.Rgt
            }, transaction);
        }

        public IEnumerable<BookingDto> SelectBookings(DateTime from, DateTime to, IDbTransaction tx)
        {
            const string query = @"
                    select 
                        b.*
                        , coalesce(p.last_name, g.name, c.name, '-') ClientLastName
                        , isnull(p.first_name, '-') ClientFirstName 
                        , u.first_name + ' ' + u.last_name UserName
                    from 
                        dbo.Booking b 
                    left join 
                        dbo.Tiers t on t.id = b.ClientId
                    left join 
                        dbo.Persons p on p.id = t.id
                    left join 
                        dbo.Corporates c on c.id = t.id
                    left join 
                        dbo.Groups g on g.id = t.id
                    left join
                        dbo.Users u on u.id = b.UserId
                    left join
						dbo.Accounts da on da.account_number = b.DebitAccount
					left join
						dbo.Accounts ca on ca.account_number = b.CreditAccount
                    where 
                        convert(date, b.Date) >= @from 
                        and convert(date, b.Date) <= @to
                    ";
            return tx.Connection.Query<BookingDto>(query, new {from, to}, tx);
        }

        public decimal GetAccountBalance(DateTime date, Account account, IDbTransaction tx)
        {
            const string query = @"
                    select 
                        case 
                            when a.is_debit = 1
                            then isnull(b.endDebit, 0) - isnull(b.endCredit, 0)
                            else isnull(b.endCredit, 0) - isnull(b.endDebit, 0)
                        end Balance
                    from 
                    (
                        select 
                            t.account_number account
                            , sum(isnull(endDebit.amount, 0)) endDebit
                            , sum(isnull(endCredit.amount, 0)) endCredit
                        from 
                            dbo.Accounts t
                        left join 
                        (
                            select 
                                DebitAccount account
                                , sum(isnull(amount, 0)) amount
                            from 
                                dbo.Booking
                            where 
                                cast(Date as date) <= cast(@date as date) 
                                and IsDeleted = 0
                            group by 
                                DebitAccount 
                        ) endDebit on endDebit.account = t.account_number
                        left join 
                        (
                            select 
                                CreditAccount account
                                , sum(isnull(amount, 0)) amount
                            from 
                                dbo.Booking 
                            where 
                                cast(Date as date) <= cast(@date as date) 
                                and IsDeleted = 0
                            group by 
                                CreditAccount
                        ) endCredit on endCredit.account = t.account_number
                        group by 
                            t.account_number
                    ) b
                    left join 
                        dbo.Accounts a on a.account_number = b.account
                    where 
                        a.account_number = @number
                    ";
            return tx.Connection.Query<decimal>(query, new {date, number = account.AccountNumber}, tx).FirstOrDefault();
        }

        public IEnumerable<Account> SelectAllAccounts(IDbTransaction tx)
        {
            const string query = @"
                    select 
                        account_number AccountNumber
                        , label Label
                        , start_date StartDate
                        , close_date CloseDate
                        , type Type
                        , is_debit IsDebit
                        , is_direct IsDirect
                        , can_be_negative CanBeNegative
                        , parent Parent
                        , lft Lft
                        , rgt Rgt
                    from 
                        dbo.Accounts";
            return tx.Connection.Query<Account>(query, null, tx);
        }

        public List<AccountMovement> GetAccountMovements(DateTime @from, DateTime to, IDbTransaction tx,
            Account account = null)
        {
            const string query = @"
                select 
                    id Id
                    , DebitAccount Debit
                    , CreditAccount Credit
                    , amount DebitAmount
                    , 0 CreditAmount
                    , date Date
                    , description Description
                from 
                    dbo.Booking b
                left join 
                    dbo.Accounts debit on debit.account_number=b.DebitAccount
                where 
                    convert(date, date) >= @from 
                    and convert(date, date) <= @to 
                    and (debit.lft >= @lft and debit.rgt <= @rgt)
				union all
				select 
                    id Id
                    , DebitAccount Debit
                    , CreditAccount Credit
                    , 0 DebitAmount
                    , amount CreditAmount
                    , date Date
                    , description Description
                from 
                    dbo.Booking b
                left join 
                    dbo.Accounts credit on credit.account_number=b.CreditAccount
                where 
                    convert(date, date) >= @from 
                    and convert(date, date) <= @to 
                    and (credit.lft >= @lft and credit.rgt <= @rgt 
                    and b.IsDeleted = 0)
                ";
            var lft = account == null ? 0 : account.Lft;
            var rgt = account == null ? int.MaxValue : account.Rgt;
            return tx.Connection.Query<AccountMovement>(query, new {from, to, lft, rgt}, tx).ToList();
        }

        public void CloseAccount(DateTime date, Account account, IDbTransaction tx)
        {
            const string query = @"
                    update 
                        dbo.Accounts 
                    set 
                        close_date = @date 
                    where 
                        account_number = @accountNumber
                    ";
            tx.Connection.Execute(query, new {date, accountNumber = account.AccountNumber}, tx);
        }

        public void RecoverAccount(Account account, IDbTransaction tx)
        {
            const string query = @"
                    update 
                        dbo.Accounts 
                    set 
                        close_date = null 
                    where 
                        account_number = @accountNumber
                    ";
            tx.Connection.Execute(query, new {accountNumber = account.AccountNumber}, tx);
        }

        public int GetLoanId(int savingId, IDbTransaction tx)
        {
            const string query = @"
                    select 
                        loan_id 
                    from 
                        dbo.SavingContracts 
                    where 
                        id = @savingId
                    ";
            return tx.Connection.Query<int>(query, new {savingId}, tx).FirstOrDefault();
        }

        public IEnumerable<int> GetChildEvents(int loanEventId, IDbTransaction tx)
        {
            const string query = @"
                        ;WITH cte AS 
                            (
                                SELECT
	                                ce.id
	                                , ce.parent_id
                                FROM
                                    dbo.ContractEvents ce
                                WHERE
                                    id = @id

                                UNION ALL

                                SELECT
	                                ce.id
	                                , ce.parent_id
                                FROM
                                    dbo.ContractEvents ce
                                JOIN
                                    cte c ON ce.parent_id = c.id
                            )

                            SELECT
                                id
                            FROM
                                cte
                            WHERE
                                parent_id IS NOT NULL
                    ";
            return tx.Connection.Query<int>(query, new { id = loanEventId }, tx);
        }
    }
}
