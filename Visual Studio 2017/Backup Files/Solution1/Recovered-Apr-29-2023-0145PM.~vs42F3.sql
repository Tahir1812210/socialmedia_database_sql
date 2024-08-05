USE [Srabeel_Demo]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sys_AddressDelete]
(
	@FormId int,
	@User varchar(50),
	@Lang varchar(20) = 'EN',
	@ID int,
	@Error NVARCHAR(max) out
)
AS
BEGIN
	Exec sys_CheckPermession @FormId = @FormId , @User=@User , @Lang=@Lang , @Mode='I'

	DECLARE @UserId INT = (select TOP 1 ID from sys_Users where CODE = @User)

	DECLARE @X nvarchar(max)

	BEGIN TRY
		BEGIN TRANSACTION

		DELETE FROM sys_FormAttachments WHERE FORMID = @FORMID AND TransactionID=@ID

		DELETE FROM sys_Regions WHERE ID=@ID

		COMMIT

	END TRY

	BEGIN CATCH

	ROLLBACK

	set @error = ERROR_MESSAGE()

	END CATCH




END