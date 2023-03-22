USE [BookstoreWeb]
GO
/****** Object:  StoredProcedure [dbo].[SaveFavoriteBook]    Script Date: 22/03/2023 04:16:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SaveFavoriteBook] 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.FavoriteBooks VALUES(@bookId, @Email)
  
END
