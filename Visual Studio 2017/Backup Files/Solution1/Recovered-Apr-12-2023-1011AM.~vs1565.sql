/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Code]
      ,[EngName]
      ,[ArbName]
      ,[ArbName4S]
      ,[CountryID]
      ,[Company_ID]
      ,[Remarks]
      ,[RegUserID]
      ,[RegComputerID]
      ,[RegDate]
      ,[CancelDate]
      ,[ModifyUserID]
      ,[ModifyDate]
      ,[Note]
  FROM [Srabeel_Demo].[dbo].[sys_Regions]

  