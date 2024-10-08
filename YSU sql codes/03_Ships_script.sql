USE [kk603]
GO

/****** Object:  Database [Ships]    Script Date: 01/04/2011 14:43:04 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Ships')
DROP DATABASE [SShip]
GO

USE [kk603]
GO

/****** Object:  Database [Ships]    Script Date: 01/04/2011 14:43:04 ******/
CREATE DATABASE [Ships] ON  PRIMARY 
( NAME = N'Ships', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Ships.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ships_log', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Ships_log.ldf' , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ships].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Ships] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Ships] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Ships] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Ships] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Ships] SET ARITHABORT OFF 
GO

ALTER DATABASE [Ships] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Ships] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Ships] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Ships] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Ships] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Ships] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Ships] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Ships] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Ships] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Ships] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Ships] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Ships] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Ships] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Ships] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Ships] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Ships] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Ships] SET  READ_WRITE 
GO

ALTER DATABASE [Ships] SET RECOVERY FULL 
GO

ALTER DATABASE [Ships] SET  MULTI_USER 
GO

ALTER DATABASE [Ships] SET PAGE_VERIFY CHECKSUM  
GO

USE [Ships]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Outcomes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Outcomes]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ships]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ships]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Battles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Battles]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Classes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Classes]
GO


CREATE TABLE [Battles] (
	[name] [varchar] (20) NOT NULL ,
	[date] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Classes] (
	[class] [varchar] (50) NOT NULL ,
	[type] [varchar] (2) NOT NULL ,
	[country] [varchar] (20) NOT NULL ,
	[numGuns] [tinyint] NULL ,
	[bore] [real] NULL ,
	[displacement] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ships] (
	[name] [varchar] (50) NOT NULL ,
	[class] [varchar] (50) NOT NULL ,
	[launched] [smallint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Outcomes] (
	[ship] [varchar] (50) NOT NULL ,
	[battle] [varchar] (20) NOT NULL ,
	[result] [varchar] (10) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Battles] ADD 
	CONSTRAINT [PK_Battles] PRIMARY KEY  CLUSTERED 
	(
		[name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Classes] ADD 
	CONSTRAINT [PK_Classes] PRIMARY KEY  CLUSTERED 
	(
		[class]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Ships] ADD 
	CONSTRAINT [PK_Ships] PRIMARY KEY  CLUSTERED 
	(
		[name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Outcomes] ADD 
	CONSTRAINT [PK_Outcomes] PRIMARY KEY  CLUSTERED 
	(
		[ship],
		[battle]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Ships] ADD 
	CONSTRAINT [FK_Ships_Classes] FOREIGN KEY 
	(
		[class]
	) REFERENCES [dbo].[Classes] (
		[class]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Outcomes] ADD 
	CONSTRAINT [FK_Outcomes_Battles] FOREIGN KEY 
	(
		[battle]
	) REFERENCES [dbo].[Battles] (
		[name]
	)
GO
                                                                                                                                                                                                                                                               
----Classes------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Classes values('Bismarck','bb','Germany',8,15,42000)
insert into Classes values('Iowa','bb','USA',9,16,46000)
insert into Classes values('Kongo','bc','Japan',8,14,32000)
insert into Classes values('North Carolina','bb','USA',12,16,37000)
insert into Classes values('Renown','bc','Gt.Britain',6,15,32000)
insert into Classes values('Revenge','bb','Gt.Britain',8,15,29000)
insert into Classes values('Tennessee','bb','USA',12,14,32000)
insert into Classes values('Yamato','bb','Japan',9,18,65000)
insert into Classes values('October Revolution','bb','USSR',12,13,25000)

GO

                                                                                                                                                                                                                                                                 
----Battles------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Battles values('Guadalcanal','1942-11-15 00:00:00.000')
insert into Battles values('North Atlantic','1941-05-25 00:00:00.000')
insert into Battles values('North Cape','1943-12-26 00:00:00.000')
insert into Battles values('Surigao Strait','1944-10-25 00:00:00.000')

GO

                                                                                                                                                                                                                                                                 
----Ships------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Ships values('California','Tennessee',1921)
insert into Ships values('Haruna','Kongo',1916)
insert into Ships values('Hiei','Kongo',1914)
insert into Ships values('Iowa','Iowa',1943)
insert into Ships values('Kirishima','Kongo',1915)
insert into Ships values('Kongo','Kongo',1913)
insert into Ships values('Missouri','Iowa',1944)
insert into Ships values('Musashi','Yamato',1942)
insert into Ships values('New Jersey','Iowa',1943)
insert into Ships values('North Carolina','North Carolina',1941)
insert into Ships values('Ramillies','Revenge',1917)
insert into Ships values('Renown','Renown',1916)
insert into Ships values('Repulse','Renown',1916)
insert into Ships values('Resolution','Renown',1916)
insert into Ships values('Revenge','Revenge',1916)
insert into Ships values('Royal Oak','Revenge',1916)
insert into Ships values('Royal Sovereign','Revenge',1916)
insert into Ships values('Tennessee','Tennessee',1920)
insert into Ships values('Washington','North Carolina',1941)
insert into Ships values('Wisconsin','Iowa',1944)
insert into Ships values('Yamato','Yamato',1941)
insert into Ships values('October Revolution','October Revolution',1914) 
insert into Ships values('Paris Comuna','October Revolution',1914) 
insert into Ships values('Marat','October Revolution',1914) 


GO

                                                                                                                                                                                                                                                                 
----Outcomes------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Outcomes values('Bismarck','North Atlantic','sunk')
insert into Outcomes values('California','Surigao Strait','ok')
insert into Outcomes values('Duke of York','North Cape','ok')
insert into Outcomes values('Fuso','Surigao Strait','sunk')
insert into Outcomes values('Hood','North Atlantic','sunk')
insert into Outcomes values('King George V','North Atlantic','ok')
insert into Outcomes values('Kirishima','Guadalcanal','sunk')
insert into Outcomes values('Prince of Wales','North Atlantic','damaged')
insert into Outcomes values('Rodney','North Atlantic','OK')
insert into Outcomes values('Schamhorst','North Cape','sunk')
insert into Outcomes values('South Dakota','Guadalcanal','damaged')
insert into Outcomes values('Tennessee','Surigao Strait','ok')
insert into Outcomes values('Washington','Guadalcanal','ok')
insert into Outcomes values('West Virginia','Surigao Strait','ok')
insert into Outcomes values('Yamashiro','Surigao Strait','sunk')
insert into Outcomes values('California','Guadalcanal','damaged')
GO

