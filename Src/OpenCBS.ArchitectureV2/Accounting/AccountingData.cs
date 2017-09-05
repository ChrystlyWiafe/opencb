using System;
using System.Data.SqlClient;
using Dapper;

namespace OpenCBS.ArchitectureV2.Accounting
{
    public static class AccountingData
    {
        public static void DeleteInterestAccrualsEventsAndBookings(int loanId, DateTime date, SqlTransaction transaction)
        {
            var sql = @"
                declare @ids table
                (
                  id int
                )

                insert into 
	                @ids(id)
                select
                    id
                from
                    dbo.ContractEvents
                where
                        contract_id = @loanId
                    and
                        cast(event_date as date) > cast(@date as date)
                    and
                        event_type = 'AILE'
                
                --delete accrual events
                update 
	                dbo.ContractEvents 
                set 
	                is_deleted = 1 
                where 
	                id in(select id from @ids)
                
                --delete transaction for accruals
                update 
	                dbo.Booking 
                set 
	                IsDeleted = 1 
                where 
	                 LoanEventId in (select id from @ids)
                ";
            transaction.Connection.Execute(sql, new { loanId, date }, transaction);
        }
    }
}
