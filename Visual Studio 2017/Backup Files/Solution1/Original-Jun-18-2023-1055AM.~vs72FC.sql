USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_displaycountries]    Script Date: 6/17/2023 12:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_displaycountries] 
as
select countryenglishname , countryarabicname , countrycode from countries