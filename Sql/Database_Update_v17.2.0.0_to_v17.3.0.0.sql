UPDATE  [TechnicalParameters]
SET     [value] = 'v17.3.0.0'
WHERE   [name] = 'VERSION'
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