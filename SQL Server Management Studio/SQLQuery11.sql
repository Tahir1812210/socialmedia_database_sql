USE [WorkTask]
GO
/****** Object:  StoredProcedure [dbo].[sp_displaycities]    Script Date: 5/31/2023 2:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---display cities
ALTER procedure [dbo].[sp_displaycities]
as 
Select 
*from cities