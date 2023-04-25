USE [BookstoreWeb]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spSaveShoppingCart
    @bookId int
AS
BEGIN
    SELECT *
    FROM Books
    WHERE @bookId = @bookId
END


ALTER PROCEDURE [dbo].[spSaveShoppingCart] 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.FavoriteBooks VALUES(@bookId, @Email)
  
END