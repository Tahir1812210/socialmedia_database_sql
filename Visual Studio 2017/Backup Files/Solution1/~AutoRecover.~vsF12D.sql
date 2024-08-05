USE [TheInvoicePortalDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_getcity]    Script Date: 7/3/2023 9:57:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_getcity]
as
--SELECT City.Id, City.CityArabicName, City.CityCode , City.CityEnglishName, Country.CountryCode , City.CountryId FROM City INNER JOIN Country ON City.CountryId = Country.Id;

SELECT 
    City.Id,
    City.CityArabicName,
    City.CityCode,
    City.CityEnglishName,
    Country.CountryCode,
    City.CountryId
FROM 
    City
INNER JOIN 
    Country ON City.CountryId = Country.Id;


	sp_getitem