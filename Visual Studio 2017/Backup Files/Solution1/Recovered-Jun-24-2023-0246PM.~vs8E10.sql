USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_getcustomerbyid]    Script Date: 6/18/2023 3:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_getcustomerbyid]
@Id int
as
select *from customers where id  = @id



