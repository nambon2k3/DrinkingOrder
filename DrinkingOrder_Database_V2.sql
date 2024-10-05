USE [master]
GO
/****** Object:  Database [DrinkingOrder]    Script Date: 10/5/2024 8:09:55 PM ******/
CREATE DATABASE [DrinkingOrder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DrinkingOrder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DrinkingOrder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DrinkingOrder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DrinkingOrder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DrinkingOrder] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DrinkingOrder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DrinkingOrder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DrinkingOrder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DrinkingOrder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DrinkingOrder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DrinkingOrder] SET ARITHABORT OFF 
GO
ALTER DATABASE [DrinkingOrder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DrinkingOrder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DrinkingOrder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DrinkingOrder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DrinkingOrder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DrinkingOrder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DrinkingOrder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DrinkingOrder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DrinkingOrder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DrinkingOrder] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DrinkingOrder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DrinkingOrder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DrinkingOrder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DrinkingOrder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DrinkingOrder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DrinkingOrder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DrinkingOrder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DrinkingOrder] SET RECOVERY FULL 
GO
ALTER DATABASE [DrinkingOrder] SET  MULTI_USER 
GO
ALTER DATABASE [DrinkingOrder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DrinkingOrder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DrinkingOrder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DrinkingOrder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DrinkingOrder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DrinkingOrder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DrinkingOrder', N'ON'
GO
ALTER DATABASE [DrinkingOrder] SET QUERY_STORE = ON
GO
ALTER DATABASE [DrinkingOrder] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DrinkingOrder]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 10/5/2024 8:09:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](200) NULL,
	[shipperID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/5/2024 8:09:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[ToppingID] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 10/5/2024 8:09:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageURL] [nvarchar](MAX) NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Slider]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 10/5/2024 8:09:55 PM ******/
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
/****** Object:  Table [dbo].[Topping]    Script Date: 10/5/2024 8:09:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ToppingName] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[Img] [nvarchar](max) NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/5/2024 8:09:55 PM ******/
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
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (1, N'Fresh Fruit', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (2, N'Coffee', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy]) VALUES (3, N'Cacao', 0, CAST(N'2024-05-19T10:52:57.557' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (1, 1, N'John Doe', N'123 Elm Street', N'0123456789', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'First order', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (2, 2, N'Jane Doe', N'456 Oak Street', N'0987654321', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Second order', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (3, 1, N'Michael Smith', N'789 Pine Street', N'0123987654', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Urgent delivery', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (4, 2, N'Anna Johnson', N'321 Maple Avenue', N'0112345678', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Requires call before delivery', N'Bank Transfer')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (5, 1, N'Chris Brown', N'654 Cedar Drive', N'0102938475', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Gift order', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (6, 2, N'Emily Davis', N'987 Spruce Road', N'0192837465', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No notes', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (7, 1, N'David Wilson', N'123 Birch Lane', N'0213456789', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Rush delivery', N'PayPal')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (8, 2, N'Sarah Lee', N'432 Chestnut Street', N'0398475612', N'Cancelled', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Wrong address provided', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (9, 1, N'Daniel Moore', N'897 Beech Avenue', N'0456129384', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Regular customer', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (10, 2, N'Jessica Taylor', N'512 Sycamore Court', N'0547382910', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Fast delivery', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (11, 1, N'Brian Anderson', N'789 Aspen Way', N'0619283746', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Weekend delivery', N'Bank Transfer')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (12, 2, N'Laura Martin', N'256 Redwood Blvd', N'0793845612', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No specific instructions', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (13, 1, N'James Thompson', N'341 Fir Drive', N'0865123497', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Leave at door', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (14, 2, N'Karen Martinez', N'910 Poplar Street', N'0956723481', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Weekend delivery', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (15, 1, N'Stephen King', N'667 Dogwood Court', N'0123948576', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Express shipping', N'PayPal')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (16, 2, N'Rachel White', N'789 Pine Grove', N'0218475639', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No rush', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (17, 1, N'Robert Garcia', N'1592 Walnut Ave', N'0385672341', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Deliver anytime', N'Bank Transfer')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (18, 2, N'Sophia Rodriguez', N'1487 Willow Drive', N'0467129384', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Leave with neighbor', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (19, 1, N'Andrew Harris', N'451 Cedar Grove', N'0536723948', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No notes', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (20, 2, N'Lily Clark', N'320 Redwood Place', N'0621938475', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Fast delivery', N'PayPal')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (21, 1, N'Matthew Lewis', N'711 Birch Road', N'0719382475', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Contactless delivery', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (22, 2, N'Ava Walker', N'1722 Spruce Way', N'0817293847', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Rush order', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (23, 1, N'Joshua Hall', N'345 Oak Court', N'0918273645', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Morning delivery', N'Bank Transfer')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (24, 2, N'Emma Young', N'268 Maple Lane', N'0192738465', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No specific notes', N'Cash')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (25, 1, N'Benjamin Allen', N'354 Pine St', N'0129384756', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Regular customer', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (26, 2, N'Mia Scott', N'732 Elm Court', N'0283947562', N'Shipped', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No notes', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (27, 1, N'Christopher Wright', N'412 Oak Road', N'0365271384', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Quick shipping requested', N'PayPal')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (28, 2, N'Ella Green', N'920 Fir Place', N'0457281938', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Contactless delivery preferred', N'Bank Transfer')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (29, 1, N'Ethan Adams', N'603 Chestnut Grove', N'0572183496', N'Pending', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'Fast delivery needed', N'Credit Card')
INSERT [dbo].[Order] ([ID], [UserID], [Fullname], [Address], [Phone], [Status], [IsDeleted], [CreatedAt], [CreatedBy], [Notes], [paymentMethod]) VALUES (30, 2, N'Olivia Nelson', N'884 Redwood Court', N'0645182739', N'Completed', 0, CAST(N'2024-10-05T20:05:45.133' AS DateTime), 1, N'No specific delivery notes', N'Credit Card')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (12, 1, N'Great product!', N'I absolutely love this product. Highly recommended!', 0, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (13, 2, N'Not satisfied', N'The product did not meet my expectations.', 0, CAST(N'2024-01-16T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (14, 3, N'Excellent quality', N'The quality is superb. Will buy again.', 0, CAST(N'2024-01-17T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (15, 1, N'Value for money', N'Great value for the price.', 0, CAST(N'2024-01-18T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (16, 2, N'Not worth it', N'The product broke after a week of use.', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (17, 3, N'Very happy', N'I am very happy with my purchase.', 0, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (18, 1, N'Disappointed', N'Did not perform as advertised.', 1, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (19, 2, N'Good customer service', N'Customer service was very helpful.', 0, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (20, 3, N'Highly recommend', N'Would highly recommend to others.', 0, CAST(N'2024-01-23T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (21, 1, N'Average product', N'It is an average product for the price.', 0, CAST(N'2024-01-24T00:00:00.000' AS DateTime), 3, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (22, 2, N'Fast shipping', N'The product arrived quickly.', 0, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (23, 3, N'Terrible experience', N'I had a terrible experience with this product.', 1, CAST(N'2024-01-26T00:00:00.000' AS DateTime), 4, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (24, 3, N'Very durable', N'The product is very durable and long-lasting.', 0, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (25, 1, N'Poor quality', N'Quality is not as expected.', 1, CAST(N'2024-01-28T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (26, 1, N'Satisfied', N'Overall, I am satisfied with the purchase.', 0, CAST(N'2024-01-29T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (27, 2, N'Excellent choice', N'Excellent choice for the price.', 0, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (28, 3, N'Not recommended', N'I would not recommend this product.', 1, CAST(N'2024-01-31T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (29, 3, N'Superb', N'The product is superb in every way.', 0, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 2, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (30, 2, N'Okay product', N'It is an okay product, nothing special.', 0, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (31, 2, N'Will buy again', N'Definitely will buy this product again.', 0, CAST(N'2024-02-03T00:00:00.000' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (32, 2, N'test2', N'test123123', 0, CAST(N'2024-05-20T19:44:46.490' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (33, 1, N'tesy', N'Ã¡dasd', 0, CAST(N'2024-05-22T01:05:52.463' AS DateTime), 1, N'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (34, 1, N'tesyasdasd', N'sdfsdfdsf', 0, CAST(N'2024-05-22T10:16:53.493' AS DateTime), 1, NULL)
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (35, 1, N'hehe', N'asdasdasd', 0, CAST(N'2024-05-22T10:17:50.590' AS DateTime), 1, N'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D')
INSERT [dbo].[Post] ([ID], [CategoryID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL]) VALUES (36, 1, N'123', N'123', 0, CAST(N'2024-07-07T21:35:43.517' AS DateTime), 1, N'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (23, 1, N'Coca Cola Test', 1, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Refreshing soda beverage 2', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (24, 1, N'Pepsi Test', 1, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Popular cola drink 2', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (25, 1, N'Orange Juice Test', 1, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Freshly squeezed orange juice 2', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (26, 1, N'Iced Coffee Test', 1, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Chilled coffee with ice2', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (27, 1, N'Green Tea', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Healthy green tea drink', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (28, 1, N'Lemonade', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Sweet and tangy lemonade', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (29, 1, N'Mango Smoothie', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Blended mango drink', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (30, 1, N'Espresso', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Strong brewed coffee', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (31, 1, N'Milkshake', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Creamy milkshake with chocolate flavor', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (32, 1, N'Herbal Tea', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Relaxing herbal infusion', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (33, 2, N'Cheeseburger', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Grilled burger with cheese and vegetables', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (34, 2, N'French Fries', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Crispy fried potatoes', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (35, 2, N'Chicken Sandwich', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Grilled chicken with lettuce and tomato', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (36, 2, N'Caesar Salad', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Salad with romaine lettuce, croutons, and Caesar dressing', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (37, 2, N'Pizza Margherita', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Classic pizza with mozzarella and basil', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (38, 2, N'Spaghetti Bolognese', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Pasta with beef and tomato sauce', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (39, 2, N'Chicken Wings', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Spicy and crispy chicken wings', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (40, 2, N'Fish and Chips', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Fried fish with crispy chips', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (41, 2, N'Grilled Cheese', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Toasted bread with melted cheese', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (42, 2, N'Burrito', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Mexican wrap with beans, rice, and meat', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (43, 3, N'Chocolate Cake', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Rich chocolate cake with cream', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (44, 3, N'Ice Cream', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Vanilla ice cream with chocolate syrup', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (45, 3, N'Brownie', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Warm chocolate brownie with nuts', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (46, 3, N'Fruit Tart', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Tart with fresh seasonal fruits', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (47, 3, N'Cheesecake', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Creamy cheesecake with a graham cracker crust', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (48, 3, N'Tiramisu', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Italian dessert with coffee and mascarpone', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (49, 3, N'Pancakes', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Fluffy pancakes with maple syrup', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (50, 3, N'Apple Pie', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Pie with sweet apple filling', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (51, 3, N'Doughnut', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Fried dough pastry with sugar glaze', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (52, 3, N'Cupcake', 0, CAST(N'2024-09-23T16:15:57.320' AS DateTime), N'Small cake with frosting and sprinkles', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (53, 2, N'test', 0, CAST(N'2024-10-05T19:46:23.303' AS DateTime), N'', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (54, 1, N'test', 0, CAST(N'2024-10-05T19:47:04.570' AS DateTime), N'123', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (55, 1, N'test', 0, CAST(N'2024-10-05T19:47:42.760' AS DateTime), N'', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (56, 1, N'test', 0, CAST(N'2024-10-05T19:48:18.433' AS DateTime), N'123', 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [IsDeleted], [CreatedAt], [description], [CreatedBy]) VALUES (57, 1, N'test', 0, CAST(N'2024-10-05T19:49:10.167' AS DateTime), N'1`23', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (45, 23, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Small', 50, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 1.5, 0, 0, 1)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (46, 24, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Medium', 30, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 1.6, 0, 0, 1.1)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (47, 25, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'M', 40, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2.55, 0, 0, 2)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (48, 26, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'XL', 25, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2.5, 0, 0, 1.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (49, 27, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 35, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2.1, 0, 0, 1.6)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (50, 28, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Small', 60, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 1.2, 0, 0, 0.8)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (51, 29, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 20, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3, 0, 0, 2.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (52, 30, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Small', 45, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 1.8, 0, 0, 1.3)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (53, 31, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 30, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3.5, 0, 0, 3)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (54, 32, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Medium', 50, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2, 0, 0, 1.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (55, 33, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Regular', 15, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 5.5, 0, 0, 4.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (56, 34, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 25, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3, 0, 0, 2)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (57, 35, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Regular', 20, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 6, 0, 0, 4.8)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (58, 36, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 10, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 7.5, 0, 0, 6)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (59, 37, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Medium', 12, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 8, 0, 0, 6.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (60, 38, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 8, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 9, 0, 0, 7)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (61, 39, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Regular', 30, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 5, 0, 0, 3.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (62, 40, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 18, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 6.5, 0, 0, 5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (63, 41, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Regular', 25, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 4, 0, 0, 3)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (64, 42, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Large', 12, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 7.5, 0, 0, 6)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (65, 43, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Slice', 20, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3, 0, 0, 2.5)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (66, 44, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Bowl', 40, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2.5, 0, 0, 2)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (67, 45, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Piece', 25, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2.8, 0, 0, 2.2)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (68, 46, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Small', 15, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3.5, 0, 0, 2.8)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (69, 47, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Slice', 20, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 4, 0, 0, 3.2)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (70, 48, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Piece', 18, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 4.5, 0, 0, 3.6)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (71, 49, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Stack', 12, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 5, 0, 0, 4)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (72, 50, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Slice', 10, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 3.8, 0, 0, 3)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (73, 51, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Single', 35, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 1.5, 0, 0, 1)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [ImageURL], [Size], [Stock], [IsDeleted], [CreatedAt], [CreatedBy], [price], [discount], [hold], [ImportPrice]) VALUES (74, 52, N'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', N'Single', 30, 0, CAST(N'2024-09-23T16:28:21.177' AS DateTime), 1, 2, 0, 0, 1.5)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (1, N'Admin', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (2, N'Marketing', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (3, N'Sale', 0, CAST(N'2024-05-19T13:48:28.640' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (4, N'Sale leader', 0, CAST(N'2024-05-19T13:48:50.670' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (5, N'User', 0, CAST(N'2024-05-19T13:48:59.990' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (6, N'Inventory', 0, CAST(N'2024-06-23T07:34:59.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (1, N'Money', N'VND', 1, 1, 0, N'This is a setting')
INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (2, N'Time', N'24h', 2, 1, 0, N'This is a setting')
INSERT [dbo].[Settings] ([ID], [Type], [Value], [Order], [CreatedBy], [isDeleted], [description]) VALUES (3, N'COD', N'45', 1, 1, 1, N'COD limit')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [Title], [ImageURL], [IsDeleted], [CreatedAt], [CreatedBy], [ProductId], [Notes], [Backlink]) VALUES (1, N'Title 1', N'https://img.freepik.com/premium-vector/modern-sale-banner-website-slider-template-design_54925-46.jpg', 0, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, NULL, N'empty')
INSERT [dbo].[Slider] ([ID], [Title], [ImageURL], [IsDeleted], [CreatedAt], [CreatedBy], [ProductId], [Notes], [Backlink]) VALUES (2, N'Title 2', N'https://i.pinimg.com/736x/b6/89/96/b68996b0aeb13339740f961ada455a77.jpg', 0, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, N'', N'empty')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (1, N'a@', NULL, N'John Doe', N'Male', N'1234 Elm Street, Springfield, IL', N'123-456-7890', 1, 1, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (2, N'd', N'123', N'Jane Doe', N'Female', N'2345 Oak Street, Springfield, IL', N'234-567-8901', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (3, N'c', N'123', N'Jim Beam', N'Male', N'3456 Pine Street, Springfield, IL', N'345-678-9012', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (4, N'b', N'123', N'Jack Daniels', N'Male', N'4567 Maple Street, Springfield, IL', N'456-789-0123', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (5, N'user5@example.com', N'hashed_password5', N'Johnny Walker', N'Male', N'5678 Cedar Street, Springfield, IL', N'567-890-1234', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (6, N'user6@example.com', N'hashed_password6', N'Jill Valentine', N'Female', N'6789 Birch Street, Springfield, IL', N'678-901-2345', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (7, N'user7@example.com', N'hashed_password7', N'Chris Redfield', N'Male', N'7890 Spruce Street, Springfield, IL', N'789-012-3456', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (8, N'user8@example.com', N'hashed_password8', N'Claire Redfield', N'Female', N'8901 Redwood Street, Springfield, IL', N'890-123-4567', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (9, N'user9@example.com', N'hashed_password9', N'Leon Kennedy', N'Male', N'9012 Sequoia Street, Springfield, IL', N'901-234-5678', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (10, N'user10@example.com', N'hashed_password10', N'Ada Wong', N'Female', N'0123 Cypress Street, Springfield, IL', N'012-345-6789', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (11, N'user11@example.com', N'hashed_password11', N'Albert Wesker', N'Male', N'1234 Fir Street, Springfield, IL', N'123-456-7891', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (12, N'user12@example.com', N'hashed_password12', N'Rebecca Chambers', N'Female', N'2345 Hemlock Street, Springfield, IL', N'234-567-8902', 4, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 4, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (13, N'user13@example.com', N'hashed_password13', N'Barry Burton', N'Male', N'3456 Palm Street, Springfield, IL', N'345-678-9013', 1, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (14, N'user14@example.com', N'hashed_password14', N'Sherry Birkin', N'Female', N'4567 Mahogany Street, Springfield, IL', N'456-789-0124', 2, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 2, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (15, N'user15@example.com', N'hashed_password15', N'HUNK', N'Male', N'5678 Teak Street, Springfield, IL', N'567-890-1235', 3, 0, CAST(N'2024-05-22T23:21:10.153' AS DateTime), 3, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
INSERT [dbo].[Staff] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [Role], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar]) VALUES (16, N'a', N'123', N'Inventory', N'Male', N'1234 Elm Street, Springfield, IL', N'123-456-7890', 1, 0, CAST(N'2024-06-23T07:36:27.107' AS DateTime), 6, N'https://www.svgrepo.com/show/452030/avatar-default.svg')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Topping] ON 

INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (6, N'Whipped Cream', 0.5, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 23)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (7, N'Chocolate Syrup', 0.75, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 24)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (8, N'Vanilla Syrup', 0.7, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 25)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (9, N'Caramel Drizzle', 0.65, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 26)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (10, N'Ice Cubes', 0.2, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 27)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (11, N'Lemon Slice', 0.3, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 28)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (12, N'Cinnamon', 0.4, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 29)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (13, N'Mint Leaves', 0.25, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 30)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (14, N'Honey', 0.6, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 31)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (15, N'Chia Seeds', 0.55, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 32)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (16, N'Extra Cheese', 1, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 33)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (17, N'Bacon Bits', 1.25, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 34)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (18, N'Guacamole', 1.5, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 35)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (19, N'Sour Cream', 0.75, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 36)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (20, N'Jalapenos', 0.5, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 37)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (21, N'Pickles', 0.45, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 38)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (22, N'Ketchup', 0.2, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 39)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (23, N'BBQ Sauce', 0.3, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 40)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (24, N'Mayo', 0.25, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 41)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (25, N'Mustard', 0.2, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 42)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (26, N'Chocolate Chips', 0.7, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 43)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (27, N'Sprinkles', 0.6, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 44)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (28, N'Caramel Sauce', 0.75, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 45)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (29, N'Fruit Pieces', 0.9, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 46)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (30, N'Whipped Cream', 0.5, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 47)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (31, N'Nuts', 0.85, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 48)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (32, N'Coconut Flakes', 0.65, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 49)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (33, N'Marshmallows', 0.6, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 50)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (34, N'Cherries', 0.55, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 51)
INSERT [dbo].[Topping] ([ID], [ToppingName], [Price], [IsDeleted], [CreatedDate], [LastUpdated], [Img], [ProductID]) VALUES (35, N'Cocoa Powder', 0.45, 0, CAST(N'2024-09-23T16:20:52.900' AS DateTime), CAST(N'2024-09-23T16:20:52.900' AS DateTime), N'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 52)
SET IDENTITY_INSERT [dbo].[Topping] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory]) VALUES (1, N'a', N'123', N'John Doe', N'Male', N'123 Main St', N'1234567890', 0, CAST(N'2024-05-19T10:53:56.770' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg', NULL)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory]) VALUES (2, N'user2@example.com', N'12345678', N'Jane Smith', N'Female', N'456 Elm St', N'0987654321', 0, CAST(N'2024-05-19T10:53:56.770' AS DateTime), 1, N'https://www.svgrepo.com/show/452030/avatar-default.svg', N'<br><p><strong>21:07 08-06-2024</strong>: email=user2@example.com, fullname=Jane Smith, gender=Female, address=456 Elm St, phone=0987654321</p><br><p><strong>21:16 08-06-2024</strong>: email=user2@example.com, fullname=Jane Smith, gender=Female, address=456 Elm St, phone=0987654321</p>')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D10534FB5AE6AF]    Script Date: 10/5/2024 8:09:55 PM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534A00DEA4F]    Script Date: 10/5/2024 8:09:55 PM ******/
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
ALTER TABLE [dbo].[Location] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Location] ADD  DEFAULT (getdate()) FOR [CreatedAt]
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
ALTER TABLE [dbo].[Topping] ADD  DEFAULT ((1)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Topping] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Topping] ADD  DEFAULT (getdate()) FOR [LastUpdated]
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
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([shipperID])
REFERENCES [dbo].[Staff] ([ID])
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
ALTER TABLE [dbo].[Topping]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
USE [master]
GO
ALTER DATABASE [DrinkingOrder] SET  READ_WRITE 
GO
