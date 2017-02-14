UPDATE  [TechnicalParameters]
SET     [value] = 'v17.2.0.0'
WHERE   [name] = 'VERSION'
GO

IF (SELECT TOP 1 [key] FROM dbo.[GeneralParameters] WHERE [key] = 'USE_ACCRUALS_VALIDATION') IS NULL
    BEGIN
        INSERT INTO [GeneralParameters]([key], [value]) VALUES('USE_ACCRUALS_VALIDATION', 0)
    END
GO

IF  (NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FuseboxLogs]')))
	BEGIN
		CREATE TABLE dbo.FuseboxLogs
		(
			fuse_name nvarchar(50) not null
			, started_at datetime not null
			, ended_at datetime not null
			, error_message nvarchar(max) null
			, stack_trace nvarchar(max) null
		)
	END
GO