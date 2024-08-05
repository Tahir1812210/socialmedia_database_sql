/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [like_id]
      ,[user_id]
      ,[photo_id]
      ,[created_at]
  FROM [SocialMedia].[dbo].[Likes]


  INSERT INTO [dbo].[Likes] ([user_id], [photo_id], [created_at])
VALUES 
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), GETDATE());