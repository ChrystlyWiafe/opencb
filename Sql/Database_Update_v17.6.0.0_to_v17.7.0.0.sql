UPDATE  [TechnicalParameters]
SET     [value] = 'v17.7.0.0'
WHERE   [name] = 'VERSION'
GO
  
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'IX_LoanDisbursmentEvents_amount_fees_payment_method_id')
CREATE NONCLUSTERED INDEX [IX_LoanDisbursmentEvents_amount_fees_payment_method_id]
ON [dbo].[LoanDisbursmentEvents] ([id])
INCLUDE ([amount],[fees],[payment_method_id])
GO

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'IX_LoanEntryFeeEvents_fees_disbursement_event_id')
CREATE NONCLUSTERED INDEX [IX_LoanEntryFeeEvents_fees_disbursement_event_id]
ON [dbo].[LoanEntryFeeEvents] ([id])
INCLUDE ([fee],[disbursement_event_id])
GO

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'IX_Contracts_status')
CREATE NONCLUSTERED INDEX [IX_Contracts_status]
ON [dbo].[Contracts] ([project_id],[nsg_id])
INCLUDE ([status])
GO