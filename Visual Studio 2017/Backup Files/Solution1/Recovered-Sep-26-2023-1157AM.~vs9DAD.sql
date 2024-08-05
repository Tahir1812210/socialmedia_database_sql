/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Code]
      ,[Customer_ID]
      ,[Country_ID]
      ,[City_ID]
      ,[BusinessActivity_ID]
      ,[Owner_ID]
      ,[Status_ID]
      ,[StartDate]
      ,[EndDate]
      ,[ExpectedProjectDurationDays]
      ,[Types_ID]
      ,[Priority_ID]
      ,[Moules_ID]
      ,[ContractNO]
      ,[ContractValueWithoutVAT]
      ,[VATPercent]
      ,[VATValue]
      ,[TotalContractValue]
      ,[SalesPerson_ID]
      ,[TeamViewerDetails]
      ,[AnyDeskDetails]
      ,[SQLDetails]
      ,[ServerConnectionDetails]
      ,[ERPApplicationURL]
      ,[HRApplicationURL]
      ,[HMSApplicationURL]
      ,[OtherField]
      ,[Notes]
      ,[CancelDate]
  FROM [Yama_VenusNet].[dbo].[sys_project]


  select *from sys_MenusNew where EngName like 'Project'

  select *from sys_Forms where EngName like '%frmreg%'
  select *from sys_Forms where EngName like '%frmpro%'