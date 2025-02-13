USE [master]
GO
/****** Object:  Database [Factory Managment DB]    Script Date: 28/01/2021 17:24:09 ******/
CREATE DATABASE [Factory Managment DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Factory Managment DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Factory Managment DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Factory Managment DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Factory Managment DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Factory Managment DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Factory Managment DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Factory Managment DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Factory Managment DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Factory Managment DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Factory Managment DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Factory Managment DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Factory Managment DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Factory Managment DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Factory Managment DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Factory Managment DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Factory Managment DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Factory Managment DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Factory Managment DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Factory Managment DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Factory Managment DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Factory Managment DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Factory Managment DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Factory Managment DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Factory Managment DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Factory Managment DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Factory Managment DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Factory Managment DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Factory Managment DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Factory Managment DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Factory Managment DB] SET  MULTI_USER 
GO
ALTER DATABASE [Factory Managment DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Factory Managment DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Factory Managment DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Factory Managment DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Factory Managment DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Factory Managment DB] SET QUERY_STORE = OFF
GO
USE [Factory Managment DB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 28/01/2021 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manager_ID] [int] NOT NULL,
 CONSTRAINT [PK_Department table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28/01/2021 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Start_work_year] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
 CONSTRAINT [PK_Employee table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Shift]    Script Date: 28/01/2021 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Shift](
	[ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Shift_ID] [int] NOT NULL,
 CONSTRAINT [PK_Employee Shift ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 28/01/2021 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Start_time] [int] NOT NULL,
	[End_time] [int] NOT NULL,
 CONSTRAINT [PK_Shift table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28/01/2021 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[User_name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Num_of_actions] [int] NOT NULL,
	[Timestamp] [date] NULL,
 CONSTRAINT [PK_User table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([ID], [Name], [Manager_ID]) VALUES (1, N'General', 12)
INSERT [dbo].[Department] ([ID], [Name], [Manager_ID]) VALUES (2, N'Management', 13)
INSERT [dbo].[Department] ([ID], [Name], [Manager_ID]) VALUES (3, N'Sales', 14)
INSERT [dbo].[Department] ([ID], [Name], [Manager_ID]) VALUES (4, N'Marketing', 15)
GO
INSERT [dbo].[Employee] ([ID], [First_name], [Last_name], [Start_work_year], [Department_ID]) VALUES (11, N'Avi', N'Cohen', 2000, 1)
INSERT [dbo].[Employee] ([ID], [First_name], [Last_name], [Start_work_year], [Department_ID]) VALUES (12, N'Dana', N'Cohen', 2001, 1)
INSERT [dbo].[Employee] ([ID], [First_name], [Last_name], [Start_work_year], [Department_ID]) VALUES (13, N'Yossi', N'Levi', 2000, 1)
INSERT [dbo].[Employee] ([ID], [First_name], [Last_name], [Start_work_year], [Department_ID]) VALUES (14, N'Shaked', N'Lieber', 2000, 2)
INSERT [dbo].[Employee] ([ID], [First_name], [Last_name], [Start_work_year], [Department_ID]) VALUES (15, N'Lee', N'Blum', 2001, 2)
GO
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (1, 12, 20)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (2, 12, 23)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (3, 12, 26)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (4, 12, 30)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (5, 13, 21)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (6, 13, 24)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (7, 13, 27)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (8, 13, 31)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (9, 14, 22)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (10, 14, 25)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (11, 14, 28)
INSERT [dbo].[Employee_Shift] ([ID], [Employee_ID], [Shift_ID]) VALUES (12, 14, 32)
GO
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (20, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (21, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 15, 23)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (22, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 23, 7)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (23, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (24, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 15, 23)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (25, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 23, 7)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (26, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (27, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 15, 23)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (28, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 23, 7)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (30, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (31, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 15, 23)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (32, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 23, 7)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (33, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (34, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 15, 23)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (35, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 23, 7)
INSERT [dbo].[Shift] ([ID], [Date], [Start_time], [End_time]) VALUES (40, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 7, 23)
GO
INSERT [dbo].[User] ([ID], [Full_name], [User_name], [Password], [Num_of_actions], [Timestamp]) VALUES (1, N'Alex Ivlev', N'Alex1', N'Alex123', 20, NULL)
INSERT [dbo].[User] ([ID], [Full_name], [User_name], [Password], [Num_of_actions], [Timestamp]) VALUES (2, N'Almog Baku', N'Almog1', N'Almog123', 20, NULL)
INSERT [dbo].[User] ([ID], [Full_name], [User_name], [Password], [Num_of_actions], [Timestamp]) VALUES (3, N'Noa Buch', N'Noa1', N'Noa123', 20, NULL)
INSERT [dbo].[User] ([ID], [Full_name], [User_name], [Password], [Num_of_actions], [Timestamp]) VALUES (4, N'Melany Roco', N'Melany1', N'Melany123', 20, NULL)
INSERT [dbo].[User] ([ID], [Full_name], [User_name], [Password], [Num_of_actions], [Timestamp]) VALUES (5, N'Deni Aldea', N'Deni1', N'Deni123', 20, NULL)
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee_Shift]  WITH CHECK ADD FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Employee_Shift]  WITH CHECK ADD FOREIGN KEY([Shift_ID])
REFERENCES [dbo].[Shift] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Factory Managment DB] SET  READ_WRITE 
GO
