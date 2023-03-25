
CREATE PROCEDURE spGetFavoriteBooks
	
	@Email VARCHAR(50)
AS
BEGIN
	SELECT * 
	FROM FavoriteBooks fb
		INNER JOIN Books b
		ON fb.bookId = b.Id
	WHERE Email = @Email

END
GO
