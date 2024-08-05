/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [comment_id]
      ,[user_id]
      ,[photo_id]
      ,[content]
      ,[created_at]
  FROM [SocialMedia].[dbo].[Comments]


  INSERT INTO Users (username, email, profile_picture)
VALUES
    ('user1', 'user1@example.com', 'https://example.com/user1.jpg'),
    ('user2', 'user2@example.com', 'https://example.com/user2.jpg'),
    ('user3', 'user3@example.com', 'https://example.com/user3.jpg'),
    ('user4', 'user4@example.com', 'https://example.com/user4.jpg'),
    ('user5', 'user5@example.com', 'https://example.com/user5.jpg'),
    ('user6', 'user6@example.com', 'https://example.com/user6.jpg'),
    ('user7', 'user7@example.com', 'https://example.com/user7.jpg'),
    ('user8', 'user8@example.com', 'https://example.com/user8.jpg');