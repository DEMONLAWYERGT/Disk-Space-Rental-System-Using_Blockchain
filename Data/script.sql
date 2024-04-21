USE [master]
GO
/****** Object:  Database [Disk_Space]    Script Date: 22-Feb-24 18:35:50 ******/
CREATE DATABASE [Disk_Space]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Disk_Space', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Disk_Space.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Disk_Space_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Disk_Space_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Disk_Space] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Disk_Space].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Disk_Space] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Disk_Space] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Disk_Space] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Disk_Space] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Disk_Space] SET ARITHABORT OFF 
GO
ALTER DATABASE [Disk_Space] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Disk_Space] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Disk_Space] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Disk_Space] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Disk_Space] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Disk_Space] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Disk_Space] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Disk_Space] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Disk_Space] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Disk_Space] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Disk_Space] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Disk_Space] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Disk_Space] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Disk_Space] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Disk_Space] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Disk_Space] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Disk_Space] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Disk_Space] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Disk_Space] SET  MULTI_USER 
GO
ALTER DATABASE [Disk_Space] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Disk_Space] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Disk_Space] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Disk_Space] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Disk_Space] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Disk_Space] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Disk_Space] SET QUERY_STORE = OFF
GO
USE [Disk_Space]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 22-Feb-24 18:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HardDisks]    Script Date: 22-Feb-24 18:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HardDisks](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[HardDisk] [nchar](10) NULL,
	[Storage] [nchar](10) NULL,
	[Duration] [nchar](10) NULL,
	[Date] [nchar](10) NULL,
	[RegNo] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[RentSpace] [varchar](100) NULL,
 CONSTRAINT [PK_HardDisks] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentHDDetails]    Script Date: 22-Feb-24 18:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentHDDetails](
	[SrNo] [int] IDENTITY(1001,1) NOT NULL,
	[HdsrNo] [varchar](500) NULL,
	[RentSpace] [varchar](500) NULL,
	[RentDuration] [varchar](500) NULL,
	[RentUser] [varchar](500) NULL,
	[StartDate] [varchar](500) NULL,
	[EndDate] [varchar](500) NULL,
 CONSTRAINT [PK_RentHDDetails] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 22-Feb-24 18:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Space] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[Cost] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[CVV] [varchar](50) NULL,
	[Datetime] [varchar](50) NULL,
	[PreviousHash] [varchar](max) NULL,
	[CurrentHash] [varchar](max) NULL,
	[RegNo] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[AssignDate] [varchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-Feb-24 18:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[RegNo] [int] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[PrfImage] [varchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'admin', N'admin')
GO
SET IDENTITY_INSERT [dbo].[HardDisks] ON 

INSERT [dbo].[HardDisks] ([SrNo], [HardDisk], [Storage], [Duration], [Date], [RegNo], [Status], [RentSpace]) VALUES (1, N'h drive   ', N'40        ', N'5         ', N'2024-02-17', N'101', N'Accepted', N'60')
INSERT [dbo].[HardDisks] ([SrNo], [HardDisk], [Storage], [Duration], [Date], [RegNo], [Status], [RentSpace]) VALUES (2, N'f drive   ', N'200       ', N'6         ', N'2024-02-17', N'101', N'Accepted', N'0')
INSERT [dbo].[HardDisks] ([SrNo], [HardDisk], [Storage], [Duration], [Date], [RegNo], [Status], [RentSpace]) VALUES (3, N'd drive   ', N'350       ', N'4         ', N'2024-02-18', N'101', N'Accepted', N'0')
INSERT [dbo].[HardDisks] ([SrNo], [HardDisk], [Storage], [Duration], [Date], [RegNo], [Status], [RentSpace]) VALUES (4, N'd drive   ', N'500       ', N'8         ', N'2024-02-21', N'102', N'Accepted', N'0')
SET IDENTITY_INSERT [dbo].[HardDisks] OFF
GO
SET IDENTITY_INSERT [dbo].[RentHDDetails] ON 

INSERT [dbo].[RentHDDetails] ([SrNo], [HdsrNo], [RentSpace], [RentDuration], [RentUser], [StartDate], [EndDate]) VALUES (1001, N'1', N'50', N'3', N'102', N'2024/02/22 15:29:28', N'2024/04/22 15:29:28')
INSERT [dbo].[RentHDDetails] ([SrNo], [HdsrNo], [RentSpace], [RentDuration], [RentUser], [StartDate], [EndDate]) VALUES (1002, N'1', N'10', N'1', N'102', N'2024/02/22 18:31:36', N'2024/04/22 18:31:36')
SET IDENTITY_INSERT [dbo].[RentHDDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([SrNo], [Space], [Duration], [Cost], [CardNo], [CVV], [Datetime], [PreviousHash], [CurrentHash], [RegNo], [status], [AssignDate]) VALUES (1, N'50', N'3', N'2500', N'1436000001247036', N'111', N'2024/02/22 15:29:07', N'Genesis', N'550723DA5C5692990101C18CCB3653726CED420189E2460014622594C7280EF2C335FF57922A2CDC3E122F89893F5958634B6909A82CFD5AE8294ACEA2D3018F', N'102', N'Assigned', N'2024/02/22 15:29:28')
INSERT [dbo].[Transactions] ([SrNo], [Space], [Duration], [Cost], [CardNo], [CVV], [Datetime], [PreviousHash], [CurrentHash], [RegNo], [status], [AssignDate]) VALUES (2, N'10', N'1', N'500', N'1436000001247036', N'111', N'2024/02/22 15:30:09', N'550723DA5C5692990101C18CCB3653726CED420189E2460014622594C7280EF2C335FF57922A2CDC3E122F89893F5958634B6909A82CFD5AE8294ACEA2D3018F', N'B7FE28B887456A5A8974B348D6DC380168A43BF605B7A51F6A76D09D6E3967DD8ED7DAFA52E7F7E5CD92F859634C51C0BDF40693803B74208C58EEA6E963AE7D', N'102', N'Assigned', N'2024/02/22 18:31:36')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([RegNo], [Name], [MobileNo], [EmailId], [Password], [PrfImage]) VALUES (101, N'Mayuri Patil', N'9632587414', N'mayuri12@gmail.com', N'12345', NULL)
INSERT [dbo].[Users] ([RegNo], [Name], [MobileNo], [EmailId], [Password], [PrfImage]) VALUES (102, N'Jija Mane', N'9874563214', N'jijam12@gmail.com', N'1234', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [Disk_Space] SET  READ_WRITE 
GO
