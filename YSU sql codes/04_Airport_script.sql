USE [master]
GO

/****** Object:  Database [Airport]    Script Date: 01/04/2011 14:43:04 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Airport')
DROP DATABASE [Airport]
GO

USE [master]
GO

/****** Object:  Database [Airport]    Script Date: 01/04/2011 14:43:04 ******/
CREATE DATABASE [Airport] ON  PRIMARY 
( NAME = N'Airport', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Airport.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Airport_log', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Airport_log.ldf' , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Airport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Airport] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Airport] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Airport] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Airport] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Airport] SET ARITHABORT OFF 
GO

ALTER DATABASE [Airport] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Airport] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Airport] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Airport] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Airport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Airport] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Airport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Airport] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Airport] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Airport] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Airport] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Airport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Airport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Airport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Airport] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Airport] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Airport] SET  READ_WRITE 
GO

ALTER DATABASE [Airport] SET RECOVERY FULL 
GO

ALTER DATABASE [Airport] SET  MULTI_USER 
GO

ALTER DATABASE [Airport] SET PAGE_VERIFY CHECKSUM  
GO


USE [Airport]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Company]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Company]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Pass_in_trip]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Pass_in_trip]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Passenger]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Passenger]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Trip]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Trip]
GO

CREATE TABLE [dbo].[Company] (
	[ID_comp] [int] NOT NULL ,
	[name] [char] (10) NULL 
)
GO

CREATE TABLE [dbo].[Pass_in_trip] (
	[trip_no] [int] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[ID_psg] [int] NOT NULL ,
	[place] [char] (10) NOT NULL 
)
GO

CREATE TABLE [dbo].[Passenger] (
	[ID_psg] [int] NOT NULL ,
	[name] [char] (20) NOT NULL 
)
GO

CREATE TABLE [dbo].[Trip] (
	[trip_no] [int] NOT NULL ,
	[ID_comp] [int] NOT NULL ,
	[plane] [char] (10) NOT NULL ,
	[town_from] [char] (25) NOT NULL ,
	[town_to] [char] (25) NOT NULL ,
	[time_out] [datetime] NOT NULL ,
	[time_in] [datetime] NOT NULL 
)
GO

ALTER TABLE [dbo].[Company] WITH NOCHECK ADD 
	CONSTRAINT [PK2] PRIMARY KEY  CLUSTERED 
	(
		[ID_comp]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Pass_in_trip] WITH NOCHECK ADD 
	CONSTRAINT [PK5_03082003185621001] PRIMARY KEY  CLUSTERED 
	(
		[trip_no],
		[date],
		[ID_psg]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Passenger] WITH NOCHECK ADD 
	CONSTRAINT [PK3_022420_03082003185620001] PRIMARY KEY  CLUSTERED 
	(
		[ID_psg]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Trip] WITH NOCHECK ADD 
	CONSTRAINT [PK1] PRIMARY KEY  CLUSTERED 
	(
		[trip_no]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Pass_in_trip] ADD 
	CONSTRAINT [FK_Pass_in_trip_Passenger] FOREIGN KEY 
	(
		[ID_psg]
	) REFERENCES [dbo].[Passenger] (
		[ID_psg]
	),
	CONSTRAINT [FK_Pass_in_trip_Trip] FOREIGN KEY 
	(
		[trip_no]
	) REFERENCES [dbo].[Trip] (
		[trip_no]
	)
GO

ALTER TABLE [dbo].[Trip] ADD 
	CONSTRAINT [FK_Trip_Company] FOREIGN KEY 
	(
		[ID_comp]
	) REFERENCES [dbo].[Company] (
		[ID_comp]
	)
GO
                                                                                                                                                                                                                                                                 
----Company------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Company values(1,'Don_avia  ')
insert into Company values(2,'Aeroflot  ')
insert into Company values(3,'Dale_avia ')
insert into Company values(4,'air_France')
insert into Company values(5,'British_AW')
GO

                                                                                                                                                                                                                                                                 
----Passenger------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Passenger values(1,'Bruce Willis        ')
insert into Passenger values(2,'George Clooney      ')
insert into Passenger values(3,'Kevin Costner       ')
insert into Passenger values(4,'Donald Sutherland   ')
insert into Passenger values(5,'Jennifer Lopez      ')
insert into Passenger values(6,'Ray Liotta          ')
insert into Passenger values(7,'Samuel L. Jackson   ')
insert into Passenger values(8,'Nikole Kidman       ')
insert into Passenger values(9,'Alan Rickman        ')
insert into Passenger values(10,'Kurt Russell        ')
insert into Passenger values(11,'Harrison Ford       ')
insert into Passenger values(12,'Russell Crowe       ')
insert into Passenger values(13,'Steve Martin        ')
insert into Passenger values(14,'Michael Caine       ')
insert into Passenger values(15,'Angelina Jolie      ')
insert into Passenger values(16,'Mel Gibson          ')
insert into Passenger values(17,'Michael Douglas     ')
insert into Passenger values(18,'John Travolta       ')
insert into Passenger values(19,'Sylvester Stallone  ')
insert into Passenger values(20,'Tommy Lee Jones     ')
insert into Passenger values(21,'Catherine Zeta-Jones')
insert into Passenger values(22,'Antonio Banderas    ')
insert into Passenger values(23,'Kim Basinger        ')
insert into Passenger values(24,'Sam Neill           ')
insert into Passenger values(25,'Gary Oldman         ')
insert into Passenger values(26,'Clint Eastwood      ')
insert into Passenger values(27,'Brad Pitt           ')
insert into Passenger values(28,'Johnny Depp         ')
insert into Passenger values(29,'Pierce Brosnan      ')
insert into Passenger values(30,'Sean Connery        ')
insert into Passenger values(31,'Bruce Willis        ')
insert into Passenger values(37,'Mullah Omar         ')

