USE [master]
GO
/****** Object:  Database [refund2]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE DATABASE [refund2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'refund2', FILENAME = N'E:\SQL_DATA_Directory\Data\refund2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'refund2_log', FILENAME = N'E:\SQL_DATA_Directory\Data\refund2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [refund2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [refund2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [refund2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [refund2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [refund2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [refund2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [refund2] SET ARITHABORT OFF 
GO
ALTER DATABASE [refund2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [refund2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [refund2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [refund2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [refund2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [refund2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [refund2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [refund2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [refund2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [refund2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [refund2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [refund2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [refund2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [refund2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [refund2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [refund2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [refund2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [refund2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [refund2] SET  MULTI_USER 
GO
ALTER DATABASE [refund2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [refund2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [refund2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [refund2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [refund2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [refund2] SET QUERY_STORE = OFF
GO
USE [refund2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [refund2]
GO
/****** Object:  User [IMAM\omtamimi]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE USER [IMAM\omtamimi] FOR LOGIN [IMAM\omtamimi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DevUser]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE USER [DevUser] FOR LOGIN [DevUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DevUser]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[GivenName] [nvarchar](50) NOT NULL,
	[LandLine] [numeric](10, 0) NULL,
	[IdNumber] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Local] [bit] NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[IBAN] [nchar](14) NOT NULL,
	[BankId] [int] NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayRoll]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRoll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[AuditorId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_PayRoll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollType]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PayrollType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[CitizenUserId] [nvarchar](128) NOT NULL,
	[PayrollId] [int] NULL,
	[Amount] [decimal](19, 4) NOT NULL,
	[ReferenceNumber] [uniqueidentifier] NOT NULL,
	[EmployeeUserId] [nvarchar](128) NULL,
	[Note] [nvarchar](max) NULL,
	[CountryId] [int] NOT NULL,
	[FromBankAccount] [int] NULL,
	[ToBankAccount] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestType]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestTypeRequiredDocument]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestTypeRequiredDocument](
	[RequestType_Id] [int] NOT NULL,
	[RequiredDocument_Id] [int] NOT NULL,
 CONSTRAINT [PK_RequestTypeRequiredDocument] PRIMARY KEY CLUSTERED 
(
	[RequestType_Id] ASC,
	[RequiredDocument_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequiredDocument]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequiredDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequiredDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadedDocemuent]    Script Date: 11/29/2016 9:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedDocemuent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](50) NOT NULL,
	[RequiredDocumentId] [int] NOT NULL,
	[RequestId] [int] NOT NULL,
 CONSTRAINT [PK_UploadedDocemuent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_FK_BankAccount_Bank]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BankAccount_Bank] ON [dbo].[BankAccount]
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PayRoll_PayrollType]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PayRoll_PayrollType] ON [dbo].[PayRoll]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Request_BankAccount]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Request_BankAccount] ON [dbo].[Request]
(
	[FromBankAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Request_BankAccount1]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Request_BankAccount1] ON [dbo].[Request]
(
	[ToBankAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Request_Country]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Request_Country] ON [dbo].[Request]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Request_PayRoll]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Request_PayRoll] ON [dbo].[Request]
(
	[PayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Request_RequestType]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Request_RequestType] ON [dbo].[Request]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RequestTypeRequiredDocument_RequiredDocument]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RequestTypeRequiredDocument_RequiredDocument] ON [dbo].[RequestTypeRequiredDocument]
(
	[RequiredDocument_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UploadedDocemuent_Request]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UploadedDocemuent_Request] ON [dbo].[UploadedDocemuent]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UploadedDocemuent_RequiredDocument]    Script Date: 11/29/2016 9:01:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UploadedDocemuent_RequiredDocument] ON [dbo].[UploadedDocemuent]
(
	[RequiredDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Bank]
GO
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_PayrollType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PayrollType] ([Id])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_PayrollType]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_BankAccount] FOREIGN KEY([FromBankAccount])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_BankAccount]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_BankAccount1] FOREIGN KEY([ToBankAccount])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_BankAccount1]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Country]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_PayRoll] FOREIGN KEY([PayrollId])
REFERENCES [dbo].[PayRoll] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_PayRoll]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[RequestType] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_RequestType]
GO
ALTER TABLE [dbo].[RequestTypeRequiredDocument]  WITH CHECK ADD  CONSTRAINT [FK_RequestTypeRequiredDocument_RequestType] FOREIGN KEY([RequestType_Id])
REFERENCES [dbo].[RequestType] ([Id])
GO
ALTER TABLE [dbo].[RequestTypeRequiredDocument] CHECK CONSTRAINT [FK_RequestTypeRequiredDocument_RequestType]
GO
ALTER TABLE [dbo].[RequestTypeRequiredDocument]  WITH CHECK ADD  CONSTRAINT [FK_RequestTypeRequiredDocument_RequiredDocument] FOREIGN KEY([RequiredDocument_Id])
REFERENCES [dbo].[RequiredDocument] ([Id])
GO
ALTER TABLE [dbo].[RequestTypeRequiredDocument] CHECK CONSTRAINT [FK_RequestTypeRequiredDocument_RequiredDocument]
GO
ALTER TABLE [dbo].[UploadedDocemuent]  WITH CHECK ADD  CONSTRAINT [FK_UploadedDocemuent_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([Id])
GO
ALTER TABLE [dbo].[UploadedDocemuent] CHECK CONSTRAINT [FK_UploadedDocemuent_Request]
GO
ALTER TABLE [dbo].[UploadedDocemuent]  WITH CHECK ADD  CONSTRAINT [FK_UploadedDocemuent_RequiredDocument] FOREIGN KEY([RequiredDocumentId])
REFERENCES [dbo].[RequiredDocument] ([Id])
GO
ALTER TABLE [dbo].[UploadedDocemuent] CHECK CONSTRAINT [FK_UploadedDocemuent_RequiredDocument]
GO
USE [master]
GO
ALTER DATABASE [refund2] SET  READ_WRITE 
GO
