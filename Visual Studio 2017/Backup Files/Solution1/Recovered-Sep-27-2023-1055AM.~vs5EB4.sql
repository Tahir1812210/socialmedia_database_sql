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
	[dbo].[fn_GetName](EngName,ArbName,@Lang)As Regions

From 
	Sys_Regions

Where
	CancelDate Is Null 
And Code Like @Code + '%'
And Code Between @FromCode and @ToCode  + 'zzz'

Order By 
	Code

