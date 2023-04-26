
CREATE PROCEDURE spSaveShoppingCart 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.ShoppingCart VALUES(@bookId, @Email)
  
END
