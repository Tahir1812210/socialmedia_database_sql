USE [TheOfficeAssignmentTasks]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCountry]    Script Date: 6/5/2023 4:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteCountry]
@Id int
as
delete Countries where Id = @Id