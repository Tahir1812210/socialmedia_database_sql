/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Email]
      ,[Gender]
      ,[DateOfJoining]
  FROM [StaffDb].[dbo].[Staffs]

  insert into [StaffDb].[dbo].[Staffs] values 
  ('9ca79bdf-8a8b-4e42-932f-f30cfef5df23','Tahir', 'tahir@dataocean.com' , 'male' , '2023-05-01' )