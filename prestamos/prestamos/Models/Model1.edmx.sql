
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/17/2016 21:50:10
-- Generated from EDMX file: C:\Users\Daniel\Desktop\prestamosCyD\prestamos\prestamos\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Prestamos];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Prestamos'
CREATE TABLE [dbo].[Prestamos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumeroBoleta] nvarchar(max)  NOT NULL,
    [Motivo] nvarchar(max)  NOT NULL,
    [FechaSolicitud] datetime  NOT NULL,
    [FechaRetiro] datetime  NOT NULL,
    [PeriodoUso] int  NOT NULL,
    [SoftwareReq] nvarchar(max)  NOT NULL,
    [ObservacionesSolicitante] nvarchar(max)  NOT NULL,
    [ObservacionesAprobado] nvarchar(max)  NOT NULL,
    [ObservacionesRecibido] nvarchar(max)  NOT NULL,
    [ComplexProperty_Categoria] nvarchar(max)  NOT NULL,
    [ComplexProperty_cantidad] int  NOT NULL
);
GO

-- Creating table 'Activos'
CREATE TABLE [dbo].[Activos] (
    [Placa] nvarchar(max)  NOT NULL,
    [categoria] nvarchar(max)  NOT NULL,
    [Marca] nvarchar(max)  NOT NULL,
    [Estado] smallint  NOT NULL,
    [Prestable] smallint  NOT NULL
);
GO

-- Creating table 'PrestamosActivos'
CREATE TABLE [dbo].[PrestamosActivos] (
    [Prestamos_Id] int  NOT NULL,
    [Activos_Placa] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Prestamos'
ALTER TABLE [dbo].[Prestamos]
ADD CONSTRAINT [PK_Prestamos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Placa] in table 'Activos'
ALTER TABLE [dbo].[Activos]
ADD CONSTRAINT [PK_Activos]
    PRIMARY KEY CLUSTERED ([Placa] ASC);
GO

-- Creating primary key on [Prestamos_Id], [Activos_Placa] in table 'PrestamosActivos'
ALTER TABLE [dbo].[PrestamosActivos]
ADD CONSTRAINT [PK_PrestamosActivos]
    PRIMARY KEY CLUSTERED ([Prestamos_Id], [Activos_Placa] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Prestamos_Id] in table 'PrestamosActivos'
ALTER TABLE [dbo].[PrestamosActivos]
ADD CONSTRAINT [FK_PrestamosActivos_Prestamos]
    FOREIGN KEY ([Prestamos_Id])
    REFERENCES [dbo].[Prestamos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Activos_Placa] in table 'PrestamosActivos'
ALTER TABLE [dbo].[PrestamosActivos]
ADD CONSTRAINT [FK_PrestamosActivos_Activos]
    FOREIGN KEY ([Activos_Placa])
    REFERENCES [dbo].[Activos]
        ([Placa])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestamosActivos_Activos'
CREATE INDEX [IX_FK_PrestamosActivos_Activos]
ON [dbo].[PrestamosActivos]
    ([Activos_Placa]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------