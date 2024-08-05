/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Code]
      ,[EngName]
      ,[ArbName]
      ,[ArbName4S]
      ,[EngDescription]
      ,[ArbDescription]
      ,[Rank]
      ,[ModuleID]
      ,[SearchFormID]
      ,[Height]
      ,[Width]
      ,[Remarks]
      ,[RegUserID]
      ,[RegComputerID]
      ,[RegDate]
      ,[CancelDate]
      ,[Layout]
      ,[LinkTarget]
      ,[LinkUrl]
      ,[ImageUrl]
      ,[MainID]
      ,[ShowOnMobile]
      ,[Icon]
      ,[NextCodeQuery]
      ,[ModifyUserID]
      ,[ModifyDate]
  FROM [Yama_VenusNet].[dbo].[sys_Forms]


  select *from sys_Forms where EngName like '%egio%'

  select *from sys_Forms where EngName like '%ountr%'