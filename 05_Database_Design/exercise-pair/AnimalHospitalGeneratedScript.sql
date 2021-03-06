USE [master]
GO
/****** Object:  Database [AnimalHospital]    Script Date: 6/14/2021 1:55:57 PM ******/
CREATE DATABASE [AnimalHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AnimalHospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AnimalHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AnimalHospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AnimalHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AnimalHospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AnimalHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AnimalHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AnimalHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AnimalHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AnimalHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AnimalHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [AnimalHospital] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AnimalHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AnimalHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AnimalHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AnimalHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AnimalHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AnimalHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AnimalHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AnimalHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AnimalHospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AnimalHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AnimalHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AnimalHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AnimalHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AnimalHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AnimalHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AnimalHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AnimalHospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AnimalHospital] SET  MULTI_USER 
GO
ALTER DATABASE [AnimalHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AnimalHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AnimalHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AnimalHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AnimalHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AnimalHospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AnimalHospital] SET QUERY_STORE = OFF
GO
USE [AnimalHospital]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StreetAdress] [nvarchar](64) NULL,
	[City] [nvarchar](64) NULL,
	[State] [nvarchar](64) NULL,
	[Zipcode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProcedureID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[AddressId] [int] NULL,
	[PetId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[PetId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Type] [nvarchar](64) NOT NULL,
	[Age] [int] NOT NULL,
	[Breed] [nvarchar](64) NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedureList]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureList](
	[ProcedureId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Cost] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcedureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedureTable]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureTable](
	[ProcedureId] [int] NOT NULL,
	[PetId] [int] NOT NULL,
	[DateId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 6/14/2021 1:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VisitId] [int] IDENTITY(1,1) NOT NULL,
	[PetId] [int] NOT NULL,
	[AdmissionDateId] [int] NOT NULL,
	[DischargeDateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [CustomerId], [StreetAdress], [City], [State], [Zipcode]) VALUES (1, 1, N'123 Any Street', N'Columbus', N'Ohio', 43215)
INSERT [dbo].[Address] ([AddressId], [CustomerId], [StreetAdress], [City], [State], [Zipcode]) VALUES (2, 2, N'321 Every Street', N'Columbus', N'Ohio', 43201)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Billing] ON 

INSERT [dbo].[Billing] ([BillingId], [CustomerId], [ProcedureID]) VALUES (1, 1, 1)
INSERT [dbo].[Billing] ([BillingId], [CustomerId], [ProcedureID]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[Billing] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressId], [PetId]) VALUES (1, N'Amanda Cuskelly', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressId], [PetId]) VALUES (2, N'Samantha Griffith', 2, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressId], [PetId]) VALUES (3, N'Will Whipple', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Date] ON 

INSERT [dbo].[Date] ([DateId], [Date]) VALUES (1, CAST(N'2016-02-12T15:03:00' AS SmallDateTime))
INSERT [dbo].[Date] ([DateId], [Date]) VALUES (2, CAST(N'2016-02-12T16:31:00' AS SmallDateTime))
INSERT [dbo].[Date] ([DateId], [Date]) VALUES (3, CAST(N'2016-02-12T15:11:00' AS SmallDateTime))
INSERT [dbo].[Date] ([DateId], [Date]) VALUES (4, CAST(N'2018-07-02T07:03:00' AS SmallDateTime))
INSERT [dbo].[Date] ([DateId], [Date]) VALUES (5, CAST(N'2018-07-03T12:23:00' AS SmallDateTime))
INSERT [dbo].[Date] ([DateId], [Date]) VALUES (6, CAST(N'2018-07-02T07:35:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Date] OFF
GO
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([PetId], [Name], [Type], [Age], [Breed], [CustomerId]) VALUES (1, N'Vantablack', N'Cat', 4, N'Bombay', 2)
INSERT [dbo].[Pet] ([PetId], [Name], [Type], [Age], [Breed], [CustomerId]) VALUES (2, N'Ellie', N'Dog', 5, N'Greyhound', 1)
INSERT [dbo].[Pet] ([PetId], [Name], [Type], [Age], [Breed], [CustomerId]) VALUES (3, N'Oliva', N'Dog', 10, N'Jack Russel', 3)
INSERT [dbo].[Pet] ([PetId], [Name], [Type], [Age], [Breed], [CustomerId]) VALUES (4, N'Malik', N'Dog', 2, N'Siberian Husky', 3)
SET IDENTITY_INSERT [dbo].[Pet] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcedureList] ON 

INSERT [dbo].[ProcedureList] ([ProcedureId], [Name], [Cost]) VALUES (1, N'Check up', 55)
INSERT [dbo].[ProcedureList] ([ProcedureId], [Name], [Cost]) VALUES (2, N'Repair broken leg', 2000)
INSERT [dbo].[ProcedureList] ([ProcedureId], [Name], [Cost]) VALUES (3, N'Vaccinate', 55)
SET IDENTITY_INSERT [dbo].[ProcedureList] OFF
GO
INSERT [dbo].[ProcedureTable] ([ProcedureId], [PetId], [DateId]) VALUES (1, 1, 3)
INSERT [dbo].[ProcedureTable] ([ProcedureId], [PetId], [DateId]) VALUES (2, 2, 6)
INSERT [dbo].[ProcedureTable] ([ProcedureId], [PetId], [DateId]) VALUES (3, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([VisitId], [PetId], [AdmissionDateId], [DischargeDateId]) VALUES (1, 1, 1, 2)
INSERT [dbo].[Visit] ([VisitId], [PetId], [AdmissionDateId], [DischargeDateId]) VALUES (2, 2, 4, 5)
SET IDENTITY_INSERT [dbo].[Visit] OFF
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_BillingCost] FOREIGN KEY([ProcedureID])
REFERENCES [dbo].[ProcedureList] ([ProcedureId])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_BillingCost]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_BillingCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_BillingCustomer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_CustomerAddress]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_PetCustomer] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pet] ([PetId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_PetCustomer]
GO
ALTER TABLE [dbo].[ProcedureTable]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureDate] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([DateId])
GO
ALTER TABLE [dbo].[ProcedureTable] CHECK CONSTRAINT [FK_ProcedureDate]
GO
ALTER TABLE [dbo].[ProcedureTable]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureId] FOREIGN KEY([ProcedureId])
REFERENCES [dbo].[ProcedureList] ([ProcedureId])
GO
ALTER TABLE [dbo].[ProcedureTable] CHECK CONSTRAINT [FK_ProcedureId]
GO
ALTER TABLE [dbo].[ProcedureTable]  WITH CHECK ADD  CONSTRAINT [FK_ProcedurePet] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pet] ([PetId])
GO
ALTER TABLE [dbo].[ProcedureTable] CHECK CONSTRAINT [FK_ProcedurePet]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_VisitAdmission] FOREIGN KEY([AdmissionDateId])
REFERENCES [dbo].[Date] ([DateId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_VisitAdmission]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_VisitDischarge] FOREIGN KEY([DischargeDateId])
REFERENCES [dbo].[Date] ([DateId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_VisitDischarge]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_VisitPet] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pet] ([PetId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_VisitPet]
GO
USE [master]
GO
ALTER DATABASE [AnimalHospital] SET  READ_WRITE 
GO
