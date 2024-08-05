/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [repost_id]
      ,[user_id]
      ,[photo_id]
      ,[content]
      ,[created_at]
  FROM [SocialMedia].[dbo].[Reposts]


  INSERT INTO [dbo].[Reposts] ([user_id], [photo_id], [content], [created_at])
VALUES 
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 1', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 2', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 3', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 4', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 5', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 6', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 7', GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), (SELECT TOP 1 [photo_id] FROM [dbo].[Photos] ORDER BY NEWID()), 'Sample content 8', GETDATE());