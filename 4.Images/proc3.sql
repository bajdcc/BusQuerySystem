USE [bus]
GO
CREATE PROCEDURE Update_Line
		@L_NAME NVARCHAR(50),  
		@L_ROUTE NVARCHAR(500) = '',  
		@L_START_TIME NCHAR(10),
		@L_END_TIME NCHAR(10),
		@L_PRICE NUMERIC(8, 2) = 0
	AS  
BEGIN
	IF NOT EXISTS (
		SELECT * FROM [dbo].[bus]
		WHERE [name] = @L_NAME )
	RETURN 1;

	BEGIN TRY
	UPDATE [dbo].[bus] SET
		[dbo].[bus].[name] = @L_NAME,
		[dbo].[bus].[route] = @L_ROUTE,
		[dbo].[bus].[start_time] = @L_START_TIME,
		[dbo].[bus].[end_time] = @L_END_TIME,
		[dbo].[bus].[price] = @L_PRICE
	WHERE [dbo].[bus].[name] = @L_NAME
	END TRY
	BEGIN CATCH
		RETURN 3;
	END CATCH	
	RETURN 2;
END
GO