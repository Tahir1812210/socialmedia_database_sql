USE [TheOfficeAssignmentTasks]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCities]    Script Date: 6/5/2023 6:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddCities]
@CityCode int,
@CountryId int,
@CityEnglishName varchar(20),
@CityArabicName varchar(20)
as
insert into Cities (CityCode , CountryId , CityEnglishName , CityArabicName) values
(@CityCode , @countryId , @CityEnglishName , @CityArabicName)