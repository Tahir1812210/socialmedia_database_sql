USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_getcustomerbyid]    Script Date: 6/18/2023 3:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter procedure [dbo].[sp_getcustomersbyid]
@Id int
as
select *from customers where id  = @Id

sp_getcustomersbyid @Id = 2


