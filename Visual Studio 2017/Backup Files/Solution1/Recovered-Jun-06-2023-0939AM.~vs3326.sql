USE [TheOfficeAssignmentTasks]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCityById]    Script Date: 6/5/2023 5:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetCityById]
@id int
as
select *from cities where id = @id

sp_GetCityById @id = 1