GO

                                                                                                                                                                                                                                                                 
----Trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Trip values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','1900-01-01 14:30:00.000','1900-01-01 17:50:00.000')
insert into Trip values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','1900-01-01 08:12:00.000','1900-01-01 11:45:00.000')
insert into Trip values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','1900-01-01 16:20:00.000','1900-01-01 03:40:00.000')
insert into Trip values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','1900-01-01 09:00:00.000','1900-01-01 19:50:00.000')
insert into Trip values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','1900-01-01 09:35:00.000','1900-01-01 11:23:00.000')
insert into Trip values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','1900-01-01 17:55:00.000','1900-01-01 20:01:00.000')
insert into Trip values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 06:12:00.000','1900-01-01 08:01:00.000')
insert into Trip values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 12:35:00.000','1900-01-01 14:30:00.000')
insert into Trip values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 15:42:00.000','1900-01-01 17:39:00.000')
insert into Trip values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 22:50:00.000','1900-01-01 00:48:00.000')
insert into Trip values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','1900-01-01 23:30:00.000','1900-01-01 01:11:00.000')
insert into Trip values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','1900-01-01 04:00:00.000','1900-01-01 05:45:00.000')
insert into Trip values(7771,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 01:00:00.000','1900-01-01 11:00:00.000')
insert into Trip values(7772,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 12:00:00.000','1900-01-01 02:00:00.000')
insert into Trip values(7773,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 03:00:00.000','1900-01-01 13:00:00.000')
insert into Trip values(7774,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 14:00:00.000','1900-01-01 06:00:00.000')
insert into Trip values(7775,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 09:00:00.000','1900-01-01 20:00:00.000')
insert into Trip values(7776,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 18:00:00.000','1900-01-01 08:00:00.000')
insert into Trip values(7777,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 18:00:00.000','1900-01-01 06:00:00.000')
insert into Trip values(7778,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 22:00:00.000','1900-01-01 12:00:00.000')
insert into Trip values(8881,5,'Boeing    ','London                   ','Paris                    ','1900-01-01 03:00:00.000','1900-01-01 04:00:00.000')
insert into Trip values(8882,5,'Boeing    ','Paris                    ','London                   ','1900-01-01 22:00:00.000','1900-01-01 23:00:00.000')

GO

                                                                                                                                                                                                                                                                 
----Pass_in_trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Pass_in_trip values(1100,'2003-04-29 00:00:00.000',1,'1a        ')
insert into Pass_in_trip values(1123,'2003-04-05 00:00:00.000',3,'2a        ')
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00.000',1,'4c        ')
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00.000',6,'4b        ')
insert into Pass_in_trip values(1124,'2003-04-02 00:00:00.000',2,'2d        ')
insert into Pass_in_trip values(1145,'2003-04-05 00:00:00.000',3,'2c        ')
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',1,'1a        ')
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',6,'1b        ')
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00.000',8,'3c        ')
insert into Pass_in_trip values(1181,'2003-04-13 00:00:00.000',5,'1b        ')
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00.000',5,'4b        ')
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00.000',8,'3a        ')
insert into Pass_in_trip values(1188,'2003-04-01 00:00:00.000',8,'3a        ')
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00.000',9,'6d        ')
insert into Pass_in_trip values(1145,'2003-04-25 00:00:00.000',5,'1d        ')
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00.000',10,'3d        ')
insert into Pass_in_trip values(8882,'2005-11-06 00:00:00.000',37,'1a        ') 
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00.000',37,'1c        ') 
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00.000',37,'1a        ') 
insert into Pass_in_trip values(8881,'2005-11-08 00:00:00.000',37,'1d        ') 
insert into Pass_in_trip values(7778,'2005-11-05 00:00:00.000',10,'2a        ') 
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',10,'3a        ')
insert into Pass_in_trip values(7771,'2005-11-04 00:00:00.000',11,'4a        ')
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00.000',11,'1b        ')
insert into Pass_in_trip values(7771,'2005-11-09 00:00:00.000',11,'5a        ')
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00.000',12,'1d        ')
insert into Pass_in_trip values(7773,'2005-11-07 00:00:00.000',13,'2d        ')
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',13,'1b        ')
insert into Pass_in_trip values(8882,'2005-11-13 00:00:00.000',14,'3d        ')
insert into Pass_in_trip values(7771,'2005-11-14 00:00:00.000',14,'4d        ')
insert into Pass_in_trip values(7771,'2005-11-16 00:00:00.000',14,'5d        ')
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00.000',14,'1c        ')

GO


