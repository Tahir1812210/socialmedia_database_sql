/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [comment_id]
      ,[user_id]
      ,[photo_id]
      ,[content]
      ,[created_at]
  FROM [SocialMedia].[dbo].[Comments]



  INSERT INTO [dbo].[Comments] ([user_id], [photo_id], [content], [created_at])
VALUES 
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'This is a great photo!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Amazing shot!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'I love this!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'So beautiful!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'What a capture!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Fantastic view!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'This made my day!', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Incredible details!', GETDATE());