USE [master]
GO
/****** Object:  Database [TEST3]    Script Date: 14.03.2024 0:52:50 ******/
CREATE DATABASE [TEST3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TEST3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST3] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TEST3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST3] SET RECOVERY FULL 
GO
ALTER DATABASE [TEST3] SET  MULTI_USER 
GO
ALTER DATABASE [TEST3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TEST3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TEST3', N'ON'
GO
ALTER DATABASE [TEST3] SET QUERY_STORE = ON
GO
ALTER DATABASE [TEST3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TEST3]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 14.03.2024 0:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 14.03.2024 0:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 14.03.2024 0:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Genre] [nvarchar](100) NULL,
	[ReleaseYear] [int] NULL,
	[SinglePlayerCount] [int] NULL,
	[MultiPlayerCount] [int] NULL,
	[SalesCount] [int] NULL,
	[StudioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 14.03.2024 0:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studios](
	[StudioID] [int] IDENTITY(1,1) NOT NULL,
	[StudioName] [nvarchar](100) NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'Los Angeles')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'Tokyo')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'London')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (1, N'USA')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (2, N'Japan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (3, N'UK')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([GameID], [Title], [Genre], [ReleaseYear], [SinglePlayerCount], [MultiPlayerCount], [SalesCount], [StudioID]) VALUES (1, N'Red Dead Redemption 2', N'Action-adventure', 2018, 1, 1, 25000000, 1)
INSERT [dbo].[Games] ([GameID], [Title], [Genre], [ReleaseYear], [SinglePlayerCount], [MultiPlayerCount], [SalesCount], [StudioID]) VALUES (2, N'The Legend of Zelda: Breath of the Wild', N'Action-adventure', 2017, 1, 0, 20000000, 2)
INSERT [dbo].[Games] ([GameID], [Title], [Genre], [ReleaseYear], [SinglePlayerCount], [MultiPlayerCount], [SalesCount], [StudioID]) VALUES (3, N'Batman: Arkham Knight', N'Action-adventure', 2015, 1, 0, 5000000, 3)
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Studios] ON 

INSERT [dbo].[Studios] ([StudioID], [StudioName], [CountryID], [CityID]) VALUES (1, N'Updated Studio', 2, 2)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [CountryID], [CityID]) VALUES (2, N'Nintendo', 2, 2)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [CountryID], [CityID]) VALUES (3, N'Rocksteady Studios', 3, 3)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [CountryID], [CityID]) VALUES (4, N'New Studio', 1, 1)
SET IDENTITY_INSERT [dbo].[Studios] OFF
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD FOREIGN KEY([StudioID])
REFERENCES [dbo].[Studios] ([StudioID])
GO
ALTER TABLE [dbo].[Studios]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Studios]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
USE [master]
GO
ALTER DATABASE [TEST3] SET  READ_WRITE 
GO
