USE [master]
GO
/****** Object:  Database [SonStore]    Script Date: 04/03/2023 11:58:29 PM ******/
CREATE DATABASE [SonStore]

GO
ALTER DATABASE [SonStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SonStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SonStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SonStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SonStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SonStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SonStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SonStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SonStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SonStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SonStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SonStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SonStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SonStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SonStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SonStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SonStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SonStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SonStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SonStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SonStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SonStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SonStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SonStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SonStore] SET RECOVERY FULL 
GO
ALTER DATABASE [SonStore] SET  MULTI_USER 
GO
ALTER DATABASE [SonStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SonStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SonStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SonStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SonStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SonStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SonStore', N'ON'
GO
ALTER DATABASE [SonStore] SET QUERY_STORE = OFF
GO
USE [SonStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 04/03/2023 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04/03/2023 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 04/03/2023 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/03/2023 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/03/2023 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](255) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](255) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
 CONSTRAINT [PK__Products__C5775520CE441E04] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (1, N'user', N'user', N'user', N'02165468415', 1, 0)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (2, N'admin', N'admin', N'admin1', N'021321312321', 1, 1)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (4, N'hhhhh@faf.gom', N'hhhhh', N'hhhhh', N'213213213', 1, 0)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (6, N'wqdwq@gss.com', N'123123', N'dsada', N'12321321', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'3CE')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'Maybelline')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'Gucci')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N'Shiseido')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (5, N'Pearl')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (6, N'Dior')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (7, N'Uemura')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (8, N'Mac')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 2, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (5, 2, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (6, 2, 8, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (7, 3, 10, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (8, 4, 6, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (9, 5, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (10, 5, 5, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (11, 6, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (12, 6, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (13, 7, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (14, 7, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (15, 7, 8, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (16, 7, 9, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (17, 8, 6, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (18, 9, 5, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (19, 10, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (20, 10, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (21, 11, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (22, 12, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (23, 13, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (24, 14, 3, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (25, 15, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (26, 15, 2, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (27, 16, 1, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (28, 17, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (29, 18, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (30, 19, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (31, 20, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (32, 21, 6, 10)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (33, 22, 2, 9)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (34, 23, 1, 5)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (35, 23, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (36, 24, 6, 5)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (37, 25, 1, 5)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (38, 25, 2, 5)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (39, 26, 2, 5)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2023-02-20' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2023-02-21' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2023-02-22' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2023-02-23' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2023-02-24' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (6, CAST(N'2023-02-25' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (7, CAST(N'2023-02-19' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (8, CAST(N'2023-02-17' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (9, CAST(N'2023-02-18' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (10, CAST(N'2023-02-16' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (11, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (12, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (13, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (14, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (15, CAST(N'2023-03-02' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (16, CAST(N'2023-03-02' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (17, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (18, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (19, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (20, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (21, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (22, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (23, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (24, CAST(N'2023-03-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (25, CAST(N'2023-03-04' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (26, CAST(N'2023-03-04' AS Date), NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'Shiseido 01', 899, N'images/picture62.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'Gucci 01', 1009, N'images/picture63.jpg', N'son duoc yeu thich nhat hien nay', 0, 3)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'Maybelline 01', 1009, N'images/picture64.jpg', N'son duoc yeu thich nhat hien nay', 1, 2)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'Gucci 03', 699, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 3)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (5, N'Shiseido 02', 25000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (6, N'Shiseido 03', 1009, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (7, N'3CE 01', 18000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (8, N'3CE 02', 12000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (9, N'3CE 03', 22000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (10, N'Shiseido 04', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (11, N'Shiseido 05', 699, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (12, N'Shiseido 06', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (13, N'Shiseido 07', 1009, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (14, N'Shiseido 07', 699, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (15, N'Shiseido 08', 1009, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (16, N'Shiseido 09', 899, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (17, N'Shiseido 10', 1009, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (18, N'Shiseido 11', 699, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (19, N'Shiseido 12', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (20, N'Shiseido 13', 699, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (21, N'Shiseido 14', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (22, N'Shiseido 15', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (23, N'Shiseido 16', 899, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (24, N'Shiseido 17', 899, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (25, N'Shiseido 18', 1009, N'images/picture65.jpg', N'Lson duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (26, N'Shiseido 19', 899, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (27, N'Shiseido 20', 1009, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (28, N'Shiseido 21', 28000, N'images/picture65.jpg', N'son duoc yeu thich nhat hien nay', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164577E2313]    Script Date: 04/03/2023 11:58:29 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDetail__FID__2E1BDC42] FOREIGN KEY([FID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDetail__FID__2E1BDC42]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__CateID__300424B4] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__CateID__300424B4]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK__Products__price__34C8D9D1] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK__Products__price__34C8D9D1]
GO
USE [master]
GO
ALTER DATABASE [SonStore] SET  READ_WRITE 
GO
