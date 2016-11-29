
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2016 12:34:02
-- Generated from EDMX file: C:\Users\omtamimi\documents\visual studio 2015\Projects\WebApplication16\WebApplication16\Models\RefundModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [refund2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BankAccount_Bank]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BankAccount] DROP CONSTRAINT [FK_BankAccount_Bank];
GO
IF OBJECT_ID(N'[dbo].[FK_PayRoll_PayrollType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PayRoll] DROP CONSTRAINT [FK_PayRoll_PayrollType];
GO
IF OBJECT_ID(N'[dbo].[FK_Request_BankAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Request] DROP CONSTRAINT [FK_Request_BankAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_Request_BankAccount1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Request] DROP CONSTRAINT [FK_Request_BankAccount1];
GO
IF OBJECT_ID(N'[dbo].[FK_Request_Country]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Request] DROP CONSTRAINT [FK_Request_Country];
GO
IF OBJECT_ID(N'[dbo].[FK_Request_PayRoll]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Request] DROP CONSTRAINT [FK_Request_PayRoll];
GO
IF OBJECT_ID(N'[dbo].[FK_Request_RequestType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Request] DROP CONSTRAINT [FK_Request_RequestType];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestTypeRequiredDocument_RequestType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestTypeRequiredDocument] DROP CONSTRAINT [FK_RequestTypeRequiredDocument_RequestType];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestTypeRequiredDocument_RequiredDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestTypeRequiredDocument] DROP CONSTRAINT [FK_RequestTypeRequiredDocument_RequiredDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_UploadedDocemuent_Request]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UploadedDocemuent] DROP CONSTRAINT [FK_UploadedDocemuent_Request];
GO
IF OBJECT_ID(N'[dbo].[FK_UploadedDocemuent_RequiredDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UploadedDocemuent] DROP CONSTRAINT [FK_UploadedDocemuent_RequiredDocument];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bank]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bank];
GO
IF OBJECT_ID(N'[dbo].[BankAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BankAccount];
GO
IF OBJECT_ID(N'[dbo].[Country]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Country];
GO
IF OBJECT_ID(N'[dbo].[PayRoll]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PayRoll];
GO
IF OBJECT_ID(N'[dbo].[PayrollType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PayrollType];
GO
IF OBJECT_ID(N'[dbo].[Request]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Request];
GO
IF OBJECT_ID(N'[dbo].[RequestType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestType];
GO
IF OBJECT_ID(N'[dbo].[RequestTypeRequiredDocument]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestTypeRequiredDocument];
GO
IF OBJECT_ID(N'[dbo].[RequiredDocument]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequiredDocument];
GO
IF OBJECT_ID(N'[dbo].[UploadedDocemuent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UploadedDocemuent];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Bank'
CREATE TABLE [dbo].[Bank] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Local] bit  NOT NULL
);
GO

-- Creating table 'BankAccount'
CREATE TABLE [dbo].[BankAccount] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NOT NULL,
    [IBAN] nchar(14)  NOT NULL,
    [BankId] int  NOT NULL
);
GO

-- Creating table 'Country'
CREATE TABLE [dbo].[Country] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'PayRoll'
CREATE TABLE [dbo].[PayRoll] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmployeeId] int  NOT NULL,
    [AuditorId] int  NOT NULL,
    [TypeId] int  NOT NULL
);
GO

-- Creating table 'PayrollType'
CREATE TABLE [dbo].[PayrollType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Request'
CREATE TABLE [dbo].[Request] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] int  NOT NULL,
    [TypeId] int  NOT NULL,
    [CitizenUserId] nvarchar(128)  NOT NULL,
    [PayrollId] int  NULL,
    [Amount] decimal(19,4)  NOT NULL,
    [ReferenceNumber] uniqueidentifier  NOT NULL,
    [EmployeeUserId] nvarchar(128)  NULL,
    [Note] nvarchar(max)  NOT NULL,
    [CountryId] int  NOT NULL,
    [FromBankAccount] int  NULL,
    [ToBankAccount] int  NOT NULL
);
GO

-- Creating table 'RequestType'
CREATE TABLE [dbo].[RequestType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'RequiredDocument'
CREATE TABLE [dbo].[RequiredDocument] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'UploadedDocemuent'
CREATE TABLE [dbo].[UploadedDocemuent] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Path] varchar(50)  NOT NULL,
    [RequiredDocumentId] int  NOT NULL,
    [RequestId] int  NOT NULL
);
GO

-- Creating table 'RequestTypeRequiredDocument'
CREATE TABLE [dbo].[RequestTypeRequiredDocument] (
    [RequestType_Id] int  NOT NULL,
    [RequiredDocument_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Bank'
ALTER TABLE [dbo].[Bank]
ADD CONSTRAINT [PK_Bank]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BankAccount'
ALTER TABLE [dbo].[BankAccount]
ADD CONSTRAINT [PK_BankAccount]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Country'
ALTER TABLE [dbo].[Country]
ADD CONSTRAINT [PK_Country]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PayRoll'
ALTER TABLE [dbo].[PayRoll]
ADD CONSTRAINT [PK_PayRoll]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PayrollType'
ALTER TABLE [dbo].[PayrollType]
ADD CONSTRAINT [PK_PayrollType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [PK_Request]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequestType'
ALTER TABLE [dbo].[RequestType]
ADD CONSTRAINT [PK_RequestType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequiredDocument'
ALTER TABLE [dbo].[RequiredDocument]
ADD CONSTRAINT [PK_RequiredDocument]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UploadedDocemuent'
ALTER TABLE [dbo].[UploadedDocemuent]
ADD CONSTRAINT [PK_UploadedDocemuent]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RequestType_Id], [RequiredDocument_Id] in table 'RequestTypeRequiredDocument'
ALTER TABLE [dbo].[RequestTypeRequiredDocument]
ADD CONSTRAINT [PK_RequestTypeRequiredDocument]
    PRIMARY KEY CLUSTERED ([RequestType_Id], [RequiredDocument_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BankId] in table 'BankAccount'
ALTER TABLE [dbo].[BankAccount]
ADD CONSTRAINT [FK_BankAccount_Bank]
    FOREIGN KEY ([BankId])
    REFERENCES [dbo].[Bank]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BankAccount_Bank'
CREATE INDEX [IX_FK_BankAccount_Bank]
ON [dbo].[BankAccount]
    ([BankId]);
GO

-- Creating foreign key on [FromBankAccount] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [FK_Request_BankAccount]
    FOREIGN KEY ([FromBankAccount])
    REFERENCES [dbo].[BankAccount]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Request_BankAccount'
CREATE INDEX [IX_FK_Request_BankAccount]
ON [dbo].[Request]
    ([FromBankAccount]);
GO

-- Creating foreign key on [ToBankAccount] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [FK_Request_BankAccount1]
    FOREIGN KEY ([ToBankAccount])
    REFERENCES [dbo].[BankAccount]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Request_BankAccount1'
CREATE INDEX [IX_FK_Request_BankAccount1]
ON [dbo].[Request]
    ([ToBankAccount]);
GO

-- Creating foreign key on [CountryId] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [FK_Request_Country]
    FOREIGN KEY ([CountryId])
    REFERENCES [dbo].[Country]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Request_Country'
CREATE INDEX [IX_FK_Request_Country]
ON [dbo].[Request]
    ([CountryId]);
GO

-- Creating foreign key on [TypeId] in table 'PayRoll'
ALTER TABLE [dbo].[PayRoll]
ADD CONSTRAINT [FK_PayRoll_PayrollType]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[PayrollType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PayRoll_PayrollType'
CREATE INDEX [IX_FK_PayRoll_PayrollType]
ON [dbo].[PayRoll]
    ([TypeId]);
GO

-- Creating foreign key on [PayrollId] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [FK_Request_PayRoll]
    FOREIGN KEY ([PayrollId])
    REFERENCES [dbo].[PayRoll]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Request_PayRoll'
CREATE INDEX [IX_FK_Request_PayRoll]
ON [dbo].[Request]
    ([PayrollId]);
GO

-- Creating foreign key on [TypeId] in table 'Request'
ALTER TABLE [dbo].[Request]
ADD CONSTRAINT [FK_Request_RequestType]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[RequestType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Request_RequestType'
CREATE INDEX [IX_FK_Request_RequestType]
ON [dbo].[Request]
    ([TypeId]);
GO

-- Creating foreign key on [RequestId] in table 'UploadedDocemuent'
ALTER TABLE [dbo].[UploadedDocemuent]
ADD CONSTRAINT [FK_UploadedDocemuent_Request]
    FOREIGN KEY ([RequestId])
    REFERENCES [dbo].[Request]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UploadedDocemuent_Request'
CREATE INDEX [IX_FK_UploadedDocemuent_Request]
ON [dbo].[UploadedDocemuent]
    ([RequestId]);
GO

-- Creating foreign key on [RequiredDocumentId] in table 'UploadedDocemuent'
ALTER TABLE [dbo].[UploadedDocemuent]
ADD CONSTRAINT [FK_UploadedDocemuent_RequiredDocument]
    FOREIGN KEY ([RequiredDocumentId])
    REFERENCES [dbo].[RequiredDocument]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UploadedDocemuent_RequiredDocument'
CREATE INDEX [IX_FK_UploadedDocemuent_RequiredDocument]
ON [dbo].[UploadedDocemuent]
    ([RequiredDocumentId]);
GO

-- Creating foreign key on [RequestType_Id] in table 'RequestTypeRequiredDocument'
ALTER TABLE [dbo].[RequestTypeRequiredDocument]
ADD CONSTRAINT [FK_RequestTypeRequiredDocument_RequestType]
    FOREIGN KEY ([RequestType_Id])
    REFERENCES [dbo].[RequestType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RequiredDocument_Id] in table 'RequestTypeRequiredDocument'
ALTER TABLE [dbo].[RequestTypeRequiredDocument]
ADD CONSTRAINT [FK_RequestTypeRequiredDocument_RequiredDocument]
    FOREIGN KEY ([RequiredDocument_Id])
    REFERENCES [dbo].[RequiredDocument]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestTypeRequiredDocument_RequiredDocument'
CREATE INDEX [IX_FK_RequestTypeRequiredDocument_RequiredDocument]
ON [dbo].[RequestTypeRequiredDocument]
    ([RequiredDocument_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------