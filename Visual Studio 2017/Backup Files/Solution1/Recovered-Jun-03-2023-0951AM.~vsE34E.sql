USE [WorkTask]
GO
/****** Object:  StoredProcedure [dbo].[sp_displaycountries]    Script Date: 5/31/2023 2:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_displaycountries]
as
select  *from countries