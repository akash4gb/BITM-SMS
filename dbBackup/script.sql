USE [master]
GO
/****** Object:  Database [SMS_lazydevs]    Script Date: 09-Aug-18 1:20:32 AM ******/
CREATE DATABASE [SMS_lazydevs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMS_lazydevs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SMS_lazydevs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMS_lazydevs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SMS_lazydevs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SMS_lazydevs] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMS_lazydevs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMS_lazydevs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMS_lazydevs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMS_lazydevs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SMS_lazydevs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMS_lazydevs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SMS_lazydevs] SET  MULTI_USER 
GO
ALTER DATABASE [SMS_lazydevs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMS_lazydevs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMS_lazydevs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMS_lazydevs] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SMS_lazydevs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMS_lazydevs] SET QUERY_STORE = OFF
GO
USE [SMS_lazydevs]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SMS_lazydevs]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 09-Aug-18 1:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 09-Aug-18 1:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 09-Aug-18 1:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
	[ReOrderLevel] [int] NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockIn]    Script Date: 09-Aug-18 1:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockIn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_stockIn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockOut]    Script Date: 09-Aug-18 1:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](25) NULL,
	[categoryName] [varchar](25) NULL,
	[ItemName] [varchar](25) NULL,
	[quantity] [int] NULL,
	[date] [date] NULL,
	[StockOutType] [varchar](20) NULL,
 CONSTRAINT [PK_stockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09-Aug-18 1:20:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[PassWord] [nchar](10) NOT NULL,
	[UserType] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([Id], [Name]) VALUES (18, N'Medicine')
INSERT [dbo].[categories] ([Id], [Name]) VALUES (19, N'Grocery')
INSERT [dbo].[categories] ([Id], [Name]) VALUES (22, N'Food')
INSERT [dbo].[categories] ([Id], [Name]) VALUES (23, N'Beauty Product')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([Id], [Name]) VALUES (14, N'Square')
INSERT [dbo].[companies] ([Id], [Name]) VALUES (15, N'Unilever')
SET IDENTITY_INSERT [dbo].[companies] OFF
SET IDENTITY_INSERT [dbo].[items] ON 

INSERT [dbo].[items] ([Id], [Name], [ReOrderLevel], [CategoryId], [CompanyId]) VALUES (14, N'Seclo', 10, 18, 14)
INSERT [dbo].[items] ([Id], [Name], [ReOrderLevel], [CategoryId], [CompanyId]) VALUES (15, N'Seclo 20', 100, 18, 14)
INSERT [dbo].[items] ([Id], [Name], [ReOrderLevel], [CategoryId], [CompanyId]) VALUES (16, N'Vasline lotion', 5, 23, 15)
SET IDENTITY_INSERT [dbo].[items] OFF
SET IDENTITY_INSERT [dbo].[stockIn] ON 

INSERT [dbo].[stockIn] ([id], [categoryId], [ItemId], [Quantity], [CompanyId]) VALUES (15, 18, 14, 700, 14)
INSERT [dbo].[stockIn] ([id], [categoryId], [ItemId], [Quantity], [CompanyId]) VALUES (16, 18, 15, 400, 14)
INSERT [dbo].[stockIn] ([id], [categoryId], [ItemId], [Quantity], [CompanyId]) VALUES (17, 23, 16, 280, 15)
SET IDENTITY_INSERT [dbo].[stockIn] OFF
SET IDENTITY_INSERT [dbo].[stockOut] ON 

INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (18, N'Square', N'Medicine', N'Seclo', 200, CAST(N'2018-08-04' AS Date), N'Sold')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (19, N'Square', N'Medicine', N'Seclo 20', 100, CAST(N'2018-04-08' AS Date), N'Sold')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (20, N'Square', N'Medicine', N'Seclo', 50, CAST(N'2018-04-08' AS Date), N'Sold')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (21, N'Unilever', N'Beauty Product', N'Vasline lotion', 20, CAST(N'2018-08-09' AS Date), N'Sold')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (22, N'Square', N'Medicine', N'Seclo', 30, CAST(N'2018-08-09' AS Date), N'Sold')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (23, N'Square', N'Medicine', N'Seclo', 10, CAST(N'2018-08-09' AS Date), N'Lost')
INSERT [dbo].[stockOut] ([Id], [companyName], [categoryName], [ItemName], [quantity], [date], [StockOutType]) VALUES (24, N'Square', N'Medicine', N'Seclo', 10, CAST(N'2018-08-09' AS Date), N'Damaged')
SET IDENTITY_INSERT [dbo].[stockOut] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [PassWord], [UserType]) VALUES (22, N'user', N'user123   ', N'2         ')
INSERT [dbo].[Users] ([Id], [UserName], [PassWord], [UserType]) VALUES (25, N'admin', N'admin     ', N'1         ')
INSERT [dbo].[Users] ([Id], [UserName], [PassWord], [UserType]) VALUES (26, N'azom', N'azom123   ', N'2         ')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[items]  WITH CHECK ADD  CONSTRAINT [FK_items_categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[categories] ([Id])
GO
ALTER TABLE [dbo].[items] CHECK CONSTRAINT [FK_items_categories]
GO
ALTER TABLE [dbo].[stockIn]  WITH CHECK ADD  CONSTRAINT [FK_stockIn_categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([Id])
GO
ALTER TABLE [dbo].[stockIn] CHECK CONSTRAINT [FK_stockIn_categories]
GO
ALTER TABLE [dbo].[stockIn]  WITH CHECK ADD  CONSTRAINT [FK_stockIn_items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[items] ([Id])
GO
ALTER TABLE [dbo].[stockIn] CHECK CONSTRAINT [FK_stockIn_items]
GO
USE [master]
GO
ALTER DATABASE [SMS_lazydevs] SET  READ_WRITE 
GO
