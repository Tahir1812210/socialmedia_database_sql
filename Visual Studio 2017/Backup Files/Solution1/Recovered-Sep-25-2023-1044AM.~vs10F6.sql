USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[Sys_repRegions]    Script Date: 9/20/2023 5:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sys_repProjects]
	@Code		Varchar(50)  = '', 
	@FromCode	Varchar(50)  = '',
	@ToCode		Varchar(50)  = '' 
As 

Select 
	Code,
	EngName,
	ArbName
From 
	Sys_Regions
Where 
	Code	Like	@Code + '%'
	And		Code	Between		@FromCode	And		@ToCode  + 'zzz'
	And		CancelDate			Is Null
Order By 
	Code