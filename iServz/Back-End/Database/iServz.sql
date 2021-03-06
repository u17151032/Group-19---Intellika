USE [master]
GO
/****** Object:  Database [iServz]    Script Date: 2020/08/27 11:40:10 ******/
CREATE DATABASE [iServz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iServz', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\iServz.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'iServz_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\iServz_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [iServz] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iServz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iServz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iServz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iServz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iServz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iServz] SET ARITHABORT OFF 
GO
ALTER DATABASE [iServz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iServz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iServz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iServz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iServz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iServz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iServz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iServz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iServz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iServz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iServz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iServz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iServz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iServz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iServz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iServz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iServz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iServz] SET RECOVERY FULL 
GO
ALTER DATABASE [iServz] SET  MULTI_USER 
GO
ALTER DATABASE [iServz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iServz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iServz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iServz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [iServz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'iServz', N'ON'
GO
USE [iServz]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2020/08/27 11:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consumer]    Script Date: 2020/08/27 11:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Consumer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceProvider]    Script Date: 2020/08/27 11:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProvider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 2020/08/27 11:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[PasswordHash] [text] NULL,
	[PasswordSalt] [text] NULL,
	[Role] [text] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_USER]
GO
ALTER TABLE [dbo].[Consumer]  WITH CHECK ADD  CONSTRAINT [FK_Consumer_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[Consumer] CHECK CONSTRAINT [FK_Consumer_USER]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_USER]
GO
USE [master]
GO
ALTER DATABASE [iServz] SET  READ_WRITE 
GO
