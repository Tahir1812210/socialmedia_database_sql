USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[sys_RegionsDelete]    Script Date: 9/18/2023 4:46:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sys_RegionsDelete]
(
  @FormId int 
 ,@User			  varchar(50)
 ,@Lang			  varchar(20)= 'EN'
 ,@ID		int
 ,@Error NVARCHAR(MAX) out
)
AS 
BEGIN
SET NOCOUNT ON; 
	
	 EXEC sys_CheckPermession @FormId=@FormId , @User=@User ,@Lang=@Lang , @Mode= 'I'
	 
	 DECLARE  @UserId INT =(select top 1 ID FROM sys_Users WHERE CODE =@User)
	
	DECLARE @X nvarchar(MAX)
	
	BEGIN TRY
    BEGIN TRANSACTION
    --================================================
	 DELETE FROM  sys_FormAttachments WHERE FormID=@FormId AND TransactionId=@ID
	 DELETE FROM  sys_Regions WHERE ID=@ID
     --================================================
	    COMMIT
	END TRY
	BEGIN CATCH
		 ROLLBACK
		-- DECLARE @ErrorNumber INT,@ErrorMessage VARCHAR(1000)
		  set @Error =ERROR_MESSAGE() 
		-- RAISERROR (@Error ,16, 1)
	END CATCH				
	
	

END
