create PROCEDURE [dbo].[Asset_Maintanence_GetByID]
	(
	  @FormId int 
	 ,@User			  varchar(50)
	 ,@Lang			  varchar(2)
	 ,@ID			  int
	 ,@Result		nvarchar(MAX)out
	)
	AS
 BEGIN


EXEC sys_CheckPermession @FormId=@FormId,@User=@User,@Lang=@Lang

declare @x varchar(max)
set @x=(
  SELECT C.ID				'ID'
		,C.Code				'code'
		,C.Maintenance_Title 			'maintenanceTitle' 
		,C.AssetItemId					'assetId'
		,CASE WHEN @Lang = 'ar' THEN D.ArbName ELSE D.EngName END 'asset' 
		,C.Maintenance_Details			'maintenanceDetail' 
		,C.Maintenance_Type				'maintenanceType' 
		,C.Maintence_By					'maintenceBy'
		,C.Maintenace_Status_ID			'status'
		,C.Maintenance_Due_Date			'dueDate'
		,C.Maintenance_Start_Date		'startDate'
		,C.Complete_Date				'completeDate'
		,C.Cost_of_Repair				'costOfRepair'
		,C.Notes						'notes' 
		,C.Premetive_Maintenance		'premetiveMaintenance'
	

		FROM Asset_Maintenance	C
		left join Ass_Items D on D.ID=C.AssetItemId
		WHERE C.ID =@ID
		FOR JSON PATH,INCLUDE_NULL_VALUES
		)
    
select @Result=left (right (@x, len (@x)-1), len (@x)-2) 

END