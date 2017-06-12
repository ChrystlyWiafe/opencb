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