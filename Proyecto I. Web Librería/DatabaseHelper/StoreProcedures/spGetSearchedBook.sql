
CREATE PROCEDURE GetSearchedBook

	@Title varchar,
	@ISBN varchar
AS
BEGIN
	
	SELECT 
		Id,
		ISBN, 
		Title,
		Author,
		ReleaseDate,
		Description,
		Photo,
		Price
	FROM Books
	WHERE Title = @Title OR ISBN = @ISBN

END
GO
