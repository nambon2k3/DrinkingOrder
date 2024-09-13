CREATE DATABASE [DrinkingOrder]
GO
USE [DrinkingOrder]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[Quantity] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [text] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ImgURL] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Fullname] [varchar](100) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Status] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[paymentMethod] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	ToppingID INT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[quantity] [int] NULL,

PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [text] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[imgURL] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[Name] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	ID INT IDENTITY(1,1),   -- Auto-incrementing ID for each topping
    ToppingName NVARCHAR(100)  NULL,        -- Name of the topping
    Price [float]  NULL,               -- Price of the topping
    [IsDeleted] BIT DEFAULT 1,                 -- Availability status of the topping (1: available, 0: not available)
    CreatedDate DATETIME DEFAULT GETDATE(),    -- The date the topping was added to the system
    LastUpdated DATETIME DEFAULT GETDATE()     -- Last updated timestamp
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO


/****** Object:  Table [dbo].[ProductDetail]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageURL] [nvarchar](255) NULL,
	[Size] [varchar](20) NULL,
	[Stock] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[price] [float] NULL,
	[discount] [int] NULL,
	[hold] [int] NULL,
	[ImportPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Value] [varchar](150) NULL,
	[Order] [int] NULL,
	[CreatedBy] [int] NULL,
	[isDeleted] [bit] NULL,
	[description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ProductId] [int] NULL,
	[Notes] [nvarchar](255) NULL,
	[Backlink] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Fullname] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Role] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Avatar] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/12/2024 8:20:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Fullname] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Avatar] [text] NULL,
	[ChangeHistory] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([ID], [UserID], [ProductDetailID], [Quantity], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (52, 1, 4, 3, 0, CAST(N'2024-07-17T00:01:36.550' AS DateTime), 1)
GO
INSERT [dbo].[Cart] ([ID], [UserID], [ProductDetailID], [Quantity], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (53, 1, 44, 1, 0, CAST(N'2024-07-17T00:01:38.643' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (1, N'Men Clothing', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
GO
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (2, N'Women Clothing', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
GO
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (3, N'Kids Clothing', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (1, 1, N'John Doe', N'123 Main St', N'1234567890', N'Close', 0, CAST(N'2024-06-08T23:24:44.457' AS DateTime), 3, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (2, 1, N'Nam', NULL, NULL, N'Close', 0, CAST(N'2024-06-09T00:03:16.550' AS DateTime), 3, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (3, 1, N'Nam', NULL, NULL, N'Close', 0, CAST(N'2024-06-09T00:03:43.273' AS DateTime), 3, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (4, 1, N'Nam', NULL, NULL, N'Close', 0, CAST(N'2024-06-09T00:13:39.323' AS DateTime), 3, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (5, 1, N'John Doe', N'123 Main St', N'1234567890', N'Packaging', 0, CAST(N'2024-06-09T00:29:49.193' AS DateTime), 3, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (6, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:29:54.897' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (7, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:32:56.230' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (8, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:33:38.700' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (9, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:35:04.250' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (10, 1, N'John Doe', N'123 Main St', N'1234567890', N'Canceled', 0, CAST(N'2024-06-09T13:49:58.153' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (11, 1, N'John Doe', N'123 Main St', N'1234567890', N'Success', 0, CAST(N'2024-06-09T13:50:59.840' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (12, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:51:45.560' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (13, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T13:53:35.757' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (14, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-09T21:32:24.747' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (15, 1, N'John Doe', N'123 Main St', N'1234567890', N'Pay Failed', 0, CAST(N'2024-06-09T21:36:22.880' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (16, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-14T08:32:17.617' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (17, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-14T08:32:57.437' AS DateTime), 1, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (18, 1, NULL, NULL, NULL, N'Rejected', 0, CAST(N'2024-06-14T08:33:59.530' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (19, 1, N'John Doe', N'123 Main St', N'1234567890', N'Close', 0, CAST(N'2024-06-14T08:41:50.733' AS DateTime), NULL, N'                                                123                            
                                    
                                ', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (20, 1, NULL, NULL, NULL, N'Failed', 0, CAST(N'2024-06-14T08:44:26.607' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (21, 1, NULL, NULL, NULL, N'COD', 0, CAST(N'2024-06-14T08:44:29.627' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (22, 1, NULL, NULL, NULL, N'Submitted', 0, CAST(N'2024-06-18T23:02:38.920' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (23, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-21T01:08:18.403' AS DateTime), 4, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (24, 1, N'John Doe', N'123 Main St', N'1234567890', N'Success', 0, CAST(N'2024-06-21T01:10:50.973' AS DateTime), 15, N'                                                                        asdasdasd              
                                
                                
                                ', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (25, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-21T10:22:48.640' AS DateTime), 4, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (26, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-21T10:24:14.157' AS DateTime), 4, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (27, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-06-21T10:56:31.733' AS DateTime), 15, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (28, 1, NULL, NULL, NULL, N'Failed', 0, CAST(N'2024-06-21T11:03:54.270' AS DateTime), 4, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (29, 1, N'John Doe', N'123 Main St', N'1234567890', N'Delivering', 0, CAST(N'2024-06-21T11:05:56.157' AS DateTime), 3, N'                                        
                                    ', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (30, 1, N'John Doe', N'123 Main St', N'1234567890', N'Delivering', 0, CAST(N'2024-06-22T09:46:27.793' AS DateTime), 7, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (31, 1, N'John Doe', N'123 Main St', N'1234567890', N'Canceled', 0, CAST(N'2024-06-25T23:31:40.157' AS DateTime), 11, N'', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (32, 1, NULL, NULL, NULL, N'Rejected', 0, CAST(N'2024-06-27T20:44:31.330' AS DateTime), 7, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (33, 1, NULL, NULL, NULL, N'COD', 0, CAST(N'2024-06-27T20:54:16.433' AS DateTime), 11, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (34, 1, N'John Doe', N'123 Main St', N'1234567890', N'Canceled', 0, CAST(N'2024-06-27T20:54:22.060' AS DateTime), 7, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (35, 1, N'John Doe', N'123 Main St', N'1234567890', N'Close', 0, CAST(N'2024-06-27T22:36:32.597' AS DateTime), 7, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (36, 1, N'John Doe', N'123 Main St', N'1234567890', N'Rejected', 0, CAST(N'2024-06-27T22:42:51.733' AS DateTime), 11, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (37, 1, N'John Doe', N'123 Main St', N'1234567890', N'Rejected', 0, CAST(N'2024-06-27T22:42:55.233' AS DateTime), 15, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (38, 1, N'John Doe', N'123 Main St', N'1234567890', N'Rejected', 0, CAST(N'2024-06-27T22:43:07.677' AS DateTime), 7, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (39, 1, N'John Doe', N'123 Main St', N'1234567890', N'Rejected', 0, CAST(N'2024-06-27T22:43:46.057' AS DateTime), 11, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (40, 1, NULL, NULL, NULL, N'COD', 0, CAST(N'2024-06-27T22:51:18.670' AS DateTime), 15, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (41, 1, N'John Doe', N'123 Main St', N'1234567890', N'COD', 0, CAST(N'2024-06-27T22:51:58.323' AS DateTime), 7, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (42, 1, N'John Doe', N'123 Main St', N'1234567890', N'Canceled', 0, CAST(N'2024-06-28T00:25:04.357' AS DateTime), 11, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (43, 1, N'John Doe', N'123 Main St', N'1234567890', N'Success', 0, CAST(N'2024-06-28T00:25:57.030' AS DateTime), 15, N'                                                                                
                                    
                                    ', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (44, 1, N'John Doe', N'123 Main St', N'1234567890', N'Close', 0, CAST(N'2024-06-28T00:26:00.653' AS DateTime), 15, N'                                        
                                    ', NULL)
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (45, 1, N'John Doe', N'123 Main St', N'1234567890', N'Request Cancel', 0, CAST(N'2024-07-01T20:10:40.617' AS DateTime), 11, NULL, N'Tranfer')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (46, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-07-04T10:17:55.290' AS DateTime), 7, N'', N'COD')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (47, 1, N'John Doe', N'123 Main St', N'1234567890', N'Success', 0, CAST(N'2024-07-04T10:21:03.323' AS DateTime), 3, N'', N'COD')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (48, 1, N'John Doe', N'123 Main St', N'1234567890', N'Wait for pay', 0, CAST(N'2024-07-05T08:48:23.837' AS DateTime), 11, N'', N'VNPAY')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (49, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-07-05T22:56:56.190' AS DateTime), 15, N'', N'Tranfer')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (50, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-07-13T19:43:25.453' AS DateTime), 7, N'', N'COD')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (51, 1, N'John Doe', N'123 Main St', N'1234567890', N'Failed', 0, CAST(N'2024-07-13T19:45:20.943' AS DateTime), 3, N'                                            
                                        ', N'COD')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (52, 1, N'John Doe', N'123 Main St', N'1234567890', N'Submitted', 0, CAST(N'2024-07-13T20:04:16.923' AS DateTime), 11, N'', N'COD')
GO
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (53, 1, N'John Doe', N'123 Main St', N'1234567890', N'Canceled', 0, CAST(N'2024-07-15T13:22:30.143' AS DateTime), 3, N'                                            
                                        ', N'COD')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (1, 1, 4, 0, CAST(N'2024-06-08T23:24:44.490' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (2, 4, 5, 0, CAST(N'2024-06-09T00:13:39.350' AS DateTime), 1, 5)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (3, 5, 4, 0, CAST(N'2024-06-09T00:29:49.227' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (4, 6, 4, 0, CAST(N'2024-06-09T13:29:54.943' AS DateTime), 1, 3)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (5, 6, 5, 0, CAST(N'2024-06-09T13:29:54.953' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (6, 7, 4, 0, CAST(N'2024-06-09T13:32:56.263' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (7, 7, 5, 0, CAST(N'2024-06-09T13:32:56.270' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (8, 8, 4, 0, CAST(N'2024-06-09T13:33:38.733' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (9, 8, 5, 0, CAST(N'2024-06-09T13:33:38.743' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (10, 9, 4, 0, CAST(N'2024-06-09T13:35:04.290' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (11, 9, 5, 0, CAST(N'2024-06-09T13:35:04.300' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (12, 10, 4, 0, CAST(N'2024-06-09T13:49:58.200' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (13, 10, 5, 0, CAST(N'2024-06-09T13:49:58.210' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (14, 11, 4, 0, CAST(N'2024-06-09T13:50:59.887' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (15, 11, 5, 0, CAST(N'2024-06-09T13:50:59.907' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (16, 12, 4, 0, CAST(N'2024-06-09T13:51:45.610' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (17, 12, 5, 0, CAST(N'2024-06-09T13:51:45.620' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (18, 13, 4, 0, CAST(N'2024-06-09T13:53:35.793' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (19, 13, 5, 0, CAST(N'2024-06-09T13:53:35.800' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (20, 14, 4, 0, CAST(N'2024-06-09T21:32:24.790' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (21, 14, 5, 0, CAST(N'2024-06-09T21:32:24.803' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (22, 15, 4, 0, CAST(N'2024-06-09T21:36:22.913' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (23, 16, 4, 0, CAST(N'2024-06-14T08:32:17.667' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (24, 16, 5, 0, CAST(N'2024-06-14T08:32:17.680' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (25, 17, 4, 0, CAST(N'2024-06-14T08:32:57.477' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (26, 18, 4, 0, CAST(N'2024-06-14T08:33:59.560' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (27, 19, 4, 0, CAST(N'2024-06-14T08:41:50.770' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (28, 20, 4, 0, CAST(N'2024-06-14T08:44:26.633' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (29, 21, 4, 0, CAST(N'2024-06-14T08:44:29.660' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (30, 22, 4, 0, CAST(N'2024-06-18T23:02:38.960' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (31, 23, 4, 0, CAST(N'2024-06-21T01:08:18.447' AS DateTime), 1, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (32, 24, 4, 0, CAST(N'2024-06-21T01:10:51.010' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (33, 25, 4, 0, CAST(N'2024-06-21T10:22:48.687' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (34, 26, 4, 0, CAST(N'2024-06-21T10:24:14.220' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (35, 27, 4, 0, CAST(N'2024-06-21T10:56:31.777' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (36, 27, 5, 0, CAST(N'2024-06-21T10:56:31.787' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (37, 28, 4, 0, CAST(N'2024-06-21T11:03:54.293' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (38, 29, 4, 0, CAST(N'2024-06-21T11:05:56.180' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (39, 30, 7, 0, CAST(N'2024-06-22T09:46:27.870' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (40, 30, 16, 0, CAST(N'2024-06-22T09:46:27.883' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (41, 31, 4, 0, CAST(N'2024-06-26T23:31:40.213' AS DateTime), 1, 3)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (42, 31, 5, 0, CAST(N'2024-06-26T23:31:40.227' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (43, 31, 12, 0, CAST(N'2024-06-26T23:31:40.237' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (45, 32, 4, 0, CAST(N'2024-06-27T20:44:31.363' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (46, 33, 4, 0, CAST(N'2024-06-27T20:54:16.460' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (47, 34, 4, 0, CAST(N'2024-06-27T20:54:22.080' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (48, 35, 4, 0, CAST(N'2024-06-27T22:36:32.620' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (49, 40, 4, 0, CAST(N'2024-06-27T22:51:18.690' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (50, 41, 4, 0, CAST(N'2024-06-27T22:51:58.340' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (51, 42, 4, 0, CAST(N'2024-06-28T00:25:04.377' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (52, 43, 4, 0, CAST(N'2024-06-28T00:25:57.050' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (53, 44, 5, 0, CAST(N'2024-06-28T00:26:00.670' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (54, 45, 4, 0, CAST(N'2024-07-01T20:10:40.663' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (55, 46, 4, 0, CAST(N'2024-07-04T10:17:55.327' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (56, 47, 4, 0, CAST(N'2024-07-04T10:21:03.363' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (57, 48, 4, 0, CAST(N'2024-07-05T08:48:23.863' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (58, 49, 4, 0, CAST(N'2024-07-05T22:56:56.220' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (59, 50, 4, 0, CAST(N'2024-07-13T19:43:25.490' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (60, 51, 4, 0, CAST(N'2024-07-13T19:45:20.970' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (61, 52, 4, 0, CAST(N'2024-07-13T20:04:16.950' AS DateTime), 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [IsDeleted], [CreatedAt], [CreatedBy], [quantity]) VALUES (62, 53, 4, 0, CAST(N'2024-07-15T13:22:30.173' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (12, 1, N'Great product!', N'I absolutely love this product. Highly recommended!', 0, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (13, 2, N'Not satisfied', N'The product did not meet my expectations.', 0, CAST(N'2024-01-16T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (14, 3, N'Excellent quality', N'The quality is superb. Will buy again.', 0, CAST(N'2024-01-17T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (15, 1, N'Value for money', N'Great value for the price.', 0, CAST(N'2024-01-18T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (16, 2, N'Not worth it', N'The product broke after a week of use.', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (17, 3, N'Very happy', N'I am very happy with my purchase.', 0, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (18, 1, N'Disappointed', N'Did not perform as advertised.', 1, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (19, 2, N'Good customer service', N'Customer service was very helpful.', 0, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (20, 3, N'Highly recommend', N'Would highly recommend to others.', 0, CAST(N'2024-01-23T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (21, 1, N'Average product', N'It is an average product for the price.', 0, CAST(N'2024-01-24T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (22, 2, N'Fast shipping', N'The product arrived quickly.', 0, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (23, 3, N'Terrible experience', N'I had a terrible experience with this product.', 1, CAST(N'2024-01-26T00:00:00.000' AS DateTime), 4, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (24, 3, N'Very durable', N'The product is very durable and long-lasting.', 0, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (25, 1, N'Poor quality', N'Quality is not as expected.', 1, CAST(N'2024-01-28T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (26, 1, N'Satisfied', N'Overall, I am satisfied with the purchase.', 0, CAST(N'2024-01-29T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (27, 2, N'Excellent choice', N'Excellent choice for the price.', 0, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (28, 3, N'Not recommended', N'I would not recommend this product.', 1, CAST(N'2024-01-31T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (29, 3, N'Superb', N'The product is superb in every way.', 0, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (30, 2, N'Okay product', N'It is an okay product, nothing special.', 0, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (31, 2, N'Will buy again', N'Definitely will buy this product again.', 0, CAST(N'2024-02-03T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (32, 2, N'test2', N'test123123', 0, CAST(N'2024-05-20T19:44:46.490' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (33, 1, N'tesy', N'Ã¡dasd', 0, CAST(N'2024-05-22T01:05:52.463' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (34, 1, N'tesyasdasd', N'sdfsdfdsf', 0, CAST(N'2024-05-22T10:16:53.493' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (35, 1, N'hehe', N'asdasdasd', 0, CAST(N'2024-05-22T10:17:50.590' AS DateTime), 1, N'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D')
GO
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (36, 1, N'123', N'123', 0, CAST(N'2024-07-07T21:35:43.517' AS DateTime), 1, N'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D')
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (2, 1, N'Men T-Shirt', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (3, 1, N'Men Jeans', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (4, 1, N'Men Jacket', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (5, 2, N'Women Dress', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (6, 2, N'Women Blouse', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (7, 2, N'Women Skirt', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (8, 3, N'Kids T-Shirt', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (9, 3, N'Kids Shorts', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (10, 3, N'Kids Jacket', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (11, 1, N'Men Sweater', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (12, 1, N'Men Shorts', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (13, 2, N'Women T-Shirt', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (14, 2, N'Women Jeans', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (15, 3, N'Kids Dress', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (16, 3, N'Kids Skirt', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (17, 1, N'Men Hat', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (18, 2, N'Women Hat', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (19, 3, N'Kids Hat', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (20, 1, N'Men Socks', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (21, 2, N'Women Socks', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (22, 3, N'Kids Socks', 0, CAST(N'2024-05-19T10:53:03.030' AS DateTime), N'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (4, 2, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'S',  25, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 42, 10, 21, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (5, 2, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'S', 25, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (6, 3, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L', 20, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (7, 3, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'XL',  19, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (8, 4, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'S',  20, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 5, 100)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (9, 4, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M', 40, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (10, 5, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (11, 5, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L', 60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (12, 6, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  47, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (13, 6, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L',  50, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (14, 7, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'5',  70, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (15, 7, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'6',  70, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (16, 8, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'5', 79, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (17, 8, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'6', 80, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (18, 9, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'7',  30, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (19, 9, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'8', 30, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (20, 10, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L',  40, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (21, 10, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'XL',  40, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (22, 11, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'32',  60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (23, 11, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'34',  60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (24, 12, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  70, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (25, 12, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L',  70, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (26, 13, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'28',  50, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (27, 13, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'30',  50, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (28, 14, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'4',  40, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (29, 14, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'5',  40, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (30, 15, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'4',  60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (31, 15, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'5',  60, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (32, 16, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (33, 16, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (34, 17, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (35, 17, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (36, 18, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M', 100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (37, 18, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  100, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (38, 19, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (39, 19, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L',  200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (40, 20, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M',  200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 100, 10, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (41, 20, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'L',  200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (42, 21, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'S',  200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 150, 15, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (43, 21, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'M', 200, 0, CAST(N'2024-05-19T10:54:44.547' AS DateTime), 1, 200, 20, 0, 20)
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size],  [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (44, 2, N'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', N'XXL', 20, 0, CAST(N'2024-07-16T23:31:34.020' AS DateTime), 1, 56, 10, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (1, N'Admin', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (2, N'Marketing', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (3, N'Sale', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (4, N'Sale leader', 0, CAST(N'2024-05-19T13:48:50.670' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (5, N'User', 0, CAST(N'2024-05-19T13:48:59.990' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (6, N'Inventory', 0, CAST(N'2024-06-23T07:34:59.700' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (1, N'Money', N'VND', 1, 1, 0, N'This is a setting')
GO
INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (2, N'Time', N'24h', 2, 1, 0, N'This is a setting')
GO
INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (3, N'COD', N'45', 1, 1, 1, N'COD limit')
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 
GO
INSERT [dbo].[Slider] ([ID], [Title], [ImageURL], [IsDeleted], [CreatedAt], [CreatedBy], [ProductId], [Notes], [Backlink]) VALUES (1, N'Title 1', N'https://img.freepik.com/premium-vector/modern-sale-banner-website-slider-template-design_54925-46.jpg', 0, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, NULL, N'empty')
GO
INSERT [dbo].[Slider] ([ID], [Title], [ImageURL], [IsDeleted], [CreatedAt], [CreatedBy], [ProductId], [Notes], [Backlink]) VALUES (2, N'Title 2', N'https://i.pinimg.com/736x/b6/89/96/b68996b0aeb13339740f961ada455a77.jpg', 0, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, N'', N'empty')
GO
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (1, N'a@', NULL, N'John Doe', N'Male', N'1234 Elm Street, Springfield, IL', N'123-456-7890', 1, 1, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (2, N'd', N'123', N'Jane Doe', N'Female', N'2345 Oak Street, Springfield, IL', N'234-567-8901', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (3, N'c', N'123', N'Jim Beam', N'Male', N'3456 Pine Street, Springfield, IL', N'345-678-9012', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (4, N'b', N'123', N'Jack Daniels', N'Male', N'4567 Maple Street, Springfield, IL', N'456-789-0123', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (5, N'user5@example.com', N'hashed_password5', N'Johnny Walker', N'Male', N'5678 Cedar Street, Springfield, IL', N'567-890-1234', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (6, N'user6@example.com', N'hashed_password6', N'Jill Valentine', N'Female', N'6789 Birch Street, Springfield, IL', N'678-901-2345', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (7, N'user7@example.com', N'hashed_password7', N'Chris Redfield', N'Male', N'7890 Spruce Street, Springfield, IL', N'789-012-3456', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (8, N'user8@example.com', N'hashed_password8', N'Claire Redfield', N'Female', N'8901 Redwood Street, Springfield, IL', N'890-123-4567', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (9, N'user9@example.com', N'hashed_password9', N'Leon Kennedy', N'Male', N'9012 Sequoia Street, Springfield, IL', N'901-234-5678', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (10, N'user10@example.com', N'hashed_password10', N'Ada Wong', N'Female', N'0123 Cypress Street, Springfield, IL', N'012-345-6789', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (11, N'user11@example.com', N'hashed_password11', N'Albert Wesker', N'Male', N'1234 Fir Street, Springfield, IL', N'123-456-7891', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (12, N'user12@example.com', N'hashed_password12', N'Rebecca Chambers', N'Female', N'2345 Hemlock Street, Springfield, IL', N'234-567-8902', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (13, N'user13@example.com', N'hashed_password13', N'Barry Burton', N'Male', N'3456 Palm Street, Springfield, IL', N'345-678-9013', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (14, N'user14@example.com', N'hashed_password14', N'Sherry Birkin', N'Female', N'4567 Mahogany Street, Springfield, IL', N'456-789-0124', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (15, N'user15@example.com', N'hashed_password15', N'HUNK', N'Male', N'5678 Teak Street, Springfield, IL', N'567-890-1235', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (16, N'a', N'123', N'Inventory', N'Male', N'1234 Elm Street, Springfield, IL', N'123-456-7890', 6, 0, CAST(N'2024-06-23T07:36:27.107' AS DateTime), 6, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
GO
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory]) VALUES (1, N'a', N'123', N'John Doe', N'Male', N'123 Main St', N'1234567890', 0, CAST(N'2024-05-19T10:53:56.770' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg', NULL)
GO
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory]) VALUES (2, N'user2@example.com', N'pass2', N'Jane Smith', N'Female', N'456 Elm St', N'0987654321', 0, CAST(N'2024-05-19T10:53:56.770' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg', N'<br><p><strong>21:07 08-06-2024</strong>: email=user2@example.com, fullname=Jane Smith, gender=Female, address=456 Elm St, phone=0987654321</p><br><p><strong>21:16 08-06-2024</strong>: email=user2@example.com, fullname=Jane Smith, gender=Female, address=456 Elm St, phone=0987654321</p>')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D1053472A844C1]    Script Date: 9/12/2024 8:20:01 AM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534536DB7F5]    Script Date: 9/12/2024 8:20:01 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ProductDetail] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductDetail] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductDetail] ADD  DEFAULT ((0)) FOR [hold]
GO
ALTER TABLE [dbo].[ProductDetail] ADD  DEFAULT ((0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ('https://www.svgrepo.com/show/452030/avatar-default.svg') FOR [Avatar]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('https://www.svgrepo.com/show/452030/avatar-default.svg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetail] ([ID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetail] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ToppingID ])
REFERENCES [dbo].Topping ([ID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([ID])
GO
