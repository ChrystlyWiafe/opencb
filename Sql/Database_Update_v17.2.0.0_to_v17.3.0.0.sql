UPDATE  [TechnicalParameters]
SET     [value] = 'v17.3.0.0'
WHERE   [name] = 'VERSION'
GO

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'entryFeesToolStripMenuItem') IS NULL
    BEGIN				
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('entryFeesToolStripMenuItem')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleMenus](menu_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'paymentMethodToolStripMenuItem') IS NULL
    BEGIN
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('paymentMethodToolStripMenuItem')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleMenus](menu_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'StopPenalty') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'StopPenalty')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleActions](action_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'StopInterest') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'StopInterest')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleActions](action_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'RecoverPenalty') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'RecoverPenalty')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleActions](action_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'RecoverInterest') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'RecoverInterest')
		DECLARE @id INT = SCOPE_IDENTITY()
		INSERT INTO [dbo].[AllowedRoleActions](action_item_id,role_id,allowed)
		SELECT
			@id
			, r.id
			, CASE
					WHEN r.code in ('ADMIN','SUPER')
					THEN 1
					ELSE 0
				END
		FROM dbo.Roles r
    END
GO

IF (NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]')))
    BEGIN
        CREATE TABLE dbo.NonAccrualInterestEvents
        (
            id int null
            , interest money null
        )
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] DROP CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] WITH NOCHECK ADD CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents] FOREIGN KEY([id])
    REFERENCES [dbo].[ContractEvents] ([id])
GO

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] NOCHECK CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents]
GO

IF (NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]')))
    BEGIN
        CREATE TABLE dbo.NonAccrualPenaltyEvents
        (
            id int not null
            , penalty money not null
        ) ON [PRIMARY]
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] WITH NOCHECK ADD CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents] FOREIGN KEY([id])
    REFERENCES [dbo].[ContractEvents] ([id])
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] NOCHECK CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents]
GO

IF (SELECT TOP 1 [key] FROM dbo.[GeneralParameters] WHERE [key] = 'SHOW_SPECIAL_FUNCTIONS_BUTTON') IS NULL
    BEGIN
        INSERT INTO [GeneralParameters]([key], [value]) VALUES('SHOW_SPECIAL_FUNCTIONS_BUTTON', 0)
    END
GO

IF col_length('dbo.EntryFees','account_number') IS NULL
    BEGIN
        ALTER TABLE dbo.EntryFees ADD account_number VARCHAR(32) REFERENCES dbo.Accounts(account_number) NOT NULL
    END
GO

IF col_length('dbo.Packages','principal_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD principal_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','interest_accrued_but_not_due_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD interest_accrued_but_not_due_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','interest_due_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD interest_due_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','interest_due_but_not_received_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD interest_due_but_not_received_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','interest_income_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD interest_income_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','tax_on_interests_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD tax_on_interests_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','accrued_penalty_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD accrued_penalty_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','penalty_income_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD penalty_income_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Packages','tax_on_penalty_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD tax_on_penalty_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO