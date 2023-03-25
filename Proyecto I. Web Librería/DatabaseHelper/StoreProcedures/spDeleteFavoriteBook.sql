
CREATE PROCEDURE spDeleteFavoriteBook

	@Email VARCHAR(50),
	@bookId INT
AS
BEGIN	
	DELETE FROM FavoriteBooks 
	WHERE bookId = @bookId AND Email = @Email
END
GO
