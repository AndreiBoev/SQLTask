USE [master]
GO
/****** Object:  Database [MindboxBase]    Script Date: 27.04.2024 0:38:08 ******/
CREATE DATABASE [MindboxBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MindboxBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MindboxBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MindboxBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MindboxBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MindboxBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MindboxBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MindboxBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MindboxBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MindboxBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MindboxBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MindboxBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MindboxBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MindboxBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MindboxBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MindboxBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MindboxBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MindboxBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MindboxBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MindboxBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MindboxBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MindboxBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MindboxBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MindboxBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MindboxBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MindboxBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MindboxBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MindboxBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MindboxBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MindboxBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MindboxBase] SET  MULTI_USER 
GO
ALTER DATABASE [MindboxBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MindboxBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MindboxBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MindboxBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MindboxBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MindboxBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MindboxBase] SET QUERY_STORE = OFF
GO
USE [MindboxBase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27.04.2024 0:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.04.2024 0:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOfCategory]    Script Date: 27.04.2024 0:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOfCategory](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductOfCategory] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOfCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductOfCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductOfCategory] CHECK CONSTRAINT [FK_ProductOfCategory_Category]
GO
ALTER TABLE [dbo].[ProductOfCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductOfCategory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductOfCategory] CHECK CONSTRAINT [FK_ProductOfCategory_Product]
GO
USE [master]
GO
ALTER DATABASE [MindboxBase] SET  READ_WRITE 
GO
