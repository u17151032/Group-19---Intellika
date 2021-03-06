USE [master]
GO
/****** Object:  Database [InternetServices]    Script Date: 03/09/2020 02:34:22 ******/
CREATE DATABASE [InternetServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternetServices', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InternetServices.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InternetServices_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InternetServices_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InternetServices] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternetServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternetServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InternetServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InternetServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InternetServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InternetServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [InternetServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InternetServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternetServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternetServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternetServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InternetServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InternetServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternetServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InternetServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternetServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InternetServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternetServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternetServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternetServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternetServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternetServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternetServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternetServices] SET RECOVERY FULL 
GO
ALTER DATABASE [InternetServices] SET  MULTI_USER 
GO
ALTER DATABASE [InternetServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InternetServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternetServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternetServices] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InternetServices] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InternetServices', N'ON'
GO
USE [InternetServices]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StreetNumber] [int] NULL,
	[StreetName] [varchar](50) NULL,
	[SuburbID] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChargeItem]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChargeItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ChargeItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consumer]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consumer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ID_Number] [int] NULL,
	[Cell_Number] [int] NULL,
	[Gender] [char](10) NULL,
	[UserID] [int] NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [PK_Consumer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Function]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Function](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[AdminID] [int] NULL,
	[ConsID] [int] NULL,
	[SP_ID] [int] NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Attachment] [image] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Material]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](50) NULL,
	[Time] [datetime] NULL,
	[SO_ID] [int] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Province]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [int] NULL,
	[Comment] [varchar](150) NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Decription] [varchar](50) NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service_SP]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_SP](
	[SP_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_Utility]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Utility](
	[Utility_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceOrder]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SO_Status_ID] [int] NOT NULL,
	[SQ_ID] [int] NOT NULL,
 CONSTRAINT [PK_ServiceOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceOrderLine]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrderLine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SO_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL,
	[SQ_ID] [int] NULL,
	[SQL_ID] [int] NULL,
	[Material_ID] [int] NULL,
 CONSTRAINT [PK_ServiceOrderLine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceProvider]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceProvider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[BusinessName] [varchar](50) NULL,
	[AverageRating] [int] NULL,
	[ID_Number] [int] NULL,
	[Gender] [nchar](10) NULL,
	[SP_Status_ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceQuote]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceQuote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AddtionalDetails] [varchar](50) NULL,
	[SQ_Status_ID] [int] NULL,
	[PaymentMethod_ID] [int] NULL,
 CONSTRAINT [PK_ServiceQuote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceQuoteStatus]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceQuoteStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_ServiceQuoteStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](10) NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[ConsID] [int] NULL,
	[SR_Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SO_Rating]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SO_Rating](
	[Rating_ID] [int] NOT NULL,
	[SO_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SO_Status]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SO_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SO_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SP_Application]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_Application](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_FrontBack] [image] NOT NULL,
	[SP_ID] [int] NOT NULL,
	[SPA_Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_SP_Application] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SP_Application_Status]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SP_Application_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SP_Application_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SP_SR]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_SR](
	[SP_ID] [int] NULL,
	[SR_ID] [int] NULL,
	[SQ_ID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SP_Status]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SP_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SP_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SQ_Line]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQ_Line](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[SQ_ID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[ChargeItem_ID] [int] NOT NULL,
	[SRL_ID] [int] NULL,
 CONSTRAINT [PK_SQ_Line] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SR_Line]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SR_Line](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Service_ID] [int] NOT NULL,
	[SR_ID] [int] NOT NULL,
	[Image_ID] [int] NOT NULL,
 CONSTRAINT [PK_SR_Line] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SR_Status]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SR_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SR_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Surburb]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Surburb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_Surburb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](75) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PowerSalt] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Utility]    Script Date: 03/09/2020 02:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utility](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NULL,
 CONSTRAINT [PK_Utility] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Surburb] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[Surburb] ([ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Surburb]
GO
ALTER TABLE [dbo].[ChargeItem]  WITH CHECK ADD  CONSTRAINT [FK_ChargeItem_ItemType] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[ItemType] ([ID])
GO
ALTER TABLE [dbo].[ChargeItem] CHECK CONSTRAINT [FK_ChargeItem_ItemType]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Province]
GO
ALTER TABLE [dbo].[Consumer]  WITH CHECK ADD  CONSTRAINT [FK_Consumer_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Consumer] CHECK CONSTRAINT [FK_Consumer_Address]
GO
ALTER TABLE [dbo].[Consumer]  WITH CHECK ADD  CONSTRAINT [FK_Consumer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Consumer] CHECK CONSTRAINT [FK_Consumer_User]
GO
ALTER TABLE [dbo].[Function]  WITH CHECK ADD  CONSTRAINT [FK_Function_Admin] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[Function] CHECK CONSTRAINT [FK_Function_Admin]
GO
ALTER TABLE [dbo].[Function]  WITH CHECK ADD  CONSTRAINT [FK_Function_Consumer] FOREIGN KEY([ConsID])
REFERENCES [dbo].[Consumer] ([ID])
GO
ALTER TABLE [dbo].[Function] CHECK CONSTRAINT [FK_Function_Consumer]
GO
ALTER TABLE [dbo].[Function]  WITH CHECK ADD  CONSTRAINT [FK_Function_ServiceProvider] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[ServiceProvider] ([ID])
GO
ALTER TABLE [dbo].[Function] CHECK CONSTRAINT [FK_Function_ServiceProvider]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_ServiceOrder] FOREIGN KEY([SO_ID])
REFERENCES [dbo].[ServiceOrder] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_ServiceOrder]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [FK_Province_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [FK_Province_Country]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
ALTER TABLE [dbo].[Service_SP]  WITH CHECK ADD  CONSTRAINT [FK_Service_SP_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Service_SP] CHECK CONSTRAINT [FK_Service_SP_Service]
GO
ALTER TABLE [dbo].[Service_SP]  WITH CHECK ADD  CONSTRAINT [FK_Service_SP_ServiceProvider] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[ServiceProvider] ([ID])
GO
ALTER TABLE [dbo].[Service_SP] CHECK CONSTRAINT [FK_Service_SP_ServiceProvider]
GO
ALTER TABLE [dbo].[Service_Utility]  WITH CHECK ADD  CONSTRAINT [FK_Service_Utility_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Service_Utility] CHECK CONSTRAINT [FK_Service_Utility_Service]
GO
ALTER TABLE [dbo].[Service_Utility]  WITH CHECK ADD  CONSTRAINT [FK_Service_Utility_Utility] FOREIGN KEY([Utility_ID])
REFERENCES [dbo].[Utility] ([ID])
GO
ALTER TABLE [dbo].[Service_Utility] CHECK CONSTRAINT [FK_Service_Utility_Utility]
GO
ALTER TABLE [dbo].[ServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrder_ServiceQuote] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceQuote] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrder] CHECK CONSTRAINT [FK_ServiceOrder_ServiceQuote]
GO
ALTER TABLE [dbo].[ServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrder_SO_Status] FOREIGN KEY([SO_Status_ID])
REFERENCES [dbo].[SO_Status] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrder] CHECK CONSTRAINT [FK_ServiceOrder_SO_Status]
GO
ALTER TABLE [dbo].[ServiceOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrderLine_Material] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrderLine] CHECK CONSTRAINT [FK_ServiceOrderLine_Material]
GO
ALTER TABLE [dbo].[ServiceOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrderLine_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrderLine] CHECK CONSTRAINT [FK_ServiceOrderLine_Service]
GO
ALTER TABLE [dbo].[ServiceOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrderLine_ServiceOrder] FOREIGN KEY([SO_ID])
REFERENCES [dbo].[ServiceOrder] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrderLine] CHECK CONSTRAINT [FK_ServiceOrderLine_ServiceOrder]
GO
ALTER TABLE [dbo].[ServiceOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrderLine_ServiceQuote] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceQuote] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrderLine] CHECK CONSTRAINT [FK_ServiceOrderLine_ServiceQuote]
GO
ALTER TABLE [dbo].[ServiceOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrderLine_SQ_Line] FOREIGN KEY([SQL_ID])
REFERENCES [dbo].[SQ_Line] ([ID])
GO
ALTER TABLE [dbo].[ServiceOrderLine] CHECK CONSTRAINT [FK_ServiceOrderLine_SQ_Line]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_SP_Status] FOREIGN KEY([SP_Status_ID])
REFERENCES [dbo].[SP_Status] ([ID])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_SP_Status]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_User]
GO
ALTER TABLE [dbo].[ServiceQuote]  WITH CHECK ADD  CONSTRAINT [FK_ServiceQuote_ServiceQuoteStatus] FOREIGN KEY([SQ_Status_ID])
REFERENCES [dbo].[ServiceQuoteStatus] ([ID])
GO
ALTER TABLE [dbo].[ServiceQuote] CHECK CONSTRAINT [FK_ServiceQuote_ServiceQuoteStatus]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_Consumer] FOREIGN KEY([ConsID])
REFERENCES [dbo].[Consumer] ([ID])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_Consumer]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_SR_Status] FOREIGN KEY([SR_Status_ID])
REFERENCES [dbo].[SR_Status] ([ID])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_SR_Status]
GO
ALTER TABLE [dbo].[SO_Rating]  WITH CHECK ADD  CONSTRAINT [FK_SO_Rating_Rating] FOREIGN KEY([Rating_ID])
REFERENCES [dbo].[Rating] ([ID])
GO
ALTER TABLE [dbo].[SO_Rating] CHECK CONSTRAINT [FK_SO_Rating_Rating]
GO
ALTER TABLE [dbo].[SO_Rating]  WITH CHECK ADD  CONSTRAINT [FK_SO_Rating_ServiceOrder] FOREIGN KEY([SO_ID])
REFERENCES [dbo].[ServiceOrder] ([ID])
GO
ALTER TABLE [dbo].[SO_Rating] CHECK CONSTRAINT [FK_SO_Rating_ServiceOrder]
GO
ALTER TABLE [dbo].[SP_Application]  WITH CHECK ADD  CONSTRAINT [FK_SP_Application_ServiceProvider] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[ServiceProvider] ([ID])
GO
ALTER TABLE [dbo].[SP_Application] CHECK CONSTRAINT [FK_SP_Application_ServiceProvider]
GO
ALTER TABLE [dbo].[SP_Application]  WITH CHECK ADD  CONSTRAINT [FK_SP_Application_SP_Application_Status] FOREIGN KEY([SPA_Status_ID])
REFERENCES [dbo].[SP_Application_Status] ([ID])
GO
ALTER TABLE [dbo].[SP_Application] CHECK CONSTRAINT [FK_SP_Application_SP_Application_Status]
GO
ALTER TABLE [dbo].[SP_SR]  WITH CHECK ADD  CONSTRAINT [FK_SP_SR_ServiceProvider] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[ServiceProvider] ([ID])
GO
ALTER TABLE [dbo].[SP_SR] CHECK CONSTRAINT [FK_SP_SR_ServiceProvider]
GO
ALTER TABLE [dbo].[SP_SR]  WITH CHECK ADD  CONSTRAINT [FK_SP_SR_ServiceQuote] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceQuote] ([ID])
GO
ALTER TABLE [dbo].[SP_SR] CHECK CONSTRAINT [FK_SP_SR_ServiceQuote]
GO
ALTER TABLE [dbo].[SP_SR]  WITH CHECK ADD  CONSTRAINT [FK_SP_SR_ServiceRequest] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceRequest] ([ID])
GO
ALTER TABLE [dbo].[SP_SR] CHECK CONSTRAINT [FK_SP_SR_ServiceRequest]
GO
ALTER TABLE [dbo].[SQ_Line]  WITH CHECK ADD  CONSTRAINT [FK_SQ_Line_ChargeItem] FOREIGN KEY([ChargeItem_ID])
REFERENCES [dbo].[ChargeItem] ([ID])
GO
ALTER TABLE [dbo].[SQ_Line] CHECK CONSTRAINT [FK_SQ_Line_ChargeItem]
GO
ALTER TABLE [dbo].[SQ_Line]  WITH CHECK ADD  CONSTRAINT [FK_SQ_Line_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[SQ_Line] CHECK CONSTRAINT [FK_SQ_Line_Service]
GO
ALTER TABLE [dbo].[SQ_Line]  WITH CHECK ADD  CONSTRAINT [FK_SQ_Line_ServiceQuote] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceQuote] ([ID])
GO
ALTER TABLE [dbo].[SQ_Line] CHECK CONSTRAINT [FK_SQ_Line_ServiceQuote]
GO
ALTER TABLE [dbo].[SQ_Line]  WITH CHECK ADD  CONSTRAINT [FK_SQ_Line_ServiceQuote1] FOREIGN KEY([SQ_ID])
REFERENCES [dbo].[ServiceQuote] ([ID])
GO
ALTER TABLE [dbo].[SQ_Line] CHECK CONSTRAINT [FK_SQ_Line_ServiceQuote1]
GO
ALTER TABLE [dbo].[SQ_Line]  WITH CHECK ADD  CONSTRAINT [FK_SQ_Line_SR_Line] FOREIGN KEY([SRL_ID])
REFERENCES [dbo].[SR_Line] ([ID])
GO
ALTER TABLE [dbo].[SQ_Line] CHECK CONSTRAINT [FK_SQ_Line_SR_Line]
GO
ALTER TABLE [dbo].[SR_Line]  WITH CHECK ADD  CONSTRAINT [FK_SR_Line_Image] FOREIGN KEY([Image_ID])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[SR_Line] CHECK CONSTRAINT [FK_SR_Line_Image]
GO
ALTER TABLE [dbo].[SR_Line]  WITH CHECK ADD  CONSTRAINT [FK_SR_Line_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[SR_Line] CHECK CONSTRAINT [FK_SR_Line_Service]
GO
ALTER TABLE [dbo].[SR_Line]  WITH CHECK ADD  CONSTRAINT [FK_SR_Line_ServiceRequest] FOREIGN KEY([SR_ID])
REFERENCES [dbo].[ServiceRequest] ([ID])
GO
ALTER TABLE [dbo].[SR_Line] CHECK CONSTRAINT [FK_SR_Line_ServiceRequest]
GO
ALTER TABLE [dbo].[Surburb]  WITH CHECK ADD  CONSTRAINT [FK_Surburb_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Surburb] CHECK CONSTRAINT [FK_Surburb_City]
GO
USE [master]
GO
ALTER DATABASE [InternetServices] SET  READ_WRITE 
GO
