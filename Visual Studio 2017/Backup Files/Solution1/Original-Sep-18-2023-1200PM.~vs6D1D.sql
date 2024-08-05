USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[sys_RegionsGetList]    Script Date: 9/17/2023 9:31:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sys_RegionsGetList]
 (@FormId int		= null
 ,@RoutePath		  nvarchar(1000) =''
 ,@User			  varchar(50)= 'sa'
 ,@Lang			  varchar(20)= 'EN'
 ,@PageSize			INT =10
 ,@PageNumber		INT =1
 ,@OrderBy		  varchar(20)= null
 ,@OrderDirection  varchar(20)= null
 ,@Criteria  nvarchar(max)= null
 )
 AS
 BEGIN

DECLARE @Code		nvarchar(50)			=JSON_VALUE(@Criteria, '$.code') ,
		@EngName			nvarchar(150)	=JSON_VALUE(@Criteria, '$.engName') ,
		@ArbName			nvarchar(150)	=JSON_VALUE(@Criteria, '$.arbName') ,
		@CountryID int			    =JSON_VALUE(@Criteria, '$.country.valueField') ,
		@CustomerID int             =JSON_VALUE(@Criteria, '$.customer.valueField'),
		@CityID int              =JSON_VALUE(@Criteria, '$.city.valueField'),
		@BusinessActivityID int   =JSON_VALUE(@Criteria, '$.businessactivity.valuefield'),
		@OwnerID int   =JSON_VALUE(@Criteria, '$.owner.valuefield'),
		@StatusID int  =JSON_VALUE(@Criteria, '$.status.valuefield'),
	    @TypeID int  =JSON_VALUE(@Criteria, '$.type.valuefield'),
		@PriorityID int =JSON_VALUE(@Criteria, '$priority.valuefield'),
		@MoulesID int  =JSON_VALUE(@Criteria, '$moules.valuefield'),
		@SalesPersonID int =JSON_VALUE(@Criteria, '$salesperson.valuefield'),
		@Remarks			nvarchar(150)  	=JSON_VALUE(@Criteria, '$.remarks.valuefield') 
  
	IF ISNULL(@FormId ,0)=0
	BEGIN
	SELECT top 1 @FormId=FormId from sys_MenusNew where RoutePath=@RoutePath
	END

	EXEC sys_CheckPermession @FormId=@FormId,@User=@User,@Lang=@Lang
	
declare @x varchar(max) ,@recordCount int

	   select @recordCount=count(*) FROM sys_Regions R 
						WHERE  (ISNULL(@Code		,'')=''		OR R.Code LIKE '%'+@Code+'%')	
							AND (ISNULL(@EngName		,'')='' OR R.EngName LIKE '%'+@EngName+'%')
							AND (ISNULL(@ArbName		,'')='' OR R.ArbName LIKE '%'+@ArbName+'%')
							AND (ISNULL(@CountryID		,'')='' OR R.CountryID =@CountryID)
							
							AND (ISNULL(@Remarks		,'')='' OR R.Remarks LIKE '%'+@Remarks+'%')
	IF @recordCount=0
			BEGIN
				set @x=(SELECT @PageNumber 'page' , @recordCount 'total'
						,(SELECT  NULL ID 
								  ,null	code
								  ,NULL arbName
								  ,NULL engName
								  ,NULL country
								  ,NULL remarks
								  ,NULL allowAccountEntry
							FOR JSON PATH,include_null_values) AS 'list' 
					FOR JSON PATH,include_null_values)
			END
			ELSE
			BEGIN
				set @x=(
		SELECT  @PageNumber  'page'
	    , @recordCount 'total'
		,(select * from 
			(SELECT R.ID, R.code
			, R.ArbName	as arbName
			, R.EngName    AS engName
			,CASE WHEN @Lang = 'ar' THEN country.ArbName ELSE country.EngName END   AS country
			, R.remarks
		FROM   dbo.sys_Regions AS R  
		LEFT JOIN sys_Countries Country ON R.CountryID =Country.ID
		WHERE R.CancelDate IS NULL
			 AND (ISNULL(@Code		,'')=''		OR R.Code LIKE '%'+@Code+'%')	
			 AND (ISNULL(@EngName		,'')='' OR R.EngName LIKE '%'+@EngName+'%')
			 AND (ISNULL(@ArbName		,'')='' OR R.ArbName LIKE '%'+@ArbName+'%')
			 AND (ISNULL(@CountryID		,'')='' OR R.CountryID =@CountryID)
			 AND (ISNULL(@Remarks		,'')='' OR R.Remarks LIKE '%'+@Remarks+'%')
							) DT
			ORDER BY 
		  CASE WHEN ISNULL(@OrderBy,'')='' THEN ID END DESC,
		  CASE WHEN @OrderBy = 'code'AND @OrderDirection = 'desc'  THEN code END DESC, CASE WHEN @OrderBy = 'code'AND @OrderDirection != 'desc' THEN code END,
		  CASE WHEN @OrderBy = 'arbName'AND @OrderDirection = 'desc'  THEN arbName END DESC, 		  CASE WHEN @OrderBy = 'arbName'AND @OrderDirection != 'desc' THEN arbName END,
		  CASE WHEN @OrderBy = 'engName'AND @OrderDirection = 'desc'  THEN engName END DESC, 		  CASE WHEN @OrderBy = 'engName'AND @OrderDirection != 'desc' THEN engName END,
		  CASE WHEN @OrderBy = 'country'AND @OrderDirection = 'desc'  THEN country END DESC, 		  CASE WHEN @OrderBy = 'country'AND @OrderDirection != 'desc' THEN country END,
		  CASE WHEN @OrderBy = 'remarks'AND @OrderDirection = 'remarks'  THEN remarks END DESC,  CASE WHEN @OrderBy =  'remarks'AND @OrderDirection != 'desc' THEN remarks END
		 OFFSET @PageSize * (@PageNumber - 1) ROWS
		FETCH NEXT @PageSize ROWS ONLY 
	  FOR JSON PATH, INCLUDE_NULL_VALUES  ) AS 'list'
	  FOR JSON PATH,INCLUDE_NULL_VALUES
)
			END

select left (right (@x, len (@x)-1), len (@x)-2) 

END
