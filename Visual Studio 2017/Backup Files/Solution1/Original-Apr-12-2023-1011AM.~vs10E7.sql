USE [Srabeel_Demo]
GO
/****** Object:  StoredProcedure [dbo].[sys_RegionsSave]    Script Date: 4/11/2023 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sys_RegionsSave]
(
  @FormId int 
 ,@User			  varchar(50)
 ,@Lang			  varchar(20)= 'EN'
 ,@json NVARCHAR(MAX)
 ,@Result NVARCHAR(MAX) out
 ,@Error NVARCHAR(MAX) out
)
AS 
BEGIN
SET NOCOUNT ON; 
	
	DECLARE 
	  @ID	int   =JSON_VALUE(@json, '$.Head.ID') ,
  @Code	   nvarchar(50)=JSON_VALUE(@json, '$.Head.code') ,
  @EngName nvarchar(150)=JSON_VALUE(@json, '$.Head.engName') ,
  @ArbName nvarchar(150)=JSON_VALUE(@json, '$.Head.arbName') ,
  @CountryID INT=JSON_VALUE(@json, '$.Head.country.valueField') ,
  @Remarks nvarchar(150)=JSON_VALUE(@json, '$.Head.remarks') ,
  @Note nvarchar(150)=JSON_VALUE(@json, '$.Head.Note'), --tahir
   @UserId INT =(select top 1 ID FROM sys_Users WHERE CODE =@User)

  
 
IF ISNULL(@ID,0)=0
BEGIN
	 
	 EXEC sys_CheckPermession @FormId=@FormId , @User=@User ,@Lang=@Lang , @Mode= 'I'

	DECLARE @X nvarchar(MAX)

	BEGIN TRY
    BEGIN TRANSACTION
    --================================================
	 INSERT INTO sys_RegionS
                         ( Code, EngName, ArbName, CountryID,  Remarks, RegUserID, RegDate , Note) 
		VALUES       (@Code, @EngName, @ArbName,  @CountryID,  @Remarks, @UserId, GETDATE(), @Note)
			
			SET @ID= SCOPE_IDENTITY();
		
	 --return inserted recored
		EXEC sys_RegionDetails  @User=@User,@FormId=@FormId,@ID=@ID,@Lang=@Lang,@Result=@X OUT
		set @Result = @X 
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
ELSE 
BEGIN
	 EXEC sys_CheckPermession @FormId=@FormId , @User=@User ,@Lang=@Lang , @Mode= 'U'
	 
	BEGIN TRY
    BEGIN TRANSACTION
    --================================================
	 UPDATE sys_RegionS
           SET EngName=@EngName
		   , ArbName=@ArbName
		   , CountryID=@CountryID
		   , Remarks=@Remarks
		   , ModifyUserID=@UserId
		   , ModifyDate=GETDATE()
		   , Note=@Note
		   WHERE ID=@ID

	 --return inserted recored
		EXEC sys_RegionDetails  @User=@User,@FormId=@FormId,@ID=@ID,@Lang=@Lang,@Result=@X OUT
		set @Result = @X 
     --================================================
	    COMMIT
	END TRY
	BEGIN CATCH
		 ROLLBACK
		 --DECLARE @ErrorNumber INT,@ErrorMessage VARCHAR(1000)
		  set @Error =ERROR_MESSAGE() 
		-- RAISERROR (@Error ,16, 1)
	END CATCH				

END 


		

END
