USE [QVB]
GO

/****** Object:  Database [QVB]    Script Date: 01/04/2011 14:43:04 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'QVB')
DROP DATABASE [QVB]
GO

USE [QVB]
GO

/****** Object:  Database [QVB]    Script Date: 01/04/2011 14:43:04 ******/
CREATE DATABASE [QVB] ON  PRIMARY 
( NAME = N'QVB', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\QVB.mdf' , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QVB_log', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\QVB_log.ldf' , FILEGROWTH = 10%)
GO


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QVB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [QVB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [QVB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [QVB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [QVB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [QVB] SET ARITHABORT OFF 
GO

ALTER DATABASE [QVB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [QVB] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [QVB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [QVB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [QVB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [QVB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [QVB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [QVB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [QVB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [QVB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [QVB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [QVB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [QVB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [QVB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [QVB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [QVB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [QVB] SET  READ_WRITE 
GO

ALTER DATABASE [QVB] SET RECOVERY FULL 
GO

ALTER DATABASE [QVB] SET  MULTI_USER 
GO

ALTER DATABASE [QVB] SET PAGE_VERIFY CHECKSUM  
GO

USE [QVB]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utB_utQ]') AND parent_object_id = OBJECT_ID(N'[dbo].[utB]'))
ALTER TABLE [dbo].[utB] DROP CONSTRAINT [FK_utB_utQ]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utB_utV]') AND parent_object_id = OBJECT_ID(N'[dbo].[utB]'))
ALTER TABLE [dbo].[utB] DROP CONSTRAINT [FK_utB_utV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utB]') AND type in (N'U'))
DROP TABLE [dbo].[utB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utV]') AND type in (N'U'))
DROP TABLE [dbo].[utV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utQ]') AND type in (N'U'))
DROP TABLE [dbo].[utQ]
GO

/****** Object:  Table [dbo].[utQ]    Script Date: 01/04/2011 14:43:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[utQ](
	[Q_ID] [int] NOT NULL,
	[Q_NAME] [nvarchar](35) NULL,
 CONSTRAINT [PK_utQ] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[utV]    Script Date: 01/04/2011 14:43:59 ******/
CREATE TABLE [dbo].[utV](
	[V_ID] [int] NOT NULL,
	[V_NAME] [nvarchar](35) NULL,
	[V_COLOR] [nchar](1) NULL,
 CONSTRAINT [PK_utV] PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[utB]    Script Date: 01/04/2011 14:44:06 ******/
CREATE TABLE [dbo].[utB](
	[B_DATETIME] [datetime] NOT NULL,
	[B_Q_ID] [int] NOT NULL,
	[B_V_ID] [int] NOT NULL,
	[B_VOL] [tinyint] NULL,
 CONSTRAINT [PK_utB] PRIMARY KEY CLUSTERED 
(
	[B_DATETIME] ASC,
	[B_Q_ID] ASC,
	[B_V_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[utB]  WITH CHECK ADD  CONSTRAINT [FK_utB_utQ] FOREIGN KEY([B_Q_ID])
REFERENCES [dbo].[utQ] ([Q_ID])
GO

ALTER TABLE [dbo].[utB] CHECK CONSTRAINT [FK_utB_utQ]
GO

ALTER TABLE [dbo].[utB]  WITH CHECK ADD  CONSTRAINT [FK_utB_utV] FOREIGN KEY([B_V_ID])
REFERENCES [dbo].[utV] ([V_ID])
GO

ALTER TABLE [dbo].[utB] CHECK CONSTRAINT [FK_utB_utV]
GO


-------------------------------------------------------------------------------------------------------------------------

insert utQ values (1,	'Square # 01')
insert utQ values (2,	'Square # 02')
insert utQ values (3,	'Square # 03')
insert utQ values (4,	'Square # 04')
insert utQ values (5,	'Square # 05')
insert utQ values (6,	'Square # 06')
insert utQ values (7,	'Square # 07')
insert utQ values (8,	'Square # 08')
insert utQ values (9,	'Square # 09')
insert utQ values (10,	'Square # 10')
insert utQ values (11,	'Square # 11')
insert utQ values (12,	'Square # 12')
insert utQ values (13,	'Square # 13')
insert utQ values (14,	'Square # 14')
insert utQ values (15,	'Square # 15')
insert utQ values (16,	'Square # 16')
insert utQ values (17,	'Square # 17')
insert utQ values (18,	'Square # 18')
insert utQ values (19,	'Square # 19')
insert utQ values (20,	'Square # 20')
insert utQ values (21,	'Square # 21')
insert utQ values (22,	'Square # 22')
insert utQ values (23,	'Square # 23')
insert utQ values (24,	'Square # 24')
insert utQ values (25,	'Square # 25')
go

-------------------------------------------------------------------------------------------------------------------------

insert utV values (1,'Ballon # 01 ','R')
insert utV values (2,'Ballon # 02 ','R')
insert utV values (3,'Ballon # 03 ','R')
insert utV values (4,'Ballon # 04 ','G')
insert utV values (5,'Ballon # 05 ','G')
insert utV values (6,'Ballon # 06 ','G')
insert utV values (7,'Ballon # 07 ','B')
insert utV values (8,'Ballon # 08 ','B')
insert utV values (9,'Ballon # 09 ','B')
insert utV values (10,'Ballon # 10','R')
insert utV values (11,'Ballon # 11','R')
insert utV values (12,'Ballon # 12','R')
insert utV values (13,'Ballon # 13','G')
insert utV values (14,'Ballon # 14','G')
insert utV values (15,'Ballon # 15','B')
insert utV values (16,'Ballon # 16','B')
insert utV values (17,'Ballon # 17','R')
insert utV values (18,'Ballon # 18','G')
insert utV values (19,'Ballon # 19','B')
insert utV values (20,'Ballon # 20','R')
insert utV values (21,'Ballon # 21','G')
insert utV values (22,'Ballon # 22','B')
insert utV values (23,'Ballon # 23','R')
insert utV values (24,'Ballon # 24','G')
insert utV values (25,'Ballon # 25','B')
insert utV values (26,'Ballon # 26','B')
insert utV values (27,'Ballon # 27','R')
insert utV values (28,'Ballon # 28','G')
insert utV values (29,'Ballon # 29','R')
insert utV values (30,'Ballon # 30','G')
insert utV values (31,'Ballon # 31','R')
insert utV values (32,'Ballon # 32','G')
insert utV values (33,'Ballon # 33','B')
insert utV values (34,'Ballon # 34','R')
insert utV values (35,'Ballon # 35','G')
insert utV values (36,'Ballon # 36','B')
insert utV values (37,'Ballon # 37','R')
insert utV values (38,'Ballon # 38','G')
insert utV values (39,'Ballon # 39','B')
insert utV values (40,'Ballon # 40','R')
insert utV values (41,'Ballon # 41','R')
insert utV values (42,'Ballon # 42','G')
insert utV values (43,'Ballon # 43','B')
insert utV values (44,'Ballon # 44','R')
insert utV values (45,'Ballon # 45','G')
insert utV values (46,'Ballon # 46','B')
insert utV values (47,'Ballon # 47','B')
insert utV values (48,'Ballon # 48','G')
insert utV values (49,'Ballon # 49','R')
insert utV values (50,'Ballon # 50','G')
insert utV values (51,'Ballon # 51','B')
insert utV values (52,'Ballon # 52','R')
insert utV values (53,'Ballon # 53','G')
insert utV values (54,'Ballon # 54','B')
go

-------------------------------------------------------------------------------------------------------------------------
insert utB values('2000-01-01 01:13:36.000',22,50,50)
insert utB values('2001-01-01 01:13:37.000',22,50,50)
insert utB values('2002-01-01 01:13:38.000',22,51,50)
insert utB values('2002-06-01 01:13:39.000',22,51,50)
insert utB values('2003-01-01 01:12:01.000',1,1,155)
insert utB values('2003-01-01 01:12:03.000',2,2,255)
insert utB values('2003-01-01 01:12:04.000',3,3,255)
insert utB values('2003-01-01 01:12:05.000',1,4,255)
insert utB values('2003-01-01 01:12:06.000',2,5,255)
insert utB values('2003-01-01 01:12:07.000',3,6,255)
insert utB values('2003-01-01 01:12:08.000',1,7,255)
insert utB values('2003-01-01 01:12:09.000',2,8,255)
insert utB values('2003-01-01 01:12:10.000',3,9,255)
insert utB values('2003-01-01 01:12:11.000',4,10,50)
insert utB values('2003-01-01 01:12:12.000',5,11,100)
insert utB values('2003-01-01 01:12:13.000',5,12,155)
insert utB values('2003-01-01 01:12:14.000',5,13,155)
insert utB values('2003-01-01 01:12:15.000',5,14,100)
insert utB values('2003-01-01 01:12:16.000',5,15,50)
insert utB values('2003-01-01 01:12:17.000',5,16,205)
insert utB values('2003-01-01 01:12:18.000',6,10,155)
insert utB values('2003-01-01 01:12:19.000',6,17,100)
insert utB values('2003-01-01 01:12:20.000',6,18,255)
insert utB values('2003-01-01 01:12:21.000',6,19,255)
insert utB values('2003-01-01 01:12:22.000',7,17,155)
insert utB values('2003-01-01 01:12:23.000',7,20,100)
insert utB values('2003-01-01 01:12:24.000',7,21,255)
insert utB values('2003-01-01 01:12:25.000',7,22,255)
insert utB values('2003-01-01 01:12:26.000',8,10,50)
insert utB values('2003-01-01 01:12:27.000',9,23,255)
insert utB values('2003-01-01 01:12:28.000',9,24,255)
insert utB values('2003-01-01 01:12:29.000',9,25,100)
insert utB values('2003-01-01 01:12:30.000',9,26,155)
insert utB values('2003-01-01 01:12:31.000',10,25,155)
insert utB values('2003-01-01 01:12:31.000',10,26,100)
insert utB values('2003-01-01 01:12:33.000',10,27,10)
insert utB values('2003-01-01 01:12:34.000',10,28,10)
insert utB values('2003-01-01 01:12:35.000',10,29,245)
insert utB values('2003-01-01 01:12:36.000',10,30,245)
insert utB values('2003-01-01 01:12:37.000',11,31,100)
insert utB values('2003-01-01 01:12:38.000',11,32,100)
insert utB values('2003-01-01 01:12:39.000',11,33,100)
insert utB values('2003-01-01 01:12:40.000',11,34,155)
insert utB values('2003-01-01 01:12:41.000',11,35,155)
insert utB values('2003-01-01 01:12:42.000',11,36,155)
insert utB values('2003-01-01 01:12:43.000',12,31,155)
insert utB values('2003-01-01 01:12:44.000',12,32,155)
insert utB values('2003-01-01 01:12:45.000',12,33,155)
insert utB values('2003-01-01 01:12:46.000',12,34,100)
insert utB values('2003-01-01 01:12:47.000',12,35,100)
insert utB values('2003-01-01 01:12:48.000',12,36,100)
insert utB values('2003-01-01 01:13:01.000',4,37,20)
insert utB values('2003-01-01 01:13:02.000',8,38,20)
insert utB values('2003-01-01 01:13:03.000',13,39,123)
insert utB values('2003-01-01 01:13:04.000',14,39,111)
insert utB values('2003-01-01 01:13:05.000',4,37,185)
insert utB values('2003-01-01 01:13:05.000',14,40,50)
insert utB values('2003-01-01 01:13:06.000',15,41,50)
insert utB values('2003-01-01 01:13:07.000',15,41,50)
insert utB values('2003-01-01 01:13:08.000',15,42,50)
insert utB values('2003-01-01 01:13:09.000',15,42,50)
insert utB values('2003-01-01 01:13:10.000',16,42,50)
insert utB values('2003-01-01 01:13:11.000',16,42,50)
insert utB values('2003-01-01 01:13:12.000',16,43,50)
insert utB values('2003-01-01 01:13:13.000',16,43,50)
insert utB values('2003-01-01 01:13:14.000',16,47,50)
insert utB values('2003-01-01 01:13:15.000',17,44,10)
insert utB values('2003-01-01 01:13:16.000',17,44,10)
insert utB values('2003-01-01 01:13:17.000',17,45,10)
insert utB values('2003-01-01 01:13:18.000',17,45,10)
insert utB values('2003-01-01 01:13:24.000',19,44,10)
insert utB values('2003-01-01 01:13:25.000',19,45,10)
insert utB values('2003-01-01 01:13:26.000',19,45,10)
insert utB values('2003-02-01 01:13:19.000',18,45,10)
insert utB values('2003-02-01 01:13:27.000',20,45,10)
insert utB values('2003-02-01 01:13:31.000',21,49,50)
insert utB values('2003-02-02 01:13:32.000',21,49,50)
insert utB values('2003-02-03 01:13:33.000',21,50,50)
insert utB values('2003-02-04 01:13:34.000',21,50,50)
insert utB values('2003-02-05 01:13:35.000',21,48,1)
insert utB values('2003-03-01 01:13:20.000',18,45,10)
insert utB values('2003-03-01 01:13:28.000',20,45,10)
insert utB values('2003-04-01 01:13:21.000',18,46,10)
insert utB values('2003-04-01 01:13:29.000',20,46,10)
insert utB values('2003-05-01 01:13:22.000',18,46,10)
insert utB values('2003-05-01 01:13:30.000',20,46,10)
insert utB values('2003-06-11 01:13:23.000',19,44,10)
insert utB values('2003-06-23 01:12:02.000',1,1,100)
GO
