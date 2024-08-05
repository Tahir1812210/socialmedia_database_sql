USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[updatecustomers]    Script Date: 6/18/2023 2:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_updatecustomers]
@id int,
@customercode varchar(max),
@englishname varchar(max),
@arabicname varchar(max),
@mobilenumber varchar(max),
@email varchar(max),
@addressline1 varchar(max),
@addressline2 varchar(max),
@addressline3 varchar(max),
@countryid int,
@cityid int
as 
update customers set customercode = @customercode , englishname = @englishname , arabicname = @arabicname ,
mobilenumber = @mobilenumber , email = @email , addressline1 = @addressline1 , addressline2 = @addressline2 ,
addressline3 = @addressline3 , countryid = @countryid , cityid = @cityid where id = @id