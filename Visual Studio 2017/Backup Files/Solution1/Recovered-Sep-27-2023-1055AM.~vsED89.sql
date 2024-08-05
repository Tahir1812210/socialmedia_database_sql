USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[Sys_rptRegions]    Script Date: 9/26/2023 12:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[Sys_rptRegions]
	@Code		Varchar(50)  = '', 
	@FromCode	Varchar(50)  = '',
	@ToCode		Varchar(50)  = '',
	@Lang		Bit			 = '' 
As 
Set DateFormat dmy

Select 
	Code,
	[dbo].[fn_GetName](Code,[Description],@Lang)As Projects

From 
	Sys_project

Where
	CancelDate Is Null 
And Code Like @Code + '%'
And Code Between @FromCode and @ToCode  + 'zzz'

Order By 
	Code


	select *from sys_countries
	select *from sys_cities

	select *from fcs_Customers

	select *from sys_project