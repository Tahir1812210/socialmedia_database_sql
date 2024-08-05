USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[sys_RegionsGetList]    Script Date: 9/19/2023 3:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sys_ProjectGetList]
(
  @FormId int       = null,
  @RoutePath        nvarchar(1000) ='',
  @User			  varchar(50)= 'sa'
 ,@Lang			  varchar(20)= 'EN'
 ,@PageSize			INT =10
 ,@PageNumber		INT =1
 ,@OrderBy		  varchar(20)= null
 ,@OrderDirection  varchar(20)= null
 ,@Criteria  nvarchar(max)= null
)
AS
BEGIN

    DECLARE @ID INT = JSON_VALUE(@Criteria,, '$.ID'),
            @Code VARCHAR(50) = JSON_VALUE(@Criteria,, '$.Code'),
            @Customer_ID INT = JSON_VALUE(@Criteria, '$.Customer_ID'),
            @Country_ID INT = JSON_VALUE(@Criteria, '$.Country_ID'),
            @City_ID INT = JSON_VALUE(@Criteria, '$.City_ID'),
            @BusinessActivity_ID INT = JSON_VALUE(@Criteria, '$.BusinessActivity_ID'),
            @Owner_ID INT = JSON_VALUE(@Criteria, '$.Owner_ID'),
            @Status_ID INT = JSON_VALUE(@Criteria, '$.Status_ID'),
            @Start_Date SMALLDATETIME = JSON_VALUE(@Criteria, '$.Start_Date'),
            @End_Date SMALLDATETIME = JSON_VALUE(@Criteria, '$.End_Date'),
            @ExpectedProjectDurationDays INT = JSON_VALUE(@Criteria, '$.ExpectedProjectDurationDays'),
            @Types_ID INT = JSON_VALUE(@Criteria, '$.Type_ID'),
            @Priority_ID INT = JSON_VALUE(@Criteria, '$.Priority_ID'),
            @MOULES_ID INT = JSON_VALUE(@Criteria, '$.Moules_ID'),
            @ContractNO INT = JSON_VALUE(@Criteria, '$.ContractNO'),
            @ContractValueWithoutVAT INT = JSON_VALUE(@Criteria, '$.ContractValueWithoutVAT'),
            @VATPercent INT = JSON_VALUE(@Criteria, '$.VATPercent'),
            @VATValue INT = JSON_VALUE(@Criteria, '$.VATValue'),
            @TotalContractValue INT = JSON_VALUE(@Criteria, '$.TotalContractValue'),
            @SalesPerson_ID INT = JSON_VALUE(@Criteria, '$.SalesPerson'),
            @TeamViewerDetails INT = JSON_VALUE(@Criteria, '$.TeamViewerDetails'),
            @AnyDeskDetails INT = JSON_VALUE(@Criteria, '$.AnyDeskDetails'),
            @SQLDetails NVARCHAR(MAX) = JSON_VALUE(@Criteria, '$.SQLDetails'),
            @ServerConnectionDetails NVARCHAR(MAX) = JSON_VALUE(@Criteria, '$.ServerConnectionDetails'),
            @ERPApplicationURL NVARCHAR(MAX) = JSON_VALUE(@Criteria, '$.ERPApplicationURL'),
            @HRApplicationURL NVARCHAR(MAX) = JSON_VALUE(@Criteria, '$.HRApplicationURL'),
            @HMSApplicationURL NVARCHAR(MAX) = JSON_VALUE(@Criteria, '$.HMSApplicationURL'),
            @OtherField NVARCHAR(20) = JSON_VALUE(@Criteria, '$.OtherField'),
            @Notes NVARCHAR(50) = JSON_VALUE(@Criteria, '$.Notes');

			IF ISNULL(@FormId ,0)=0
	BEGIN
	SELECT top 1 @FormId=FormId from sys_MenusNew where RoutePath=@RoutePath
	END

	EXEC sys_CheckPermession @FormId=@FormId,@User=@User,@Lang=@Lang

	declare @x varchar(max) ,@recordCount int

	select @recordCount=0
		BEGIN
			set @x=(Select @PageNumber 'page' , @recordCount 'total'
				,(Select NULL ID,
				, null code
				, null customer_id 
				, null country_id
				, null city_id
				, null businessactivity_id
				, null owner_id
				, null status_id
				, null startdate
				, null end_date
				, null expectedprojectdurationdays
				, null types_id
				, null priority_id
				, null moules_id
				, null contractno
				, null contractvaluewithoutvat
				, null vatpercent
				, null vatvalue
				, null totalcontractvalue
				, null salesperson_id
				, null teamviewerdetails
				, null anydeskdetails
				, null sqldetails
				, null serverconnectiondetails
				, null erpapplicationurl
				, null hrapplicationurl
				, null hmsapplicationurl
				, null otherfields
				, null notes
				FOR JSON PATH,include_null_values) AS 'list' 
					FOR JSON PATH,include_null_values)
			END
			ELSE
			BEGIN
			set @x = (
			SELECT @PageNumber 'page'
			, @recordCount 'total'
			, (select *from 
			(SELECT P.ID,
				, P.code
				, P.customer_id ,
								CASE WHEN @Lang = 'ar' THEN customer.ArbName ELSE customer.EngName END AS 'customer.textfield',
				, P.country_id
				                CASE WHEN @Lang = 'ar' THEN country.ArbName ELSE country.EngName END AS 'country.textfield',

				, P.city_id
				CASE WHEN @Lang = 'ar' THEN city.ArbName ELSE city.EngName END AS 'city.textfield',
				, P.businessactivity_id
				                CASE WHEN @Lang = 'ar' THEN businessactivity.ArbName ELSE businessactivity.EngName END AS 'businessactivity.textfield',

				, P.owner_id
				                CASE WHEN @Lang = 'ar' THEN [owner].ArbName ELSE [owner].EngName END AS 'owner.textfield',

				, P.status_id
				                CASE WHEN @Lang = 'ar' THEN [status].ArbName ELSE [status].EngName END AS 'status.textfield',
				, P.startdate
				, P.end_date
				, P.expectedprojectdurationdays
				, P.types_id
								CASE WHEN @Lang = 'ar' THEN [types].ArbName ELSE [types].EngName END AS 'types.textfield',
				, P.priority_id
				                CASE WHEN @Lang = 'ar' THEN [priority].ArbName ELSE [priority].EngName END AS 'priority.textfield',

				, P.moules_id
				                CASE WHEN @Lang = 'ar' THEN moules.ArbName ELSE moules.EngName END AS 'moules.textfield',
				, P.contractno
				, P.contractvaluewithoutvat
				, P.vatpercent
				, P.vatvalue
				, P.totalcontractvalue
				, P.salesperson_id
				                CASE WHEN @Lang = 'ar' THEN salesperson.ArbName ELSE salesperson.EngName END AS 'salesperson.textfield',

				, P.teamviewerdetails
				, P.anydeskdetails
				, P.sqldetails
				, P.serverconnectiondetails
				, P.erpapplicationurl
				, P.hrapplicationurl
				, P.hmsapplicationurl
				, P.otherfields
				, P.notes
				From dbo.sys_Project AS P
			LEFT JOIN fcs_Customers customer ON P.Customer_ID = customer.ID
            LEFT JOIN sys_Countries country ON P.Country_ID = country.ID
            LEFT JOIN sys_Cities city ON P.City_ID = city.ID
            LEFT JOIN Sys_BusinessActivitiesTypes businessactivity ON P.BusinessActivity_ID = businessactivity.ID
            LEFT JOIN sys_owners [owner] ON P.Owner_ID = [owner].ID
            LEFT JOIN sys_status [status] ON P.Status_ID = [status].ID
            LEFT JOIN sys_types [types] ON P.Types_ID = [types].ID
            LEFT JOIN sys_priority [priority] ON P.Priority_ID = [priority].ID
            LEFT JOIN sys_moules moules ON P.Moules_ID = moules.ID
            LEFT JOIN sys_salesperson salesperson ON P.SalesPerson_ID = salesperson.ID
			WHERE P.CancelDate IS NULL

			AND (ISNULL(@Code , '')='' OR P.Code LIKE '%' + @Code + '%')