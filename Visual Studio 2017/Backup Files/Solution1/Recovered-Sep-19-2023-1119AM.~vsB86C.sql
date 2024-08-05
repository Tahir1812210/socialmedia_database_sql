USE [Yama_VenusNet]
GO

SET ANSI_NULLS ON
GO 
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sys_ProjectDelete]
(
@FormId int,
@User varchar(50),
@Lang varchar(50) = 'EN',
@ID int,
@Error NVARCHAR(MAX) out
)
AS
BEGIN
SET NOCOUNT ON;

EXEC sys_CheckPermession @FormId=@FormId , @User=@User ,@Lang=@Lang , @Mode= 'I'

Declare @UserId INT =(select top 1 ID FROM sys_Users where CODE =@User)

Declare @X nvarchar(MAX)

BEGIN TRY
BEGIN TRANSACTION

	DELETE FROM sys_FormAttachments WHERE FORMID = @FormId And TransactionId=@ID
	DELETE FROM sys_Regions WHERE ID = @ID

COMMIT

END TRY
BEGIN CATCH
ROLLBACK

set @Error =ERROR_MESSAGE()
END CATCH
END