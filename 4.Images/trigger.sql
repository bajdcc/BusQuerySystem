USE [bus]
GO
CREATE TRIGGER Update_Line_Time
	ON [dbo].[bus]
	AFTER UPDATE
	AS
BEGIN
	Update [dbo].[bus]
	SET [dbo].[bus].[update_time] = getdate()
	WHERE [dbo].[bus].[id]
	IN(
		SELECT [id] FROM inserted
	)
END
GO