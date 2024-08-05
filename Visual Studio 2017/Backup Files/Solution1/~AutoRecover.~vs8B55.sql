/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [user_id]
      ,[username]
  FROM [SocialMedia].[dbo].[Users]


  INSERT INTO [dbo].[Users] ([username])
VALUES 
('user1'),
('user2'),
('user3'),
('user4'),
('user5'),
('user6'),
('user7'),
('user8');