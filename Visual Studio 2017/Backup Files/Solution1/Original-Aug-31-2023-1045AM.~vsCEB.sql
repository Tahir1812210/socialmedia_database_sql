/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CustomerId]
      ,[CustomerName]
      ,[CustomerAmount]
  FROM [CodeFirstDB].[dbo].[Customerss]