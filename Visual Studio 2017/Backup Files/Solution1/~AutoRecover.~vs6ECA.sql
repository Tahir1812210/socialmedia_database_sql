/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [photo_id]
      ,[user_id]
      ,[image]
      ,[caption]
      ,[created_at]
      ,[updated_at]
  FROM [SocialMedia].[dbo].[Photos]

  INSERT INTO [dbo].[Photos] ([user_id], [image], [caption], [created_at], [updated_at])
VALUES 
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 1', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 2', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 3', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 4', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 5', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 6', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 7', GETDATE(), GETDATE()),
((SELECT TOP 1 [user_id] FROM [dbo].[Users] ORDER BY NEWID()), CAST('' AS VARBINARY(MAX)), 'Sample caption 8', GETDATE(), GETDATE());