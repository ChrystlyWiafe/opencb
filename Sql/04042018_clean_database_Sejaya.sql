declare @currentDate datetime = '2017-04-01'
declare @NotActive_LoansIds table(NotActiveLoanId int)

-------------------Set Non Active Loans Ids-------------------------
insert into @NotActive_LoansIds
select
    con.id
from 
	dbo.Contracts con
where 
	con.id not in (select id from dbo.ActiveLoans(@currentDate, 0))
	and close_date <= @currentDate

--------------------------Delete Non Active Loans-------------------------
DECLARE @Counter INT = 1
WHILE @Counter > 0
BEGIN
 
    delete top(1000)
    from dbo.InstallmentHistory
    where contract_id in (select NotActiveLoanId from @NotActive_LoansIds)
    SET @Counter = @@ROWCOUNT 
END

----------------------Delete Loan Additional Information------------------
delete 
from dbo.Installments
where contract_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete
from dbo.CreditEntryFees
where credit_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete
from dbo.Credit
where id in (select NotActiveLoanId from @NotActive_LoansIds)

--delete
--from dbo.CustomFieldsValues
--where field_id in (63,64,65,66,67,68,69,70,71) 
--and owner_id in (select NotActiveLoanId from @NotActive_LoansIds)


-----------------Delete Credits and Events--------------------------
declare @NotActive_ContractEventsIds table (NotActiveContractEventsId int)

insert into @NotActive_ContractEventsIds
    select 
		ce.id 
    from 
		dbo.ContractEvents ce 
    where 
		ce.contract_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete
from dbo.AccrualInterestLoanEvents
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.CreditInsuranceEvents
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete 
from dbo.InterestWriteOffEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.InterestWriteOffEvents
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.LoanDisbursmentEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.LoanEntryFeeEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.LoanPenaltyAccrualEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.LoanTransitionEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.OverdueEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.PenaltyWriteOffEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.ProvisionEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.RepaymentEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.ReschedulingOfALoanEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.TrancheEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.WriteOffEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete
from dbo.LoanDisbursmentEvents    
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)

delete 
from dbo.ContractEvents  
where id in (select NotActiveContractEventsId from @NotActive_ContractEventsIds)


-----------------Delete Contracts and Projects--------------
delete 
from dbo.ContractAssignHistory  
where contract_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete 
from dbo.LoansLinkSavingsBook  
where loan_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete 
from dbo.CollateralPropertyValues  
where contract_collateral_id in 
(select id
from dbo.CollateralsLinkContracts  
where contract_id in (select NotActiveLoanId from @NotActive_LoansIds))

delete 
from dbo.CollateralsLinkContracts  
where contract_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete 
from dbo.LinkGuarantorCredit  
where contract_id in (select NotActiveLoanId from @NotActive_LoansIds)

delete
from dbo.Contracts
where id in (select NotActiveLoanId from @NotActive_LoansIds)

delete from dbo.Projects where id in
(
	select project_id from dbo.Contracts
	where id in (select NotActiveLoanId from @NotActive_LoansIds)
)