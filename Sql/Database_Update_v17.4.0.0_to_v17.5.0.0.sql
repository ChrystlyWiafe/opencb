UPDATE  [TechnicalParameters]
SET     [value] = 'v17.5.0.0'
WHERE   [name] = 'VERSION'
GO

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'openDayToolStripMenuItem') IS NULL
    BEGIN				
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('openDayToolStripMenuItem')
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

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'closeDayToolStripMenuItem') IS NULL
    BEGIN				
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('closeDayToolStripMenuItem')
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

IF col_length('dbo.Packages','reschedule_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Packages ADD reschedule_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','reschedule_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD reschedule_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','original_principal_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD original_principal_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','principal_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD principal_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','interest_accrued_but_not_due_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD interest_accrued_but_not_due_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','interest_due_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD interest_due_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','interest_due_but_not_received_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD interest_due_but_not_received_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','interest_income_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD interest_income_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','accrued_penalty_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD accrued_penalty_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF col_length('dbo.Credit','penalty_income_account') IS NULL
    BEGIN
		ALTER TABLE dbo.Credit ADD penalty_income_account VARCHAR(32) REFERENCES dbo.Accounts(account_number) NULL
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Tax_On_Interests_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Accounts_Packages_Tax_On_Interests_Account]
GO

IF col_length('dbo.Packages','tax_interests_account') IS NOT NULL
    BEGIN
		ALTER TABLE dbo.Packages DROP COLUMN tax_on_interests_account 
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Tax_On_Penalty_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Accounts_Tax_On_Penalty_Account]
GO

IF col_length('dbo.Packages','tax_on_penalty_account') IS NOT NULL
    BEGIN
		ALTER TABLE dbo.Packages DROP COLUMN tax_on_penalty_account
    END
GO

IF col_length('dbo.Packages','tax_value') IS NOT NULL
    BEGIN
		ALTER TABLE dbo.Packages DROP COLUMN tax_value
    END
GO