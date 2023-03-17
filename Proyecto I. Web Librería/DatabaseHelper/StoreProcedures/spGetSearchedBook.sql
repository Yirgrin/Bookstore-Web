
CREATE PROCEDURE GetSearchedBook
	
	@search varchar(MAX)
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
	HERE Title LIKE '%' + @search + '%'
	OR ISBN  LIKE '%' + @search + '%'
	OR Author LIKE '%' + @search + '%'

END
GO


