/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[name]
      ,[address]
      ,[website]
      ,[phone_number]
      ,[latitude]
      ,[longitude]
      ,[city]
      ,[state]
      ,[url]
  FROM [RestaurantInformation].[dbo].[LarkanaSindhRestaurantsInformation]

