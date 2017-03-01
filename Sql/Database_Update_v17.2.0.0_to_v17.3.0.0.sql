UPDATE  [TechnicalParameters]
SET     [value] = 'v17.3.0.0'
WHERE   [name] = 'VERSION'
GO

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'entryFeesToolStripMenuItem') IS NULL
    BEGIN
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('entryFeesToolStripMenuItem')
    END
GO

IF (SELECT TOP 1 [component_name] FROM dbo.[MenuItems] WHERE [component_name] = 'paymentMethodToolStripMenuItem') IS NULL
    BEGIN
		INSERT INTO [dbo].[MenuItems]([component_name]) VALUES ('paymentMethodToolStripMenuItem')
    END
GO