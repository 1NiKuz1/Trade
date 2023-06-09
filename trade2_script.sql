USE [master]
GO
/****** Object:  Database [Trade2]    Script Date: 05.04.2023 15:48:04 ******/
CREATE DATABASE [Trade2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade2', FILENAME = N'F:\programs\SQL_DATA\Trade2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade2_log', FILENAME = N'F:\programs\SQL_DATA\Trade2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade2] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade2] SET  MULTI_USER 
GO
ALTER DATABASE [Trade2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade2', N'ON'
GO
ALTER DATABASE [Trade2] SET QUERY_STORE = OFF
GO
USE [Trade2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturerID] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD533B062CE] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 05.04.2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Вилки')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Ложки')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Наборы')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Ножи')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'Davinci')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'Attribute')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'Doria')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (4, N'Alaska')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (5, N'Apollo')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (6, N'Smart Home')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (7, N'Mayer & Boch')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (1, N'Завершен', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'344288, г. Талнах, ул. Чехова, 1
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (2, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'603002, г. Талнах, ул. Дзержинского, 28
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (3, N'Новый ', CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'614164, г.Талнах,  ул. Степная, 30
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (4, N'Новый ', CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'410542, г. Талнах, ул. Светлая, 46
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (5, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'614164, г.Талнах,  ул. Степная, 30
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (6, N'Новый ', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'420151, г. Талнах, ул. Вишневая, 32
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (7, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'394242, г. Талнах, ул. Коммунистическая, 43
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (8, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'426030, г. Талнах, ул. Маяковского, 44
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (9, N'Новый ', CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'125837, г. Талнах, ул. Шоссейная, 40
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (10, N'Новый ', CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'190949, г. Талнах, ул. Мичурина, 26
')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (11, N'Завершен', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'344288, г. Талнах, ул. Чехова, 1')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (12, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'603002, г. Талнах, ул. Дзержинского, 28')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (13, N'Новый ', CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'614164, г.Талнах,  ул. Степная, 30')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (14, N'Новый ', CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'410542, г. Талнах, ул. Светлая, 46')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (15, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'614164, г.Талнах,  ул. Степная, 30')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (16, N'Новый ', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'420151, г. Талнах, ул. Вишневая, 32')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (17, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'394242, г. Талнах, ул. Коммунистическая, 43')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (18, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'426030, г. Талнах, ул. Маяковского, 44')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (19, N'Новый ', CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'125837, г. Талнах, ул. Шоссейная, 40')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (20, N'Новый ', CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'190949, г. Талнах, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'А112Т4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'G387Y6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'D735T5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'H384H3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'E732R7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'F839R6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'C430T4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'V403G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'V026J4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'C635Y6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (11, N'T793T4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (12, N'F573T5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (13, N'B736H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (14, N'K437E6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (15, N'R836H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (16, N'G304H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (17, N'C946Y6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (18, N'B963H5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (19, N'V727Y6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (20, N'W405G6')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B736H6', N'Вилка столовая', N'Вилка столовая 21,2 см «Аляска бэйсик» сталь KunstWerk', 1, NULL, 4, CAST(220.0000 AS Decimal(19, 4)), 5, 4, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B963H5', N'Ложка', N'Ложка 21 мм металлическая (медная) (Упаковка 10 шт)', 2, NULL, 6, CAST(800.0000 AS Decimal(19, 4)), 5, 8, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C430T4', N'Набор на одну персону', N'Набор на одну персону (4 предмета) серия "Bistro", нерж. сталь, Was, Германия.', 3, NULL, 2, CAST(1600.0000 AS Decimal(19, 4)), 30, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C635Y6', N'Детский столовый набор', N'Детский столовый набор Fissman «Зебра» ', 3, NULL, 5, CAST(1000.0000 AS Decimal(19, 4)), 15, 25, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C730R7', N'Ложка детская', N'Ложка детская столовая', 2, NULL, 6, CAST(300.0000 AS Decimal(19, 4)), 5, 17, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C943G5', N'Набор чайных ложек', N'Attribute Набор чайных ложек Baguette 3 предмета серебристый', 3, NULL, 2, CAST(200.0000 AS Decimal(19, 4)), 5, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C946Y6', N'Вилка столовая', N'Вилка детская столовая', 1, NULL, 5, CAST(300.0000 AS Decimal(19, 4)), 15, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D735T5', N'Ложка чайная', N'Ложка чайная ALASKA Eternum', 2, NULL, 4, CAST(220.0000 AS Decimal(19, 4)), 5, 13, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E732R7', N'Набор столовых приборов', N'Набор столовых приборов Smart Home20 Black в подарочной коробке, 4 шт', 3, NULL, 6, CAST(990.0000 AS Decimal(19, 4)), 15, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F392G6', N'Набор столовых приборов', N'Apollo Набор столовых приборов Chicago 4 предмета серебристый', 3, NULL, 5, CAST(490.0000 AS Decimal(19, 4)), 10, 9, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F573T5', N'Вилки столовые', N'Вилки столовые на блистере / 6 шт.', 1, NULL, 1, CAST(650.0000 AS Decimal(19, 4)), 15, 4, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F745K4', N'Столовые приборы для салата', N'Столовые приборы для салата Orskov Lava, 2шт', 3, NULL, 7, CAST(2000.0000 AS Decimal(19, 4)), 10, 2, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F839R6', N'Ложка чайная', N'Ложка чайная DORIA Eternum', 2, NULL, 3, CAST(400.0000 AS Decimal(19, 4)), 15, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G304H6', N'Набор ложек', N'Набор ложек столовых APOLLO "Bohemica" 3 пр.', 2, NULL, 5, CAST(500.0000 AS Decimal(19, 4)), 5, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G387Y6', N'Ложка столовая', N'Ложка столовая DORIA L=195/60 мм Eternum', 2, NULL, 3, CAST(441.0000 AS Decimal(19, 4)), 5, 23, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H384H3', N'Набор столовых приборов', N'Набор столовых приборов для торта Palette 7 предметов серебристый', 3, NULL, 5, CAST(600.0000 AS Decimal(19, 4)), 15, 9, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H495H6', N'Набор стейковых ножей', N'Набор стейковых ножей 4 пр. в деревянной коробке', 4, NULL, 7, CAST(7000.0000 AS Decimal(19, 4)), 15, 15, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K437E6', N'Набор вилок', N'Набор вилок столовых APOLLO "Aurora" 3шт.', 3, NULL, 5, CAST(530.0000 AS Decimal(19, 4)), 5, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L593H5', N'набор ножей', N'Набор ножей Mayer & Boch, 4 шт', 3, NULL, 6, CAST(1300.0000 AS Decimal(19, 4)), 25, 14, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N493G6', N'Набор для серверовки', N'Набор для сервировки сыра Select', 3, NULL, 6, CAST(2550.0000 AS Decimal(19, 4)), 15, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R836H6', N'Набор  столовых ножей', N'Attribute Набор столовых ножей Baguette 2 предмета серебристый', 4, NULL, 2, CAST(250.0000 AS Decimal(19, 4)), 5, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S394J5', N'Набор чайных ложек', N'Attribute Набор чайных ложек Chaplet 3 предмета серебристый', 3, NULL, 2, CAST(170.0000 AS Decimal(19, 4)), 5, 4, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S395B5', N'Нож для стейка', N'Нож для стейка 11,5 см серебристый/черный', 4, NULL, 5, CAST(600.0000 AS Decimal(19, 4)), 10, 15, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'T793T4', N'Набор ложек', N'Набор столовых ложек Baguette 3 предмета серебристый', 2, NULL, 2, CAST(250.0000 AS Decimal(19, 4)), 10, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V026J4', N'набор ножей', N'абор ножей для стейка и пиццы Swiss classic 2 шт. желтый', 3, NULL, 5, CAST(700.0000 AS Decimal(19, 4)), 15, 9, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V403G6', N'Ложка чайная', N'Ложка чайная DORIA Eternum', 2, NULL, 3, CAST(600.0000 AS Decimal(19, 4)), 15, 24, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V727Y6', N'Набор десертных ложек', N'Набор десертных ложек на подставке Размер: 7*7*15 см', 2, NULL, 7, CAST(3000.0000 AS Decimal(19, 4)), 10, 8, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'W295Y5', N'Сервировочный набор для торта', N'Набор сервировочный для торта "Розанна"', 3, NULL, 2, CAST(1100.0000 AS Decimal(19, 4)), 15, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'W405G6', N'Набор столовых приборов', N'Набор сервировочных столовых вилок Цветы', 3, NULL, 2, CAST(1300.0000 AS Decimal(19, 4)), 25, 4, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryID], [ProductPhoto], [ProductManufacturerID], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Набор вилок', N'Набор столовых вилок Davinci, 20 см 6 шт.', 1, NULL, 1, CAST(1600.0000 AS Decimal(19, 4)), 30, 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент
')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Савицкая', N'Арина', N'Саввична', N'1y3lj8w0viop@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Мартынов', N'Максим', N'Михайлович', N'3o698uk5c0rw@tutanota.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Зубов', N'Александр', N'Дамирович', N'lx24fvrt1aip@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Попов', N'Даниил', N'Олегович', N's8z076vku95j@gmail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Семенов', N'Михаил', N'Никитич', N'n3bxm7f2q5i4@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Дмитриева', N'Надежда', N'Вячеславовна', N'r7dztn8a5ihq@mail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Воронцова', N'Виктория', N'Саввична', N'vofgck2m39hq@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Софронов', N'Ярослав', N'Игоревич', N's6q9tevybado@yahoo.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Егоров', N'Артём', N'Евгеньевич', N'p7wuls3dtq9v@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Ситникова', N'Эмилия', N'Степановна', N'rdn04s1u2ckb@mail.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade2] SET  READ_WRITE 
GO
