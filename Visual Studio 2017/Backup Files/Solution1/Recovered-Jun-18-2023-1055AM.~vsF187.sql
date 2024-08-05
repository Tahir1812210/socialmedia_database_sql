USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_updatecity]    Script Date: 6/17/2023 10:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_updatecity]
@Id int,
@CityEnglishName varchar(max),
@CityArabicName varchar(max),
@CityCode varchar(max),
@CountryId int
as
update Cities set cityenglishname = @cityenglishname , cityarabicname = @cityarabicname 
, citycode = @citycode , countryId = @CountryId where id = @id