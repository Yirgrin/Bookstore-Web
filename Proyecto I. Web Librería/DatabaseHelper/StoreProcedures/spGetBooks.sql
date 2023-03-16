
CREATE PROCEDURE spGetBooks
	
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

END
GO
