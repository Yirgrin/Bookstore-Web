USE [BookstoreWeb]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spGetShoppingCart
    @bookId int
AS
BEGIN
    SELECT *
    FROM Books
    WHERE @bookId = @bookId
END

ALTER PROCEDURE [dbo].[spGetShoppingCart]
	
	@Email VARCHAR(50)
AS
BEGIN
	SELECT * 
	FROM Books sc
		INNER JOIN Books b
		ON sc.bookId = b.Id
	WHERE Email = @Email

END
