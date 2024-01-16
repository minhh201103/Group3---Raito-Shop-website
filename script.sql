USE [master]
GO
/****** Object:  Database [SWP391_Project_SQLShoes]    Script Date: 1/16/2024 5:05:31 PM ******/
CREATE DATABASE [SWP391_Project_SQLShoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_Project_SQLShoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP391_Project_SQLShoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_Project_SQLShoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP391_Project_SQLShoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_SQLShoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_Project_SQLShoes', N'ON'
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET QUERY_STORE = OFF
GO
USE [SWP391_Project_SQLShoes]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[role] [int] NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[userImage] [varchar](max) NULL,
	[lastLogin] [date] NULL,
	[createDate] [date] NOT NULL,
	[status] [int] NULL,
	[customerId] [int] NULL,
	[employeeId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[blogContent] [nvarchar](255) NOT NULL,
	[blogImage] [nvarchar](max) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
	[employeeId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](50) NULL,
	[brandDescription] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[categoryDescription] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](12) NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[employeeName] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[hireDate] [date] NOT NULL,
	[salary] [int] NOT NULL,
	[birthDate] [date] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[productId] [int] NOT NULL,
	[feedbackDescription] [nvarchar](255) NOT NULL,
	[customerId] [int] NOT NULL,
	[rating] [float] NULL,
	[createDate] [date] NOT NULL,
	[feedbackImage] [nvarchar](max) NULL,
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBillDetails]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBillDetails](
	[importDetailId] [int] IDENTITY(1,1) NOT NULL,
	[importId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [nchar](10) NOT NULL,
	[unitPrice] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ImportBillDetails] PRIMARY KEY CLUSTERED 
(
	[importDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBills]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBills](
	[importId] [int] IDENTITY(1,1) NOT NULL,
	[employeeId] [int] NOT NULL,
	[deliveryName] [nvarchar](50) NOT NULL,
	[deliveryPhone] [varchar](10) NOT NULL,
	[totalMoney] [int] NOT NULL,
	[deliverDate] [date] NOT NULL,
	[providerId] [int] NOT NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK_ImportBills] PRIMARY KEY CLUSTERED 
(
	[importId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[acceptedDate] [date] NULL,
	[shippedDate] [date] NULL,
	[address] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[productDescription] [nvarchar](255) NOT NULL,
	[unitPrice] [int] NOT NULL,
	[productImage] [varchar](max) NOT NULL,
	[totalQuantity] [int] NOT NULL,
	[quantitySold] [int] NOT NULL,
	[discountPercentage] [int] NOT NULL,
	[status] [int] NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[productId] [int] NOT NULL,
	[sizeId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[sizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[providerId] [int] IDENTITY(1,1) NOT NULL,
	[providerName] [nvarchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[note] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Replies]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replies](
	[replyId] [int] IDENTITY(1,1) NOT NULL,
	[feedbackId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[reply] [nvarchar](255) NOT NULL,
	[createDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 1/16/2024 5:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[sizeId] [int] IDENTITY(1,1) NOT NULL,
	[size] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[sizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Employees]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Employees]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Customers]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Products]
GO
ALTER TABLE [dbo].[ImportBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetails_ImportBills] FOREIGN KEY([importId])
REFERENCES [dbo].[ImportBills] ([importId])
GO
ALTER TABLE [dbo].[ImportBillDetails] CHECK CONSTRAINT [FK_ImportBillDetails_ImportBills]
GO
ALTER TABLE [dbo].[ImportBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetails_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[ImportBillDetails] CHECK CONSTRAINT [FK_ImportBillDetails_Products]
GO
ALTER TABLE [dbo].[ImportBills]  WITH CHECK ADD  CONSTRAINT [FK_ImportBills_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[ImportBills] CHECK CONSTRAINT [FK_ImportBills_Employees]
GO
ALTER TABLE [dbo].[ImportBills]  WITH CHECK ADD  CONSTRAINT [FK_ImportBills_Providers] FOREIGN KEY([providerId])
REFERENCES [dbo].[Providers] ([providerId])
GO
ALTER TABLE [dbo].[ImportBills] CHECK CONSTRAINT [FK_ImportBills_Providers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetails_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetails_Orders]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetails_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetails_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([brandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Products]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Size] FOREIGN KEY([sizeId])
REFERENCES [dbo].[Size] ([sizeId])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Size]
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD  CONSTRAINT [FK_Replies_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[Replies] CHECK CONSTRAINT [FK_Replies_Employees]
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD  CONSTRAINT [FK_Replies_Feedbacks] FOREIGN KEY([feedbackId])
REFERENCES [dbo].[Feedbacks] ([feedbackId])
GO
ALTER TABLE [dbo].[Replies] CHECK CONSTRAINT [FK_Replies_Feedbacks]
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project_SQLShoes] SET  READ_WRITE 
GO
