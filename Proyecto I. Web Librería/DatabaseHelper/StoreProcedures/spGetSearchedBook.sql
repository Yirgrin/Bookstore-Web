
CREATE PROCEDURE spGetSearchedBook
	
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
	WHERE Title LIKE '%' + @search + '%'
	OR ISBN  LIKE '%' + @search + '%'
	OR Author LIKE '%' + @search + '%'

END
GO


