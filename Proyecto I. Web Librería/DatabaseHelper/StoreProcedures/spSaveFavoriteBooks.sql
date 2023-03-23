USE [BookstoreWeb]
GO
/****** Object:  StoredProcedure [dbo].[spSaveFavoriteBook]    Script Date: 23/03/2023 04:39:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSaveFavoriteBook] 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.FavoriteBooks VALUES(@bookId, @Email)
  
END
