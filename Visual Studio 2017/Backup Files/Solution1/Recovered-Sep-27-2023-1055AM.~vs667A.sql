Create Procedure [dbo].[Sys_repProject]
@Code		Varchar(50)  = '', 
@FromCode	Varchar(50)  = '',
@ToCode		Varchar(50)  = '' 
As 
select code, description
From sys_project
Where 
	Code	Like	@Code + '%'
	And		Code	Between		@FromCode	And		@ToCode  + 'zzz'
	And		CancelDate			Is Null
Order By 
	Code




	select *from sys_project