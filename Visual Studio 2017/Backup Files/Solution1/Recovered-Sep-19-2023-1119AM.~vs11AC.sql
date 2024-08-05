/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Code]
      ,[Prefix]
      ,[EngName]
      ,[ArbName]
      ,[ArbName4S]
      ,[FormID]
      ,[IsRegistered]
      ,[FiscalYearDependant]
      ,[Rank]
      ,[Remarks]
      ,[ISAR]
      ,[ISAP]
      ,[IsGL]
      ,[ISFA]
      ,[IsINV]
      ,[IsHR]
      ,[ISMANF]
      ,[IsSYS]
      ,[RegUserID]
      ,[RegComputerID]
      ,[RegDate]
      ,[CancelDate]
      ,[ModifyUserID]
      ,[ModifyDate]
  FROM [Yama_VenusNet].[dbo].[sys_Modules]

  select *from sys_Modules where ID=37


  select *from sys_MenusNew where EngName like '%egio%'

    select *from sys_MenusNew where EngName like '%count%'

	select *from sys_FormAttachments

