USE [TheOfficeAssignmentTasks]
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayCities]    Script Date: 6/5/2023 5:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DisplayCities]
as
select c.Id , c.CityCode , c.CityEnglishName , d.CountryCode , c.CityArabicName from cities
c join Countries d on c.id = d.id