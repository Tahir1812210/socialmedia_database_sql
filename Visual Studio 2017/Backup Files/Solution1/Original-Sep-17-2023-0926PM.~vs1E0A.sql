USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[sys_CountriesGetList]    Script Date: 9/13/2023 3:43:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sys_CountriesGetList]
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

DECLARE @OperationTypeID int
	   ,@Error nvarchar(500)
	DECLARE @Code nvarchar(50)=JSON_VALUE(@Criteria, '$.code') 
	, @EngName nvarchar(150)=JSON_VALUE(@Criteria, '$.engName')
	, @ArbName nvarchar(150)=JSON_VALUE(@Criteria, '$.arbName') 
	, @Remarks nvarchar(150)=JSON_VALUE(@Criteria, '$.remarks') 
	
	
  
	IF ISNULL(@FormId ,0)=0
	BEGIN
	SELECT top 1 @FormId=FormId from sys_MenusNew where RoutePath=@RoutePath
	END

	EXEC sys_CheckPermession @FormId=@FormId,@User=@User,@Lang=@Lang
	
declare @x varchar(max) ,@recordCount int

	   select @recordCount=count(*) FROM sys_Countries LC 
						WHERE  (ISNULL(@Code		,'')=''		OR LC.Code LIKE '%'+@Code+'%')	
							AND (ISNULL(@EngName		,'')='' OR LC.EngName LIKE '%'+@EngName+'%')
							AND (ISNULL(@ArbName		,'')='' OR LC.ArbName LIKE '%'+@ArbName+'%')
							AND (ISNULL(@Remarks		,'')='' OR LC.Remarks LIKE '%'+@Remarks+'%')
						
	IF @recordCount=0
			BEGIN
				set @x=(SELECT @PageNumber 'page' , @recordCount 'total' 
								,(SELECT  NULL ID 
								  ,NULL code
								  ,NULL arbName
								  ,NULL engName
								  ,NULL remarks
							FOR JSON PATH,include_null_values) AS 'list' 
					FOR JSON PATH,include_null_values)
			END
			ELSE
			BEGIN
				set @x=(
		SELECT  @PageNumber  'page'
	    , @recordCount 'total'
		,(select * from 
			(SELECT  LC.ID
				, LC.Code	AS code
			   , LC.ArbName AS arbName
			   , LC.EngName AS engName 
			   , LC.Remarks as remarks
		   FROM            sys_Countries LC
			WHERE LC.CancelDate IS NULL 
			 AND (ISNULL(@Code		,'')=''		OR LC.Code LIKE '%'+@Code+'%')	
			 AND (ISNULL(@EngName		,'')='' OR LC.EngName LIKE '%'+@EngName+'%')
			 AND (ISNULL(@ArbName		,'')='' OR LC.ArbName LIKE '%'+@ArbName+'%')
			 AND (ISNULL(@Remarks		,'')='' OR LC.Remarks LIKE '%'+@Remarks+'%')
							) DT
			ORDER BY 
		  CASE WHEN ISNULL(@OrderBy,'')='' THEN ID END DESC,
		  CASE WHEN @OrderBy = 'code'AND @OrderDirection = 'desc'  THEN code END DESC, CASE WHEN @OrderBy = 'code'AND @OrderDirection != 'desc' THEN code END,
		  CASE WHEN @OrderBy = 'arbName'AND @OrderDirection = 'desc'  THEN arbName END DESC, 	  CASE WHEN @OrderBy = 'arbName'AND @OrderDirection != 'desc' THEN arbName END,
		  CASE WHEN @OrderBy = 'engName'AND @OrderDirection = 'desc'  THEN engName END DESC, 	  CASE WHEN @OrderBy = 'engName'AND @OrderDirection != 'desc' THEN engName END
		 OFFSET @PageSize * (@PageNumber - 1) ROWS
		FETCH NEXT @PageSize ROWS ONLY 
	  FOR JSON PATH, INCLUDE_NULL_VALUES  ) AS 'list'
	  FOR JSON PATH,INCLUDE_NULL_VALUES
)
			END

select left (right (@x, len (@x)-1), len (@x)-2) 

END
