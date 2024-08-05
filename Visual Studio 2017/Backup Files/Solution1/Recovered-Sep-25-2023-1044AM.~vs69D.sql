USE [Yama_VenusNet]
GO

/****** Object: StoredProcedure [dbo].[sys_ProjectGetList] Script Date: 9/19/2023 3:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sys_ProjectGetList]
(
  @FormId INT = NULL,
  @RoutePath NVARCHAR(1000) = '',
  @User VARCHAR(50) = 'sa',
  @Lang VARCHAR(20) = 'EN',
  @PageSize INT = 10,
  @PageNumber INT = 1,
  @OrderBy VARCHAR(20) = NULL,
  @OrderDirection VARCHAR(20) = NULL,
  @Criteria NVARCHAR(MAX) = NULL
)
AS
BEGIN
    DECLARE @ID INT = JSON_VALUE(@Criteria, '$.ID'),
            @Code VARCHAR(50) = JSON_VALUE(@Criteria, '$.Code'),
            @Customer_ID INT = JSON_VALUE(@Criteria, '$.Customer_ID'),
            @Country_ID INT = JSON_VALUE(@Criteria, '$.Country_ID'),
            @City_ID INT = JSON_VALUE(@Criteria, '$.City_ID'),
            @BusinessActivity_ID INT = JSON_VALUE(@Criteria, '$.BusinessActivity_ID'),
            @Owner_ID INT = JSON_VALUE(@Criteria, '$.Owner_ID'),
            @Status_ID INT = JSON_VALUE(@Criteria, '$.Status_ID'),
            @startdate SMALLDATETIME = JSON_VALUE(@Criteria, '$.StartDate'),
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
            @otherField NVARCHAR(20) = JSON_VALUE(@Criteria, '$.OtherField'),
            @Notes NVARCHAR(50) = JSON_VALUE(@Criteria, '$.Notes'),
			@CancelDate NVARCHAR(50) = JSON_VALUE(@Criteria, '$.CancelDate');

    IF ISNULL(@FormId, 0) = 0
    BEGIN
        SELECT TOP 1 @FormId = FormId FROM sys_MenusNew WHERE RoutePath = @RoutePath
    END

    EXEC sys_CheckPermession @FormId = @FormId, @User = @User, @Lang = @Lang

    DECLARE @x NVARCHAR(MAX), @recordCount INT

    SELECT @recordCount = count(*) FROM sys_Project P
	                WHERE (ISNULL(@Code, '') = '' OR P.Code LIKE '%' + @Code + '%')
                    AND (ISNULL(@customer_id, 0) = 0 OR P.customer_id = @customer_id)
                    AND (ISNULL(@country_id, 0) = 0 OR P.country_id = @country_id)
                    AND (ISNULL(@city_id, 0) = 0 OR P.city_id = @city_id)
                    AND (ISNULL(@businessactivity_id, 0) = 0 OR P.businessactivity_id = @businessactivity_id)
                    AND (ISNULL(@owner_id, 0) = 0 OR P.owner_id = @owner_id)
                    AND (ISNULL(@status_id, 0) = 0 OR P.status_id = @status_id)
                    AND (ISNULL(@startdate, '') = '' OR P.startdate = @startdate)
                    AND (ISNULL(@end_date, '') = '' OR P.EndDate = @end_date)
                    AND (ISNULL(@expectedprojectdurationdays, 0) = 0 OR P.expectedprojectdurationdays = @expectedprojectdurationdays)
                    AND (ISNULL(@types_id, 0) = 0 OR P.types_id = @types_id)
                    AND (ISNULL(@priority_id, 0) = 0 OR P.priority_id = @priority_id)
                    AND (ISNULL(@moules_id, 0) = 0 OR P.moules_id = @moules_id)
                    AND (ISNULL(@contractno, '') = '' OR P.contractno = @contractno)
                    AND (ISNULL(@contractvaluewithoutvat, 0) = 0 OR P.contractvaluewithoutvat = @contractvaluewithoutvat)
                    AND (ISNULL(@vatpercent, 0) = 0 OR P.vatpercent = @vatpercent)
                    AND (ISNULL(@vatvalue, 0) = 0 OR P.vatvalue = @vatvalue)
                    AND (ISNULL(@totalcontractvalue, 0) = 0 OR P.totalcontractvalue = @totalcontractvalue)
                    AND (ISNULL(@salesperson_id, 0) = 0 OR P.salesperson_id = @salesperson_id)
                    AND (ISNULL(@teamviewerdetails, '') = '' OR P.teamviewerdetails LIKE '%' + @teamviewerdetails + '%')
                    AND (ISNULL(@anydeskdetails, '') = '' OR P.anydeskdetails LIKE '%' + @anydeskdetails + '%')
                    AND (ISNULL(@sqldetails, '') = '' OR P.sqldetails LIKE '%' + @sqldetails + '%')
                    AND (ISNULL(@serverconnectiondetails, '') = '' OR P.serverconnectiondetails LIKE '%' + @serverconnectiondetails + '%')
                    AND (ISNULL(@erpapplicationurl, '') = '' OR P.erpapplicationurl LIKE '%' + @erpapplicationurl + '%')
                    AND (ISNULL(@hrapplicationurl, '') = '' OR P.hrapplicationurl LIKE '%' + @hrapplicationurl + '%')
                    AND (ISNULL(@hmsapplicationurl, '') = '' OR P.hmsapplicationurl LIKE '%' + @hmsapplicationurl + '%')
                    AND (ISNULL(@otherField, '') = '' OR P.OtherField LIKE '%' + @otherField + '%')
                    AND (ISNULL(@notes, '') = '' OR P.notes LIKE '%' + @notes + '%')

    IF @recordCount = 0
    BEGIN
        SET @x = (SELECT @PageNumber 'page', @recordCount 'total', (
                SELECT
                    NULL  ID,
                    NULL  Code,
                    NULL  customer_id,
                    NULL  country_id,
                    NULL  city_id,
                    NULL  businessactivity_id,
                    NULL  owner_id,
                    NULL  status_id,
                    NULL  startdate,
                    NULL  end_date,
                    NULL  expectedprojectdurationdays,
                    NULL  types_id,
                    NULL  priority_id,
                    NULL  moules_id,
                    NULL  contractno,
                    NULL  contractvaluewithoutvat,
                    NULL  vatpercent,
                    NULL  vatvalue,
                    NULL  totalcontractvalue,
                    NULL  salesperson_id,
                    NULL  teamviewerdetails,
                    NULL  anydeskdetails,
                    NULL  sqldetails,
                    NULL  serverconnectiondetails,
                    NULL  erpapplicationurl,
                    NULL  hrapplicationurl,
                    NULL  hmsapplicationurl,
                    NULL  otherfields,
                    NULL  notes,
					NULL  canceldate
                FOR JSON PATH, INCLUDE_NULL_VALUES
            ) AS 'list'
        FOR JSON PATH, INCLUDE_NULL_VALUES)
    END
   -- ELSE
   -- BEGIN
   --     SET @x = (
   --         SELECT @PageNumber 'page', @recordCount 'total'
			--,(select * from 
   --             (
   --                 SELECT
   --                    P.ID,
   --                     P.code
			--			from sys_Project P)
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN customer.ArbName
  --                          ELSE customer.EngName
  --                      END AS 'customer.textfield',
  --                      P.country_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN country.ArbName
  --                          ELSE country.EngName
  --                      END AS 'country.textfield',
  --                      P.city_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN city.ArbName
  --                          ELSE city.EngName
  --                      END AS 'city.textfield',
  --                      P.businessactivity_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN businessactivity.ArbName
  --                          ELSE businessactivity.EngName
  --                      END AS 'businessactivity.textfield',
  --                      P.owner_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN [owner].ArbName
  --                          ELSE [owner].EngName
  --                      END AS 'owner.textfield',
  --                      P.status_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN [status].ArbName
  --                          ELSE [status].EngName
  --                      END AS 'status.textfield',
  --                      P.startdate,
  --                      P.EndDate,
  --                      P.expectedprojectdurationdays,
  --                      P.types_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN [types].ArbName
  --                          ELSE [types].EngName
  --                      END AS 'types.textfield',
  --                      P.priority_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN [priority].ArbName
  --                          ELSE [priority].EngName
  --                      END AS 'priority.textfield',
  --                      P.moules_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN moules.ArbName
  --                          ELSE moules.EngName
  --                      END AS 'moules.textfield',
  --                      P.contractno,
  --                      P.contractvaluewithoutvat,
  --                      P.vatpercent,
  --                      P.vatvalue,
  --                      P.totalcontractvalue,
  --                      P.salesperson_id,
  --                      CASE
  --                          WHEN @Lang = 'ar' THEN salesperson.ArbName
  --                          ELSE salesperson.EngName
  --                      END AS 'salesperson.textfield',
  --                      P.teamviewerdetails,
  --                      P.anydeskdetails,
  --                      P.sqldetails,
  --                      P.serverconnectiondetails,
  --                      P.erpapplicationurl,
  --                      P.hrapplicationurl,
  --                      P.hmsapplicationurl,
  --                      P.OtherField,
  --                      P.notes,
		--				P.CancelDate
  --                  FROM dbo.sys_Project AS P
  --                  LEFT JOIN fcs_Customers customer ON P.Customer_ID = customer.ID
  --                  LEFT JOIN sys_Countries country ON P.Country_ID = country.ID
  --                  LEFT JOIN sys_Cities city ON P.City_ID = city.ID
  --                  LEFT JOIN Sys_BusinessActivitiesTypes businessactivity ON P.BusinessActivity_ID = businessactivity.ID
  --                  LEFT JOIN sys_owners [owner] ON P.Owner_ID = [owner].ID
  --                  LEFT JOIN sys_status [status] ON P.Status_ID = [status].ID
  --                  LEFT JOIN sys_types [types] ON P.Types_ID = [types].ID
  --                  LEFT JOIN sys_priority [priority] ON P.Priority_ID = [priority].ID
  --                  LEFT JOIN sys_moules moules ON P.Moules_ID = moules.ID
  --                  LEFT JOIN sys_salesperson salesperson ON P.SalesPerson_ID = salesperson.ID
  --                  WHERE P.canceldate IS NULL
  --                  AND (ISNULL(@Code, '') = '' OR P.Code LIKE '%' + @Code + '%')
  --                  AND (ISNULL(@customer_id, 0) = 0 OR P.customer_id = @customer_id)
  --                  AND (ISNULL(@country_id, 0) = 0 OR P.country_id = @country_id)
  --                  AND (ISNULL(@city_id, 0) = 0 OR P.city_id = @city_id)
  --                  AND (ISNULL(@businessactivity_id, 0) = 0 OR P.businessactivity_id = @businessactivity_id)
  --                  AND (ISNULL(@owner_id, 0) = 0 OR P.owner_id = @owner_id)
  --                  AND (ISNULL(@status_id, 0) = 0 OR P.status_id = @status_id)
  --                  AND (ISNULL(@startdate, '') = '' OR P.startdate = @startdate)
  --                  AND (ISNULL(@end_date, '') = '' OR P.EndDate = @end_date)
  --                  AND (ISNULL(@expectedprojectdurationdays, 0) = 0 OR P.expectedprojectdurationdays = @expectedprojectdurationdays)
  --                  AND (ISNULL(@types_id, 0) = 0 OR P.types_id = @types_id)
  --                  AND (ISNULL(@priority_id, 0) = 0 OR P.priority_id = @priority_id)
  --                  AND (ISNULL(@moules_id, 0) = 0 OR P.moules_id = @moules_id)
  --                  AND (ISNULL(@contractno, '') = '' OR P.contractno = @contractno)
  --                  AND (ISNULL(@contractvaluewithoutvat, 0) = 0 OR P.contractvaluewithoutvat = @contractvaluewithoutvat)
  --                  AND (ISNULL(@vatpercent, 0) = 0 OR P.vatpercent = @vatpercent)
  --                  AND (ISNULL(@vatvalue, 0) = 0 OR P.vatvalue = @vatvalue)
  --                  AND (ISNULL(@totalcontractvalue, 0) = 0 OR P.totalcontractvalue = @totalcontractvalue)
  --                  AND (ISNULL(@salesperson_id, 0) = 0 OR P.salesperson_id = @salesperson_id)
  --                  AND (ISNULL(@teamviewerdetails, '') = '' OR P.teamviewerdetails LIKE '%' + @teamviewerdetails + '%')
  --                  AND (ISNULL(@anydeskdetails, '') = '' OR P.anydeskdetails LIKE '%' + @anydeskdetails + '%')
  --                  AND (ISNULL(@sqldetails, '') = '' OR P.sqldetails LIKE '%' + @sqldetails + '%')
  --                  AND (ISNULL(@serverconnectiondetails, '') = '' OR P.serverconnectiondetails LIKE '%' + @serverconnectiondetails + '%')
  --                  AND (ISNULL(@erpapplicationurl, '') = '' OR P.erpapplicationurl LIKE '%' + @erpapplicationurl + '%')
  --                  AND (ISNULL(@hrapplicationurl, '') = '' OR P.hrapplicationurl LIKE '%' + @hrapplicationurl + '%')
  --                  AND (ISNULL(@hmsapplicationurl, '') = '' OR P.hmsapplicationurl LIKE '%' + @hmsapplicationurl + '%')
  --                  AND (ISNULL(@otherField, '') = '' OR P.OtherField LIKE '%' + @otherField + '%')
  --                  AND (ISNULL(@notes, '') = '' OR P.notes LIKE '%' + @notes + '%')
  --              ) DT
  --           ORDER BY
		--		 CASE WHEN ISNULL(@OrderBy,'')='' THEN ID END DESC,
		--		 CASE 
  --  WHEN @OrderBy = 'code' AND @OrderDirection = 'desc' THEN Code END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'code' AND @OrderDirection != 'desc' THEN Code END,
  --  CASE 
  --      WHEN @OrderBy = 'description' AND @OrderDirection = 'desc' THEN [description] END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'description' AND @OrderDirection != 'desc' THEN [description] END,
  --  CASE 
  --      WHEN @OrderBy = 'customer' AND @OrderDirection = 'desc' THEN customer END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'customer' AND @OrderDirection != 'desc' THEN [code] END,
  --  CASE 
  --      WHEN @OrderBy = 'ID' AND @OrderDirection = 'desc' THEN ID END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'ID' AND @OrderDirection != 'desc' THEN ID END,
  --  CASE 
  --      WHEN @OrderBy = 'customer_id' AND @OrderDirection = 'desc' THEN customer_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'customer_id' AND @OrderDirection != 'desc' THEN customer_id END,
  --  CASE 
  --      WHEN @OrderBy = 'country_id' AND @OrderDirection = 'desc' THEN country_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'country_id' AND @OrderDirection != 'desc' THEN country_id END,
  --  CASE 
  --      WHEN @OrderBy = 'city_id' AND @OrderDirection = 'desc' THEN city_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'city_id' AND @OrderDirection != 'desc' THEN city_id END,
  --  CASE 
  --      WHEN @OrderBy = 'businessactivity_id' AND @OrderDirection = 'desc' THEN businessactivity_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'businessactivity_id' AND @OrderDirection != 'desc' THEN businessactivity_id END,
  --  CASE 
  --      WHEN @OrderBy = 'owner_id' AND @OrderDirection = 'desc' THEN owner_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'owner_id' AND @OrderDirection != 'desc' THEN owner_id END,
  --  CASE 
  --      WHEN @OrderBy = 'status_id' AND @OrderDirection = 'desc' THEN status_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'status_id' AND @OrderDirection != 'desc' THEN status_id END,
  --  CASE 
  --      WHEN @OrderBy = 'startdate' AND @OrderDirection = 'desc' THEN startdate END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'startdate' AND @OrderDirection != 'desc' THEN startdate END,
  --  CASE 
  --      WHEN @OrderBy = 'end_date' AND @OrderDirection = 'desc' THEN end_date END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'end_date' AND @OrderDirection != 'desc' THEN end_date END,
  --  CASE 
  --      WHEN @OrderBy = 'expectedprojectdurationdays' AND @OrderDirection = 'desc' THEN expectedprojectdurationdays END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'expectedprojectdurationdays' AND @OrderDirection != 'desc' THEN expectedprojectdurationdays END,
  --  CASE 
  --      WHEN @OrderBy = 'types_id' AND @OrderDirection = 'desc' THEN types_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'types_id' AND @OrderDirection != 'desc' THEN types_id END,
  --  CASE 
  --      WHEN @OrderBy = 'priority_id' AND @OrderDirection = 'desc' THEN priority_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'priority_id' AND @OrderDirection != 'desc' THEN priority_id END,
  --  CASE 
  --      WHEN @OrderBy = 'moules_id' AND @OrderDirection = 'desc' THEN moules_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'moules_id' AND @OrderDirection != 'desc' THEN moules_id END,
  --  CASE 
  --      WHEN @OrderBy = 'contractno' AND @OrderDirection = 'desc' THEN contractno END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'contractno' AND @OrderDirection != 'desc' THEN contractno END,
  --  CASE 
  --      WHEN @OrderBy = 'contractvaluewithoutvat' AND @OrderDirection = 'desc' THEN contractvaluewithoutvat END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'contractvaluewithoutvat' AND @OrderDirection != 'desc' THEN contractvaluewithoutvat END,
  --  CASE 
  --      WHEN @OrderBy = 'vatpercent' AND @OrderDirection = 'desc' THEN vatpercent END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'vatpercent' AND @OrderDirection != 'desc' THEN vatpercent END,
  --  CASE 
  --      WHEN @OrderBy = 'vatvalue' AND @OrderDirection = 'desc' THEN vatvalue END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'vatvalue' AND @OrderDirection != 'desc' THEN vatvalue END,
  --  CASE 
  --      WHEN @OrderBy = 'totalcontractvalue' AND @OrderDirection = 'desc' THEN totalcontractvalue END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'totalcontractvalue' AND @OrderDirection != 'desc' THEN totalcontractvalue END,
  --  CASE 
  --      WHEN @OrderBy = 'salesperson_id' AND @OrderDirection = 'desc' THEN salesperson_id END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'salesperson_id' AND @OrderDirection != 'desc' THEN salesperson_id END,
  --  CASE 
  --      WHEN @OrderBy = 'teamviewerdetails' AND @OrderDirection = 'desc' THEN teamviewerdetails END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'teamviewerdetails' AND @OrderDirection != 'desc' THEN teamviewerdetails END,
  --  CASE 
  --      WHEN @OrderBy = 'anydeskdetails' AND @OrderDirection = 'desc' THEN anydeskdetails END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'anydeskdetails' AND @OrderDirection != 'desc' THEN anydeskdetails END,
  --  CASE 
  --      WHEN @OrderBy = 'sqldetails' AND @OrderDirection = 'desc' THEN sqldetails END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'sqldetails' AND @OrderDirection != 'desc' THEN sqldetails END,
  --  CASE 
  --      WHEN @OrderBy = 'serverconnectiondetails' AND @OrderDirection = 'desc' THEN serverconnectiondetails END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'serverconnectiondetails' AND @OrderDirection != 'desc' THEN serverconnectiondetails END,
  --  CASE 
  --      WHEN @OrderBy = 'erpapplicationurl' AND @OrderDirection = 'desc' THEN erpapplicationurl END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'erpapplicationurl' AND @OrderDirection != 'desc' THEN erpapplicationurl END,
  --  CASE 
  --      WHEN @OrderBy = 'hrapplicationurl' AND @OrderDirection = 'desc' THEN hrapplicationurl END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'hrapplicationurl' AND @OrderDirection != 'desc' THEN hrapplicationurl END,
  --  CASE 
  --      WHEN @OrderBy = 'hmsapplicationurl' AND @OrderDirection = 'desc' THEN hmsapplicationurl END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'hmsapplicationurl' AND @OrderDirection != 'desc' THEN hmsapplicationurl END,
  --  CASE 
  --      WHEN @OrderBy = 'otherfields' AND @OrderDirection = 'desc' THEN otherfields END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'otherfields' AND @OrderDirection != 'desc' THEN otherfields END,
  --  CASE 
  --      WHEN @OrderBy = 'notes' AND @OrderDirection = 'desc' THEN notes END DESC, 
  --  CASE 
  --      WHEN @OrderBy = 'notes' AND @OrderDirection != 'desc' THEN notes END,
    

		--OFFSET @PageSize * (@PageNumber - 1) ROWS

		--FETCH NEXT @PageSize ROWS ONLY

		--FOR JSON PATH , INCLUDE_NULL_VALUES ) AS 'list'
		
        
		--FOR JSON PATH , INCLUDE_NULL_VALUES

		--) 

		--END

		--select left (right (@x, len (@x)-1), len (@x)-2) 
		
select *from sys_




