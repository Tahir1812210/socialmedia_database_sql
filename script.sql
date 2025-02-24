USE [SocialMedia]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8/5/2024 11:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[photo_id] [uniqueidentifier] NULL,
	[content] [varchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 8/5/2024 11:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[like_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[photo_id] [uniqueidentifier] NULL,
	[created_at] [datetime2](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 8/5/2024 11:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[photo_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[image] [varbinary](max) NULL,
	[caption] [varchar](max) NULL,
	[created_at] [datetime2](3) NULL,
	[updated_at] [datetime2](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[photo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reposts]    Script Date: 8/5/2024 11:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reposts](
	[repost_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[photo_id] [uniqueidentifier] NULL,
	[content] [varchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[repost_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/5/2024 11:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [uniqueidentifier] NOT NULL,
	[username] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (newid()) FOR [comment_id]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_UserId]  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_CreatedAt]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (newid()) FOR [like_id]
GO
ALTER TABLE [dbo].[Likes] ADD  CONSTRAINT [DF_Likes_UserId]  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Likes] ADD  CONSTRAINT [DF_Likes_PhotoId]  DEFAULT (newid()) FOR [photo_id]
GO
ALTER TABLE [dbo].[Photos] ADD  DEFAULT (newid()) FOR [photo_id]
GO
ALTER TABLE [dbo].[Photos] ADD  CONSTRAINT [DF_Photos_UserId]  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Reposts] ADD  DEFAULT (newid()) FOR [repost_id]
GO
ALTER TABLE [dbo].[Reposts] ADD  CONSTRAINT [DF_REPOSTS_UserId]  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Reposts] ADD  CONSTRAINT [DF_REPOSTS_PhotoId]  DEFAULT (newid()) FOR [photo_id]
GO
ALTER TABLE [dbo].[Reposts] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([photo_id])
REFERENCES [dbo].[Photos] ([photo_id])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([photo_id])
REFERENCES [dbo].[Photos] ([photo_id])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reposts]  WITH CHECK ADD FOREIGN KEY([photo_id])
REFERENCES [dbo].[Photos] ([photo_id])
GO
ALTER TABLE [dbo].[Reposts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DESCRIPTION', @value=N'To store user information who deal with social media' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
