
CREATE PROCEDURE spDeleteCartBook

	@Email VARCHAR(50),
	@bookId INT
AS
BEGIN	
	DELETE FROM ShoppingCart WHERE bookId = @bookId AND Email = @Email
END
GO
