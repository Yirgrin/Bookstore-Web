
CREATE PROCEDURE spGetShoppingCart

@Email varchar(100)

AS
BEGIN
	SELECT * 
	FROM ShoppingCart sc
		INNER JOIN Books b
		ON sc.bookId = b.Id
	WHERE Email = @Email
END
GO
