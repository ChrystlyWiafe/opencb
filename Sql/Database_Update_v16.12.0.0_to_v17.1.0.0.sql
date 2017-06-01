UPDATE  [TechnicalParameters]
SET     [value] = 'v17.1.0.0'
WHERE   [name] = 'VERSION'
GO

IF col_length('dbo.Credit','initial_emi') IS NULL
    BEGIN
        ALTER TABLE dbo.Credit ADD initial_emi DECIMAL(18,2) NULL
    END
GO

IF col_length('dbo.PaymentMethods','accountNumber') IS NULL
    BEGIN
        ALTER TABLE dbo.PaymentMethods ADD accountNumber VARCHAR(32) NULL
    END
GO

IF col_length('dbo.Accounts','start_date') IS NULL
    BEGIN
        ALTER TABLE dbo.Accounts ADD [start_date] DATETIME NULL
    END
GO

IF col_length('dbo.Accounts','close_date') IS NULL
    BEGIN
        ALTER TABLE dbo.Accounts ADD close_date DATETIME NULL
    END
GO

IF col_length('dbo.Accounts','can_be_negative') IS NULL
    BEGIN
        ALTER TABLE dbo.Accounts ADD can_be_negative BIT DEFAULT(0)
    END
GO

IF col_length('dbo.Accounts','type') IS NULL
    BEGIN
        ALTER TABLE dbo.Accounts ADD [type] TINYINT NULL
    END
GO

IF col_length('dbo.Accounts','is_direct') IS NULL
    BEGIN
        ALTER TABLE dbo.Accounts ADD is_direct BIT NULL
    END
GO

IF col_length('dbo.Booking','AdvanceId') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD AdvanceId INT NULL
    END
GO

IF col_length('dbo.Booking','StaffId') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD StaffId INT NULL
    END
GO

IF col_length('dbo.Booking','IsManualEditable') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD IsManualEditable BIT NULL
    END
GO

IF col_length('dbo.Booking','doc1') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD doc1 VARCHAR(255) NULL
    END
GO

IF col_length('dbo.Booking','doc2') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD doc2 VARCHAR(255) NULL
    END
GO

IF col_length('dbo.Booking','CancelDate') IS NULL
    BEGIN
        ALTER TABLE dbo.Booking ADD CancelDate DATE NULL
    END
GO