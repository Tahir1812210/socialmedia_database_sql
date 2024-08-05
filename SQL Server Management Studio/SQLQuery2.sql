USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_displaycustomers]    Script Date: 6/18/2023 11:34:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_displaycustomers]
as
select a.Id , a.customercode , a.englishname , a.arabicname , a.mobilenumber , a.email , a.addressline1 ,
a.addressline2 , a.addressline3 , b.countryenglishname , b.countryarabicname , b.countrycode , a.CountryId , a.CityId ,
c.cityenglishname , c.cityarabicname , c.citycode from Customers a left join Countries b on a.CountryId = b.id
left join Cities c on a.CityId = c.id