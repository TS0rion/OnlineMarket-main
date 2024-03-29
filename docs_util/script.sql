USE [master]
GO
/****** Object:  Database [Online]    Script Date: 17/1/2024 10:33:12 AM ******/
CREATE DATABASE [Online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Online.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Online_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Online] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online] SET  MULTI_USER 
GO
ALTER DATABASE [Online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Online] SET QUERY_STORE = ON
GO
ALTER DATABASE [Online] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Online]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] NOT NULL,
	[AreaName] [varchar](100) NOT NULL,
	[StoreId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] NOT NULL,
	[BrandName] [varchar](50) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[StoreQuantity] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingId] [int] NOT NULL,
	[BuildingName] [varchar](50) NOT NULL,
	[Coordinates] [varchar](100) NOT NULL,
	[AreaId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignVoucher]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignVoucher](
	[CampaignVoucherId] [int] NOT NULL,
	[NameCampaign] [varchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[QuantityVoucher] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[BrandId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CampaignVoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[BuildingId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[CustomerOrderId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Status] [char](1) NOT NULL,
	[PayingStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderActivity]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderActivity](
	[OrderActivityId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Origin] [varchar](50) NOT NULL,
	[MfgDate] [date] NOT NULL,
	[ExpDate] [date] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCate]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCate](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [varchar](80) NOT NULL,
	[CreatedAt] [date] NOT NULL,
	[UpdateAt] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInStore]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInStore](
	[ProductInStoreId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Remaining] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductInStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[AreaId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] NOT NULL,
	[Address] [varchar](70) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[StoreDescription] [varchar](500) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Coordinates] [varchar](100) NOT NULL,
	[BrandId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Date] [date] NOT NULL,
	[WalletId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherId] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Expired] [date] NOT NULL,
	[CampaignVoucherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 17/1/2024 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[WalletId] [int] NOT NULL,
	[Balance] [int] NOT NULL,
	[Type] [varchar](1) NOT NULL,
	[Status] [char](1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[CampaignVoucher]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([BuildingId])
GO
ALTER TABLE [dbo].[OrderActivity]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[CustomerOrder] ([CustomerOrderId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCate] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductInStore]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductInStore]  WITH CHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[CustomerOrder] ([CustomerOrderId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shipper] ([ShipperId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallet] ([WalletId])
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD FOREIGN KEY([CampaignVoucherId])
REFERENCES [dbo].[CampaignVoucher] ([CampaignVoucherId])
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shipper] ([ShipperId])
GO
USE [master]
GO
ALTER DATABASE [Online] SET  READ_WRITE 
GO
