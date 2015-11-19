USE [bus]
GO
CREATE PROCEDURE Delete_Line
		@L_NAME NVARCHAR(50)		
	AS  
BEGIN
	IF NOT EXISTS (
		SELECT * FROM [dbo].[bus]
		WHERE [name] = @L_NAME )
	RETURN 1;

	BEGIN TRY
	DELETE FROM [dbo].[bus] WHERE [dbo].[bus].[name] = @L_NAME
	END TRY
	BEGIN CATCH
		RETURN 3;
	END CATCH
	RETURN 2;
END
GO