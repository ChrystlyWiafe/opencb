UPDATE  [TechnicalParameters]
SET     [value] = 'v17.1.0.0'
WHERE   [name] = 'VERSION'
GO

if col_length('dbo.Credit','initial_emi') IS NULL
    begin
        alter table dbo.Credit add initial_emi decimal(18,2) null
    end
GO

if col_length('dbo.PaymentMethods','accountNumber') IS NULL
    begin
        alter table dbo.PaymentMethods add accountNumber varchar(32) null
    end
GO

if col_length('dbo.Accounts','start_date') IS NULL
    begin
        alter table dbo.Accounts add [start_date] decimal(18,2) null
    end
GO

if col_length('dbo.Accounts','close_date') IS NULL
    begin
        alter table dbo.Accounts add close_date decimal(18,2) null
    end
GO

if col_length('dbo.Accounts','can_be_negative') IS NULL
    begin
        alter table dbo.Accounts add can_be_negative bit default(0)
    end
GO

if col_length('dbo.Accounts','type') IS NULL
    begin
        alter table dbo.Accounts add [type] decimal(18,2) null
    end
GO

if col_length('dbo.Accounts','is_direct') IS NULL
    begin
        alter table dbo.Accounts add is_direct decimal(18,2) null
    end
GO

if col_length('dbo.Booking','AdvanceId') IS NULL
    begin
        alter table dbo.Booking add AdvanceId decimal(18,2) null
    end
GO

if col_length('dbo.Booking','StaffId') IS NULL
    begin
        alter table dbo.Booking add StaffId decimal(18,2) null
    end
GO

if col_length('dbo.Booking','IsManualEditable') IS NULL
    begin
        alter table dbo.Booking add IsManualEditable decimal(18,2) null
    end
GO

if col_length('dbo.Booking','doc1') IS NULL
    begin
        alter table dbo.Booking add doc1 decimal(18,2) null
    end
GO

if col_length('dbo.Booking','doc2') IS NULL
    begin
        alter table dbo.Booking add doc2 decimal(18,2) null
    end
GO