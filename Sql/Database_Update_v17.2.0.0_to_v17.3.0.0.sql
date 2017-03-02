UPDATE  [TechnicalParameters]
SET     [value] = 'v17.3.0.0'
WHERE   [name] = 'VERSION'
GO

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'StopPenaltyForLoan') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'StopPenaltyForLoan')
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
IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'StopInterestForLoan') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'StopInterestForLoan')
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

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'RecoverPenaltyForLoan') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'RecoverPenaltyForLoan')
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

IF (SELECT TOP 1 [method_name] FROM dbo.[ActionItems] WHERE [method_name] = 'RecoverInterestForLoan') IS NULL
    BEGIN				
		INSERT INTO [dbo].[ActionItems]([class_name], [method_name]) VALUES ('LoanServices', 'RecoverInterestForLoan')
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