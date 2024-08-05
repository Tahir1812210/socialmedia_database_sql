


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type IN (N'U'))
BEGIN
    CREATE TABLE [dbo].[Comments]
    (
        comment_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
        [user_id] UNIQUEIDENTIFIER,
        [photo_id] UNIQUEIDENTIFIER,
        content VARCHAR(MAX),
        created_at DATETIME,
        FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]),
        FOREIGN KEY ([photo_id]) REFERENCES [dbo].[Photos]([photo_id])
    );
END

alter table [dbo].[Comments] add constraint DF_Comments_CreatedAt DEFAULT SYSDATETIME() for [created_at];




IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reposts]') AND type IN (N'U'))
BEGIN
    CREATE TABLE [dbo].[Reposts]
    (
        repost_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
        [user_id] UNIQUEIDENTIFIER,
        [photo_id] UNIQUEIDENTIFIER,
        content VARCHAR(MAX),
        created_at DATETIME default sysdatetime(),
        FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]),
        FOREIGN KEY ([photo_id]) REFERENCES [dbo].[Photos]([photo_id])
    );
END

alter table [dbo].[reposts] add constraint DF_REPOSTS_PhotoId DEFAULT NEWID() FOR [photo_id]

ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT DF_Comments_UserId DEFAULT NEWID() FOR [user_id];

alter table [dbo].[photos] add constraint DF_Photos_UserId DEFAULT NEWID() FOR [user_id]




alter table [dbo].[Likes] add constraint DF_Comments_CreatedAt DEFAULT SYSDATETIME() for [created_at];

alter table [dbo].[Comments] add constraint DF_Comments_CreatedAt DEFAULT SYSDATETIME() for [created_at];


ALTER TABLE [dbo].[Likes]
ADD CONSTRAINT DF_Likes_UserId DEFAULT NEWID() FOR [user_id];

ALTER TABLE [dbo].[Likes]
ADD CONSTRAINT DF_Likes_PhotoId DEFAULT NEWID() FOR [photo_id];