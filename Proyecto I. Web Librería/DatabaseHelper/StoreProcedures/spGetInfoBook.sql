
CREATE PROCEDURE spGetInfoBook

	@Id int
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
	WHERE Id = @Id

END
GO
