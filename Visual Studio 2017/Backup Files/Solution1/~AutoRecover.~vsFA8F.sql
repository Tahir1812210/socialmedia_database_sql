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

  select *from LarkanaSindhRestaurantsInformation order by latitude , longitude asc

Alter PROCEDURE getrestaurants 
AS
BEGIN
  select *from LarkanaSindhRestaurantsInformation order by latitude , longitude asc
END;


