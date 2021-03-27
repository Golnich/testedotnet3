USE [master]
GO
/****** Object:  Database [LUBY]    Script Date: 26/03/2021 17:28:15 ******/
CREATE DATABASE [LUBY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LUBY', FILENAME = N'C:\Dados\SQL Server\LUBY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LUBY_log', FILENAME = N'C:\Dados\SQL Server\LUBY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LUBY] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LUBY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LUBY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LUBY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LUBY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LUBY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LUBY] SET ARITHABORT OFF 
GO
ALTER DATABASE [LUBY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LUBY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LUBY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LUBY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LUBY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LUBY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LUBY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LUBY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LUBY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LUBY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LUBY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LUBY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LUBY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LUBY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LUBY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LUBY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LUBY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LUBY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LUBY] SET  MULTI_USER 
GO
ALTER DATABASE [LUBY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LUBY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LUBY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LUBY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LUBY] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LUBY] SET QUERY_STORE = OFF
GO
USE [LUBY]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LUBY]
GO
/****** Object:  Table [dbo].[DESENVOLVEDORES]    Script Date: 26/03/2021 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESENVOLVEDORES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [nvarchar](100) NOT NULL,
	[LINGUAGEM] [nvarchar](100) NOT NULL,
	[HORARIO] [datetime] NOT NULL,
	[COMPUTADOR] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LANCAMENTO_HORAS]    Script Date: 26/03/2021 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LANCAMENTO_HORAS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [nvarchar](100) NOT NULL,
	[PERIODO] [datetime] NULL,
	[HORAS] [time](7) NULL,
	[COMPUTADOR] [nvarchar](100) NULL,
	[HORARIO] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJETOS]    Script Date: 26/03/2021 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJETOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME_PROJETO] [nvarchar](100) NOT NULL,
	[RESPONSAVEL] [nvarchar](100) NOT NULL,
	[HORARIO] [datetime] NOT NULL,
	[COMPUTADOR] [nvarchar](100) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LUBY] SET  READ_WRITE 
GO
/**************** Inserindo Dados de Exemplo**************************************/
USE[LUBY]
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('José', 'JA', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('Maria', 'PY', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('João', 'CC', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('Carlos', 'PH', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('Raul', 'JA', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO DESENVOLVEDORES (NOME, LINGUAGEM, HORARIO, COMPUTADOR) values ('Ludmyla', 'CC', GETDATE(), 'DESKTOP-01')



GO
INSERT INTO PROJETOS(NOME_PROJETO, RESPONSAVEL, HORARIO, COMPUTADOR) values ('Aplicação Web', 'Carlos', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO PROJETOS(NOME_PROJETO, RESPONSAVEL, HORARIO, COMPUTADOR) values ('Aplicativo Móbile', 'José', GETDATE(), 'DESKTOP-01')
GO
INSERT INTO PROJETOS(NOME_PROJETO, RESPONSAVEL, HORARIO, COMPUTADOR) values ('Luby Windows', 'Ludmyla', GETDATE(), 'DESKTOP-01')



GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('José',DATEADD(day,-6, GETDATE()) ,  CAST('01:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('José',DATEADD(day,-4, GETDATE()) ,  CAST('05:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('José', DATEADD(day,-2, GETDATE()) ,  CAST('07:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('José', DATEADD(day,-1, GETDATE()) ,  CAST('08:00:00.0000000' as time),  'DESKTOP-01',GETDATE())



GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Carlos',DATEADD(day,-1, GETDATE()) ,  CAST('01:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Carlos',DATEADD(day,-4, GETDATE()) ,  CAST('06:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Carlos', DATEADD(day,-5, GETDATE()) ,  CAST('02:30:00.0000000' as time),  'DESKTOP-01',GETDATE())



GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Ludmyla',DATEADD(day,-6, GETDATE()) ,  CAST('10:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Ludmyla',DATEADD(day,-4, GETDATE()) ,  CAST('08:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Ludmyla', DATEADD(day,-5, GETDATE()) ,  CAST('03:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Ludmyla', DATEADD(day,-1, GETDATE()) ,  CAST('02:00:00.0000000' as time),  'DESKTOP-01',GETDATE())



GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Maria',DATEADD(day,-1, GETDATE()) ,  CAST('01:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Maria',DATEADD(day,-2, GETDATE()) ,  CAST('02:00:00.0000000' as time),  'DESKTOP-01',GETDATE())




GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Raul',DATEADD(day,-1, GETDATE()) ,  CAST('06:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Raul',DATEADD(day,-4, GETDATE()) ,  CAST('08:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('Raul', DATEADD(day,-5, GETDATE()) ,  CAST('12:30:00.0000000' as time),  'DESKTOP-01',GETDATE())


GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('João',DATEADD(day,-3, GETDATE()) ,  CAST('10:30:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('João',DATEADD(day,-4, GETDATE()) ,  CAST('08:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('João', DATEADD(day,-5, GETDATE()) ,  CAST('07:00:00.0000000' as time),  'DESKTOP-01',GETDATE())

GO
INSERT INTO LANCAMENTO_HORAS(NOME, PERIODO, HORAS, COMPUTADOR, HORARIO) values ('João', DATEADD(day,-1, GETDATE()) ,  CAST('03:00:00.0000000' as time),  'DESKTOP-01',GETDATE())
GO
