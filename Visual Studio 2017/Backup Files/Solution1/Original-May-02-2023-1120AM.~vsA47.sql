/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Email]
      ,[Gender]
      ,[DateOfJoining]
  FROM [StaffDb].[dbo].[Staffs]