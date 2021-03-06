USE [master]
GO
/****** Object:  Database [AUTOMOBILI]    Script Date: 5/9/2019 7:48:13 AM ******/
CREATE DATABASE [AUTOMOBILI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AUTOMOBILI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AUTOMOBILI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AUTOMOBILI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AUTOMOBILI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AUTOMOBILI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AUTOMOBILI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AUTOMOBILI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET ARITHABORT OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AUTOMOBILI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AUTOMOBILI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AUTOMOBILI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AUTOMOBILI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AUTOMOBILI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AUTOMOBILI] SET  MULTI_USER 
GO
ALTER DATABASE [AUTOMOBILI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AUTOMOBILI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AUTOMOBILI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AUTOMOBILI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AUTOMOBILI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AUTOMOBILI] SET QUERY_STORE = OFF
GO
USE [AUTOMOBILI]
GO
/****** Object:  Table [dbo].[CHAT]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHATOVI]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHATOVI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sadrzaj] [nvarchar](max) NULL,
	[Poslao] [int] NULL,
	[Primio] [int] NULL,
	[Chat] [int] NULL,
	[Stanje] [int] NULL,
	[Datum] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KORISNICI]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KORISNICI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](25) NULL,
	[MeJL] [nvarchar](30) NULL,
	[LOZINKA] [nvarchar](20) NULL,
	[IME] [nvarchar](25) NULL,
	[PREZIME] [nvarchar](25) NULL,
	[OVLASCENJE] [int] NULL,
	[VREME_REGISTRACIJE] [datetime] NULL,
	[TOKEN] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PORUKE_PREGLED]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PORUKE_PREGLED]
AS
SELECT CHAT.ID, CHAT.Naslov, (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat) as DATUM, (SELECT STANJE FROM CHATOVI WHERE Datum = (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Stanje, (SELECT KORISNICI.USERNAME FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Poslao WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Poceo_chat, (SELECT KORISNICI.USERNAME FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Primio WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Sagovornik FROM CHAT 
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marka](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modeli]    Script Date: 5/9/2019 7:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modeli](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](15) NULL,
	[Marka] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auti]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auti](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Marka] [int] NULL,
	[Model] [int] NULL,
	[Karoserija] [int] NULL,
	[Gorivo] [int] NULL,
	[Vrata] [int] NULL,
	[Lokacija] [int] NULL,
	[Unos_vreme] [datetime] NULL,
	[Cena] [int] NULL,
	[Godiste] [int] NULL,
	[Kilometraza] [int] NULL,
	[Oznaka] [varchar](35) NULL,
	[Kubikaza] [int] NULL,
	[Menjac] [int] NULL,
	[Snaga] [varchar](20) NULL,
	[Registracija] [date] NULL,
	[Volan] [int] NULL,
	[Pogon] [int] NULL,
	[Cena_status] [int] NULL,
	[Zamena] [int] NULL,
	[Registrovan_do] [date] NULL,
	[Boja] [int] NULL,
	[Klima] [int] NULL,
	[Poreklo] [int] NULL,
	[OPIS] [nvarchar](max) NULL,
	[Vlasnik] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PREGLED]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PREGLED] AS SELECT MArka.Naziv as MARKA, Modeli.Model FROM AUTI INNER JOIN MARKA ON MARKA.ID = AUTI.Marka INNER JOIN MODELI ON MODELI.ID = AUTI.Model WHERE AUTI.ID = 4
GO
/****** Object:  View [dbo].[MSG_PREGLED]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MSG_PREGLED]
AS
SELECT CHAT.ID, CHAT.Naslov, (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat) as DATUM, (SELECT STANJE FROM CHATOVI WHERE Datum = (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Stanje, (SELECT Poslao FROM CHATOVI WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Poceo_chat, (SELECT Primio FROM CHATOVI WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Sagovornik FROM CHAT 

GO
/****** Object:  Table [dbo].[BOJA]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOJA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DODATNA]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DODATNA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](30) NOT NULL,
	[Kola] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gorivo]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gorivo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karoserija]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karoserija](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KLIMA]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KLIMA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lokacija]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lokacija](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](25) NULL,
 CONSTRAINT [pkeylokacija] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menjac]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menjac](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OVLASCENJA]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OVLASCENJA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POGON]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POGON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POREKLO]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POREKLO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROCITANO]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCITANO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_CENE]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_CENE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TELEFONI]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TELEFONI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TELEFON] [nvarchar](11) NULL,
	[KORISNIK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOLAN]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOLAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vrata]    Script Date: 5/9/2019 7:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vrata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](10) NULL,
 CONSTRAINT [pkeyvrata] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZAMENA]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZAMENA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auti] ON 

INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (59, 3, 8, 1, 2, 2, 15, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 4000, 2001, 300002, N'B6 1.9TDI', 1789, 2, N'92', NULL, 1, 1, 2, 1, CAST(N'2019-10-19' AS Date), 1, 3, 1, N'LEPI PLAVI AUTO, DA NE KAZEM GGGROM!', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (60, 3, 8, 3, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 5000, 2004, 235000, N'B6 1.9TDI', 1899, 3, N'89', NULL, 1, 1, 2, 4, CAST(N'2020-04-19' AS Date), 5, 3, 1, N'crni auto drugi po redu Koja vlasnik zvati posle 5', 34)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (61, 3, 8, 1, 1, 2, 13, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 1000, 2003, 135000, N'B6 1.9TDI', 1899, 3, N'89', NULL, 1, 1, 2, 1, CAST(N'2019-12-19' AS Date), 1, 2, 3, N'treci unos po redu isto Koja vlasnik zvati posle 5 :D', 34)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (62, 3, 12, 1, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 5200, 2004, 340000, N'2.5TDI', 2500, 3, N'110', NULL, 1, 1, 2, 1, CAST(N'2019-04-19' AS Date), 7, 2, 1, N'Srebrni A8 Ceca :D', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (63, 3, 10, 3, 1, 2, 2, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 4500, 2003, 320000, N'2.5 TDI', 2500, 5, N'110', NULL, 1, 1, 2, 2, CAST(N'2020-04-19' AS Date), 7, 3, 1, N'karavan 2.5 tdi u odlicnom stanju', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (65, 2, 33, 1, 2, 2, 16, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 300, 1997, 400000, N'2.0i', 2000, 2, N'96', NULL, 1, 1, 2, 1, CAST(N'2020-04-19' AS Date), 2, 1, 1, N'', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (66, 2, 36, 1, 2, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 4350, 2009, 230000, N'1.8B', 1796, 3, N'103', NULL, 1, 1, 2, 1, NULL, 3, 3, 1, N'CRVENA ALFA VEOMA LEPA ZVATI POSLE 5 Ceca', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (67, 2, 36, 3, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 2999, 2010, 120000, N'1.9mJTD', 1900, 3, N'110', NULL, 1, 1, 2, 1, CAST(N'2019-12-19' AS Date), 14, 3, 1, N'karavan alfa, crna
Ceca prodavac', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (68, 2, 35, 1, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 2300, 2001, 230000, N'1.9mjet', 1900, 2, N'81', NULL, 1, 1, 2, 1, CAST(N'2020-04-19' AS Date), 14, 3, 2, N'156 ocuvana, Ceca', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (69, 3, 7, 1, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 5400, 2007, 182000, N'full', 1998, 3, N'125', NULL, 1, 1, 1, 1, NULL, 5, 3, 1, N'lep ovaj A3, ceca', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (70, 23, 17, 3, 1, 2, 16, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 2550, 2002, 300000, N'1.9 TDI', 1900, 3, N'96', NULL, 1, 1, 1, 1, NULL, 14, 2, 1, N'prvi golf Ceca zvati posle 6', 20)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (71, 23, 17, 2, 1, 2, 2, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 3500, 2004, 120000, N'1,9TDI', 1900, 3, N'96', NULL, 1, 1, 2, 1, CAST(N'2019-04-19' AS Date), 14, 3, 1, N'golf kao pedjin samo sa 3 vrata Miki vlasnik, zvati posle 6', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (72, 23, 20, 2, 1, 2, 15, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 7000, 2013, 150000, N'1.6 TDI', 1600, 3, N'80', NULL, 1, 1, 2, 1, NULL, 7, 3, 1, N'srebrna sedmica, Miki vlasnik zvati posle 5', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (73, 23, 31, 1, 1, 2, 1, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 14000, 2015, 130000, N'2.0 TDI', 2000, 3, N'110', NULL, 1, 1, 1, 1, CAST(N'2019-04-19' AS Date), 1, 3, 1, N'lep pasat, Miki vlasnik zvati posle 7 :D', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (74, 2, 33, 2, 2, 2, 1, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 1000, 1999, 230000, N'2.0TS', 1988, 2, N'96', NULL, 2, 1, 1, 1, NULL, 1, 2, 1, N'wwqweweqwe', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (75, 2, 32, 2, 2, 1, 14, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 1100, 1997, 350000, N'1.8TS', 1988, 2, N'92', NULL, 1, 1, 1, 1, CAST(N'2019-04-24' AS Date), 1, 1, 1, N'eeee', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (76, 2, 32, 2, 2, 1, 3, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 800, 1997, 345000, N'2.0 TS', 1998, 2, N'92', NULL, 1, 1, 2, 1, NULL, 14, 1, 1, N'Ovo je crvena alfa yeah!', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (79, 2, 32, 3, 2, 1, 14, CAST(N'2019-04-25T00:00:00.000' AS DateTime), 2000, 2001, 234567, N'1.8TS', 1988, 3, N'92', NULL, 1, 1, 1, 1, NULL, 1, 1, 1, N'', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (80, 2, 32, 3, 2, 1, 14, CAST(N'2019-04-25T00:00:00.000' AS DateTime), 900, 2001, 234567, N'1.8TS', 1988, 3, N'92', NULL, 1, 1, 2, 1, CAST(N'2019-05-26' AS Date), 1, 1, 1, N'unos novih slika update', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (92, 2, 32, 2, 2, 1, 1, CAST(N'2019-04-26T00:00:00.000' AS DateTime), 400, 1997, 400000, N'2.0TS', 2000, 2, N'100', NULL, 1, 1, 2, 1, NULL, 13, 1, 1, N'da li ce ovo raditi?oprema test
IZMENA
VRACENO', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (99, 3, 8, 3, 1, 2, 1, CAST(N'2019-04-27T00:00:00.000' AS DateTime), 13290, 2015, 500000, N'2.0 TDI XENON', 1968, 3, N'110', NULL, 1, 1, 1, 1, NULL, 6, 2, 1, N'Beli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cenaBeli audi, dobra cena', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (102, 2, 36, 1, 1, 2, 1, CAST(N'2019-05-04T08:51:09.387' AS DateTime), 3600, 2008, 234000, N'1.9 mjet', 1889, 3, N'110', NULL, 1, 1, 2, 1, CAST(N'2019-05-04' AS Date), 5, 3, 1, N'Crna alfa 159 usluzni oglas', 34)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (103, 2, 35, 1, 2, 2, 1, CAST(N'2019-05-04T08:56:21.753' AS DateTime), 1500, 2003, 300000, N'2.0TS', 1998, 3, N'81', NULL, 1, 1, 2, 1, CAST(N'2020-05-04' AS Date), 7, 3, 1, N'alfa 156 TS', 34)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (104, 23, 20, 2, 1, 2, 2, CAST(N'2019-05-04T09:36:21.920' AS DateTime), 9990, 2013, 200000, N'mk2', 1800, 3, N'80', NULL, 1, 1, 1, 1, NULL, 7, 3, 1, N'Golf 7 KONACNA VERZIJA!', 34)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (105, 23, 17, 2, 1, 2, 1, CAST(N'2019-05-05T15:04:23.927' AS DateTime), 4000, 2003, 230000, N'1.9 TDI', 1899, 3, N'74', NULL, 1, 1, 2, 1, CAST(N'2020-05-05' AS Date), 14, 3, 1, N'auto kao Pedjin
peomena', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (107, 23, 29, 1, 1, 2, 1, CAST(N'2019-05-07T20:21:13.723' AS DateTime), NULL, 2005, 2300000, N'B8 1.9TDI', 1889, 3, N'110', NULL, 1, 1, 2, 1, NULL, 14, 3, 1, N'PASSAT B6 povoljno zvati posle 17
', 1)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (108, 2, 33, 2, 2, 2, 1, CAST(N'2019-05-07T22:45:44.957' AS DateTime), 950, 2001, 230000, N'1.8 TS', 1900, 2, N'96', NULL, 1, 1, 1, 1, NULL, 14, 1, 1, N'ALFA 146 TEGET
vraceno staro', 58)
INSERT [dbo].[Auti] ([ID], [Marka], [Model], [Karoserija], [Gorivo], [Vrata], [Lokacija], [Unos_vreme], [Cena], [Godiste], [Kilometraza], [Oznaka], [Kubikaza], [Menjac], [Snaga], [Registracija], [Volan], [Pogon], [Cena_status], [Zamena], [Registrovan_do], [Boja], [Klima], [Poreklo], [OPIS], [Vlasnik]) VALUES (111, 23, 29, 3, 1, 2, 1, CAST(N'2019-05-08T20:38:18.340' AS DateTime), 5000, 2019, 240000, N'B6 1.9TDI', 2000, 3, N'110', NULL, 1, 1, 2, 1, CAST(N'2020-05-08' AS Date), 14, 3, 1, N'PASSAT B6 1.9TDI', 61)
SET IDENTITY_INSERT [dbo].[Auti] OFF
SET IDENTITY_INSERT [dbo].[BOJA] ON 

INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (1, N'Plava')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (2, N'Žuta')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (3, N'Crvena')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (4, N'Zelena')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (5, N'Crna')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (6, N'Bela')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (7, N'Siva')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (8, N'Zlatna')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (9, N'Smedja')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (10, N'Teget')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (11, N'Ljubicasta')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (12, N'Braon')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (13, N'Narandžasta')
INSERT [dbo].[BOJA] ([ID], [Naziv]) VALUES (14, N'Teget')
SET IDENTITY_INSERT [dbo].[BOJA] OFF
SET IDENTITY_INSERT [dbo].[CHAT] ON 

INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (7, N'pitanje?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (8, N'message?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1008, N'poruka')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1009, N'E bRATe')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1010, N'Sta ima?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1011, N'hej')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1012, N'TEBRA HEJ!')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1013, N'hej hej what up!')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1014, N'buckuris')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1015, N'Druze da li si ti lu')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1016, N'Kojo??')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1017, N'samo 50 cent')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1018, N'posto ')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1019, N'Milose')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1020, N'da proverim jos jedn')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1021, N'modal ')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1022, N'uspeh?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1023, N'again?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1024, N'33')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1025, N'22')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1026, N'22')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1027, N'44')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1028, N'77')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1029, N'testing testing')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1030, N'eeeeee')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1031, N'da li je ovo konacno')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1032, N'upisi neki text')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1033, N'34')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1034, N'...')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1035, N'pitanje?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1036, N'ttt')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1037, N'PROBA SLANJE PORUKA')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1038, N'niza cena?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1039, N'Pitanje?')
INSERT [dbo].[CHAT] ([ID], [Naslov]) VALUES (1040, N'pitanje?')
SET IDENTITY_INSERT [dbo].[CHAT] OFF
SET IDENTITY_INSERT [dbo].[CHATOVI] ON 

INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (5, N'nekaporuka', 1, 34, 7, 1, CAST(N'2019-04-14T07:29:13.783' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (6, N'sta bi sa onim?', 34, 1, 8, 1, CAST(N'2019-04-14T07:32:01.847' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (7, N'odgovor', 34, 1, 7, 1, CAST(N'2019-04-14T07:32:37.187' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (8, N'osmo sednica', 34, 1, 8, 1, CAST(N'2019-04-14T07:54:00.167' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1005, N'dfghrfgh', 21, 20, 1008, 1, CAST(N'2019-04-14T20:34:58.063' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1006, N'Koliko ti kosta ovaj auto poz?', 1, 34, 1009, 1, CAST(N'2019-04-15T13:07:34.040' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1007, N'Kojo de si? :)', 1, 34, 1010, 1, CAST(N'2019-04-15T14:08:05.993' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1008, N'koliko para?', 20, 34, 1011, 1, CAST(N'2019-04-16T11:34:38.697' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1009, N'moze neka zamena!?', 34, 1, 1012, 1, CAST(N'2019-04-16T21:54:01.863' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1010, N'sup niggaz', 1, 34, 1013, 1, CAST(N'2019-04-16T23:11:28.083' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1011, N'ertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertqertqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ertqertq', 1, 34, 1014, 1, CAST(N'2019-04-17T08:08:31.617' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1012, N'nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333nekiw33333333333333333333333333', 34, 34, 1015, 1, CAST(N'2019-04-17T09:29:43.390' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1013, N'Izlazimo veceras?', 1, 34, 1016, 1, CAST(N'2019-04-17T23:14:47.547' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1017, N'sto se ne javljas?', 1, 34, 1016, 1, CAST(N'2019-04-18T10:10:23.143' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1018, N'Covece da li su lud? :))))', 34, 1, 1014, 1, CAST(N'2019-04-18T10:16:03.877' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1019, N'druze koja je zadnja cena? :D', 20, 34, 1011, 1, CAST(N'2019-04-18T10:58:22.240' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1020, N'za tebe 2400e ', 34, 20, 1011, 1, CAST(N'2019-04-18T10:59:05.237' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1021, N'to je muzika koju ja volim slusat :D', 20, 34, 1017, 1, CAST(N'2019-04-18T11:01:14.913' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1022, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T19:26:50.360' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1023, N'javi se :)', 1, 34, 1016, 1, CAST(N'2019-04-18T19:37:34.347' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1024, N'poslao u medjuvremenu', 34, 1, 1016, 1, CAST(N'2019-04-18T19:40:27.963' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1025, N'gledam da li je povukao poruku u medjuvremenu?', 1, 34, 1016, 1, CAST(N'2019-04-18T19:41:00.810' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1026, N'meanwhile koja', 34, 1, 1016, 1, CAST(N'2019-04-18T19:47:21.320' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1027, N'opet koja meanwhile', 34, 1, 1016, 1, CAST(N'2019-04-18T19:49:10.523' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1028, N'saljem koji, koji je u medjuvremenu poslao poruku :D', 1, 34, 1016, 1, CAST(N'2019-04-18T19:49:36.283' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1029, N'stizem za 5 min :D', 1, 34, 1016, 1, CAST(N'2019-04-18T21:23:48.720' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1030, N'ipak za 10 min :DDDD', 1, 34, 1016, 1, CAST(N'2019-04-18T21:25:50.450' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1031, N'hej hej', 1, 34, 1016, 1, CAST(N'2019-04-18T21:38:30.763' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1032, N'naci cu joj zamenu', 34, 1, 1016, 1, CAST(N'2019-04-18T21:39:11.730' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1033, N'hej hej againg', 1, 34, 1016, 1, CAST(N'2019-04-18T21:39:29.127' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1034, N'poslao izmedju', 1, 34, 1016, 1, CAST(N'2019-04-18T21:45:18.387' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1035, N'Miki Sta radis?', 34, 1, 1016, 1, CAST(N'2019-04-18T21:45:33.993' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1036, N'Evo me :D', 34, 1, 1010, 1, CAST(N'2019-04-18T21:46:11.357' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1037, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T21:47:22.543' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1038, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T21:52:12.747' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1039, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T21:52:58.197' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1040, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T21:53:18.360' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1041, N'ovo je neki tekst poruke', 1, 34, 1016, 1, CAST(N'2019-04-18T21:55:18.117' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1042, N'brzi sam', 34, 1, 1016, 1, CAST(N'2019-04-18T21:57:17.030' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1043, N'zadnja proba', 1, 34, 1016, 1, CAST(N'2019-04-18T21:57:27.997' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1044, N'VIDI OVO BEZ RUKU!!!! :DDDD', 34, 1, 1016, 1, CAST(N'2019-04-19T08:50:45.880' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1045, N'MATORI NE SPAMUJ MI INBOX : DD', 1, 34, 1016, 1, CAST(N'2019-04-19T08:51:27.357' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1046, N'ovu sam poslao prvu 1', 34, 1, 1016, 1, CAST(N'2019-04-19T08:52:26.027' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1047, N'ovu sam poslao drugu 2:)', 34, 1, 1010, 1, CAST(N'2019-04-19T08:52:46.863' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1048, N'ovo je samo proba: D', 20, 21, 1008, 1, CAST(N'2019-04-19T08:58:22.097' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1049, N'Druze sta pricas ti, kakva osma sednica ? :D', 1, 34, 8, 1, CAST(N'2019-04-19T11:16:09.727' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1050, N'Znam sta pricam :)))))', 34, 1, 8, 1, CAST(N'2019-04-19T11:16:42.330' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1051, N'Kojo proveravam nesto :D', 1, 34, 8, 1, CAST(N'2019-04-20T12:18:17.177' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1052, N'Nema frke :D', 34, 1, 8, 1, CAST(N'2019-04-20T12:18:38.230' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1053, N'zdravo Mirjana :D', 1, 34, 8, 1, CAST(N'2019-04-21T13:11:22.090' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1054, N'ovo sam poslao u medjuvremenu', 1, 34, 8, 1, CAST(N'2019-04-21T13:13:35.930' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1055, N'Ovde misa :D', 34, 1, 8, 1, CAST(N'2019-04-21T13:14:02.997' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1056, N'Ovde proba:DD', 1, 34, 8, 1, CAST(N'2019-04-23T14:08:42.553' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1057, N'Testing 1,2,3', 1, 34, 8, 1, CAST(N'2019-04-24T20:46:36.577' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1058, N'moze nize?!', 34, 1, 1018, 1, CAST(N'2019-04-29T10:41:58.170' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1059, N'moze za tebe brate 50e', 1, 34, 1018, 1, CAST(N'2019-04-29T10:42:21.267' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1060, N'mozda i citavih 100 evra', 1, 34, 1018, 1, CAST(N'2019-04-29T10:43:59.913' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1061, N'kada moze da se vidi auto?', 34, 1, 1018, 1, CAST(N'2019-04-29T10:44:12.043' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1062, N'PROBA PROBA PROBA ', 34, 1, 1019, 1, CAST(N'2019-05-01T11:24:45.580' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1063, N'rip night king', 34, 1, 1020, 1, CAST(N'2019-05-01T12:18:26.890' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1064, N'useh?', 34, 1, 1021, 1, CAST(N'2019-05-01T13:22:20.653' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1065, N'uspeh?', 34, 1, 1022, 1, CAST(N'2019-05-01T13:25:13.767' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1066, N'again?', 34, 1, 1023, 1, CAST(N'2019-05-01T13:29:30.893' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1067, N'33', 34, 1, 1024, 1, CAST(N'2019-05-01T13:53:28.557' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1068, N'22', 34, 1, 1025, 1, CAST(N'2019-05-01T13:57:59.857' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1069, N'22', 34, 1, 1026, 1, CAST(N'2019-05-01T14:04:58.290' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1070, N'44', 34, 1, 1027, 1, CAST(N'2019-05-01T14:08:36.420' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1071, N'77', 34, 1, 1028, 1, CAST(N'2019-05-01T14:10:19.773' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1072, N'zaboravio sam sve rodjendane ove godine', 34, 1, 1029, 1, CAST(N'2019-05-01T15:14:43.680' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1073, N'ee', 34, 1, 1030, 1, CAST(N'2019-05-01T15:16:17.713' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1074, N'da da da', 34, 1, 1031, 1, CAST(N'2019-05-01T15:19:57.887' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1075, N'neki text', 34, 1, 1032, 1, CAST(N'2019-05-01T15:22:11.257' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1076, N'34', 34, 1, 1033, 1, CAST(N'2019-05-01T15:41:59.793' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1077, N'...', 34, 1, 1034, 1, CAST(N'2019-05-01T17:58:11.077' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1078, N'koja je najniza cena poyyy', 1, 43, 1035, 1, CAST(N'2019-05-02T12:54:50.990' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1079, N'Cena je fiksna pozdrav.', 43, 1, 1035, 1, CAST(N'2019-05-02T12:55:20.457' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1080, N'ttt', 1, 34, 1036, 1, CAST(N'2019-05-06T07:51:56.030' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1081, N'pozdrav!', 1, 34, 1034, 1, CAST(N'2019-05-06T22:36:42.687' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1082, N'pozsdrav nazad !', 34, 1, 1034, 1, CAST(N'2019-05-06T22:37:05.897' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1083, N'PROBA PROBA PROBA', 34, 1, 1037, 1, CAST(N'2019-05-07T12:04:59.140' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1084, N'PRIMIO PORUKU.', 1, 34, 1037, 1, CAST(N'2019-05-07T12:05:38.677' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1085, N'poslao u medjuvremenu', 1, 34, 1037, 1, CAST(N'2019-05-07T12:06:38.950' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1086, N'SALJEM OVO', 34, 1, 1037, 1, CAST(N'2019-05-07T12:06:58.240' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1087, N'koja je najniza?pozdrav', 58, 1, 1038, 1, CAST(N'2019-05-07T22:48:29.787' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1088, N'850e', 1, 58, 1038, 1, CAST(N'2019-05-07T22:49:02.577' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1089, N'Da li moze niza cena i koliko?
Pozdrav', 60, 58, 1039, 1, CAST(N'2019-05-08T15:15:06.880' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1090, N'Moze, kada budete videli auto.
Pozdav', 58, 60, 1039, 1, CAST(N'2019-05-08T15:16:44.607' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1091, N'121212', 1, 58, 1038, 1, CAST(N'2019-05-08T16:08:52.627' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1092, N'Koja je najniza cena?
pozdrav', 61, 1, 1040, 1, CAST(N'2019-05-08T20:39:56.887' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1093, N'Najniza cena je 1000e
pozdrav', 1, 61, 1040, 1, CAST(N'2019-05-08T20:40:25.283' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1094, N'PROBA PORUKA', 1, 34, 1037, 1, CAST(N'2019-05-08T23:05:38.717' AS DateTime))
INSERT [dbo].[CHATOVI] ([ID], [Sadrzaj], [Poslao], [Primio], [Chat], [Stanje], [Datum]) VALUES (1095, N'OPET PROBA', 34, 1, 1037, 1, CAST(N'2019-05-08T23:06:20.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[CHATOVI] OFF
SET IDENTITY_INSERT [dbo].[DODATNA] ON 

INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1337, N'Elektricni podizaci', 102)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1338, N'Servo', 102)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1345, N'Elektricni podizaci', 103)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1346, N'Servo', 103)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1361, N'Elektricni podizaci', 104)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1362, N'Servo', 104)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1369, N'Elektricni podizaci', 105)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1370, N'Servo', 105)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1385, N'Elektricni podizaci', 107)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1386, N'Servo', 107)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1393, N'Elektricni podizaci', 108)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1394, N'Servo', 108)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1395, N'Elektricni retrovizori', 108)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1396, N'Putni racunar', 108)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1397, N'Centralna brava', 108)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1419, N'Elektricni podizaci', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1420, N'Servo', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1421, N'Elektricni retrovizori', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1422, N'Putni racunar', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1423, N'Centralna brava', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1424, N'Daljinsko zakljucavanje', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1425, N'Metalik boja', 111)
INSERT [dbo].[DODATNA] ([ID], [Naziv], [Kola]) VALUES (1426, N'Tonirana stakla', 111)
SET IDENTITY_INSERT [dbo].[DODATNA] OFF
SET IDENTITY_INSERT [dbo].[Gorivo] ON 

INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (1, N'Dizel')
INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (2, N'Benzin')
INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (3, N'TNG')
INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (4, N'Hibridni pogon')
INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (5, N'Elektricni pogon')
INSERT [dbo].[Gorivo] ([ID], [Naziv]) VALUES (6, N'Metan')
SET IDENTITY_INSERT [dbo].[Gorivo] OFF
SET IDENTITY_INSERT [dbo].[Karoserija] ON 

INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (1, N'Limuzina')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (2, N'Hecbek')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (3, N'Karavan')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (4, N'Kupe')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (5, N'Kabriolet')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (6, N'Dzip')
INSERT [dbo].[Karoserija] ([ID], [Naziv]) VALUES (7, N'Pickup')
SET IDENTITY_INSERT [dbo].[Karoserija] OFF
SET IDENTITY_INSERT [dbo].[KLIMA] ON 

INSERT [dbo].[KLIMA] ([ID], [Naziv]) VALUES (1, N'Nema klimu')
INSERT [dbo].[KLIMA] ([ID], [Naziv]) VALUES (2, N'Manuelna klima')
INSERT [dbo].[KLIMA] ([ID], [Naziv]) VALUES (3, N'Automatska klima')
SET IDENTITY_INSERT [dbo].[KLIMA] OFF
SET IDENTITY_INSERT [dbo].[KORISNICI] ON 

INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (1, N'MikiRubio10', N'miki@gmail.com', N'1111', N'Milos', N'Stojanovic', 2, NULL, NULL)
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (2, N'ObriVanKenobi5', N'obren@gmail.com', N'2222', N'Obren', N'Misirlic', 2, NULL, NULL)
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (6, N'Jelena', N'Jelena@gmail.com', N'Beograd10', N'JElena', N'Stojnic', 2, CAST(N'2019-04-08T18:14:39.330' AS DateTime), NULL)
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (7, N'Jelica', N'jeca@gmail.com', N'Beograd10', N'JECA', N'DRAGIC', 2, CAST(N'2019-04-08T21:23:05.717' AS DateTime), N's_7wUSsS7ES19wK1bKvCNQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (8, N'Draginja', N'draga@gmail.com', N'Beograd10', N'Draga', N'Dragic', 2, CAST(N'2019-04-08T21:27:58.257' AS DateTime), N'AkweBpEQaUmnczuc1qU2Uw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (9, N'Zdravko', N'Zdravko@gmail.com', N'Beograd10', N'Zdrako', N'Zdravkovic', 2, CAST(N'2019-04-08T21:32:17.430' AS DateTime), N'fm23cmQCG0qvbnQJY2fX2w')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (10, N'Micik', N'micika@gmail.com', N'Beograd10', N'Milena', N'Dragic', 2, CAST(N'2019-04-08T21:34:38.807' AS DateTime), N'ALPxEx7a9Eu-kUPwEY-FyA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (11, N'Nemanja', N'nemanja@gmail.com', N'Beograd10', N'Neca', N'Arsekic', 2, CAST(N'2019-04-08T21:39:51.157' AS DateTime), N'VKe_VNJzNUed3oItfjwu7g')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (12, N'Nikola', N'kova@gmail.com', N'Beograd10', N'Nikola', N'Kovandzic', 2, CAST(N'2019-04-08T21:42:56.590' AS DateTime), N'Twyz1_V9b0OLVtRBMpymmw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (13, N'Kosta', N'kosta@gmail.com', N'Beograd10', N'Kole', N'Kostic', 2, CAST(N'2019-04-08T22:43:42.773' AS DateTime), N'1_khqhZgXkODvq6Pj7oWWg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (14, N'Zlatko', N'zlatko@gmail.com', N'Beograd10', N'Zlaja', N'Opacic', 2, CAST(N'2019-04-08T22:49:14.960' AS DateTime), N'l38GL2JwfUCZyiEHJqgpgQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (15, N'LAKI', N'laki@gmail.com', N'Beograd10', N'Lazar', N'Stojanovic', 2, CAST(N'2019-04-08T23:02:27.853' AS DateTime), N'Ts00JKCLjESuQ--dacRf8A')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (16, N'Gaga', N'gaga@gmail.com', N'Beograd10', N'Dragana', N'Stojanovic', 2, CAST(N'2019-04-08T23:04:20.630' AS DateTime), N'lDs2J3p8E0WTKlcPHRYQWg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (17, N'Drago', N'drago@gmail.com', N'Beograd10', N'Dragomir', N'Dejanovic', 2, CAST(N'2019-04-08T23:10:37.863' AS DateTime), N'WUfFXmI_gU6kk79XNTbSDg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (18, N'Milance', N'milan@gmail.com', N'Beograd10', N'Milan', N'Djokic', 2, CAST(N'2019-04-09T08:27:48.860' AS DateTime), N'wKsbxjQwVEKJc5E_U5CpDw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (19, N'Katarin', N'kaca@gmail.com', N'Beograd10', N'Katarina', N'Mitrovic', 2, CAST(N'2019-04-09T09:24:35.737' AS DateTime), N'JDM5Gs7nsEq29BvPZB1eFA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (20, N'Ceca', N'ceca@gmail.com', N'Beograd10', N'Svetlana', N'Bajic', 2, CAST(N'2019-04-09T09:27:53.260' AS DateTime), N'Ava7pMQZwkCz-GD8RzdiaA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (21, N'Goran', N'goran@gmail.com', N'Beograd10', N'Goran', N'Goranic', 2, CAST(N'2019-04-09T09:31:35.313' AS DateTime), N'grPjt_FTGkSOnIrSTLpw3Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (22, N'sanjaica', N'sanja@gmail.com', N'Beograd10', N'Sanja', N'Smiljkovic', 2, CAST(N'2019-04-09T09:41:23.813' AS DateTime), N'B8MwAXdQEEeWAHrpaLJ2-w')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (23, N'Danaja', N'danaj@gmail.com', N'Beograd10', N'Danaja', N'Milic', 2, CAST(N'2019-04-09T09:44:59.500' AS DateTime), N'ZwKENS-DNkiKUTDS1rzEaw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (24, N'Zelja', N'zelja@gmail.com', N'Beograd10', N'Zeljko', N'mitrovic', 2, CAST(N'2019-04-09T10:16:00.707' AS DateTime), N'PeO0J_5NIEml_lE-J1T8Rg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (25, N'Uki', N'uki@gmail.com', N'Beograd10', N'Uros', N'Avramovic', 2, CAST(N'2019-04-09T11:13:32.033' AS DateTime), N'rnYXCLsP0EqMRHguaBpkrQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (26, N'Joca', N'jocs@gmail.com', N'Beograd10', N'Jovan', N'vukadinovic', 2, CAST(N'2019-04-09T21:59:48.457' AS DateTime), N'QdsKI33LNka9vyd7ImoqPA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (27, N'Zoka', N'zoka@gmail.com', N'Beograd10', N'Zorana', N'Vukovic', 2, CAST(N'2019-04-09T22:06:10.883' AS DateTime), N'pWKpj__YM0uSRffZRS8FVg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (28, N'Andjelka', N'Andja@gmail.com', N'Beograd10', N'Andjelka', N'Pusic', 2, CAST(N'2019-04-09T22:09:43.613' AS DateTime), N'gZQ6c-jcQkurP4djt_mTWQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (29, N'Faje', N'faje@gmail.com', N'Beograd10', N'Milos', N'Dragic', 2, CAST(N'2019-04-09T22:22:14.913' AS DateTime), N'4OgOhjICUEG6yiN9fPT9fA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (30, N'Hloverka', N'hlovi@gmail.com', N'Beograd10', N'Hloverka', N'Juskic', 2, CAST(N'2019-04-09T22:25:33.083' AS DateTime), N'pbOPh32OdEuVKyGy1C8Tyg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (31, N'Ratko', N'ratko@gmail.com', N'Beograd10', N'Ratko', N'Miletic', 2, CAST(N'2019-04-09T22:39:46.290' AS DateTime), N'kAshkzMLH0ybGnxoZkyEdA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (32, N'Deneris', N'deni@gmail.com', N'Beograd10', N'Deneris', N'Stormborn', 2, CAST(N'2019-04-09T22:43:35.893' AS DateTime), N'fnHUkrYxwkS0_4oo_yl-QA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (33, N'Ekran', N'ekran@gmailc.com', N'Beograd10', N'Ekran', N'Ekranic', 2, CAST(N'2019-04-09T22:47:12.030' AS DateTime), N'TkdL5JXGbE6jFPstaor8PQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (34, N'Koja', N'koja@gmail.com', N'Beograd10', N'Kojot', N'Kojotovic', 2, CAST(N'2019-04-09T22:52:29.667' AS DateTime), N'BO2Cgewu6Em7HuPw0ugfOQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (35, N'Kova', N'kova@gmail.net', N'Beograd10', N'Nikola', N'Kovandzic', 2, CAST(N'2019-04-10T00:22:35.357' AS DateTime), N'LqtXKCntv0OtATg6WdhJ0Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (36, N'Zelimir', N'zelja@gmail.net', N'Beograd10', N'Zeljko', N'Obradovic', 2, CAST(N'2019-04-10T00:26:52.620' AS DateTime), N'bjaKy1Btiku6MeTp8OGydA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (37, N'Regland', N'regi@gmail.com', N'Beograd10', N'Rege', N'Land', 2, CAST(N'2019-04-10T00:29:42.167' AS DateTime), N'YuNGm3VAtU607gaU_oE-5Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (38, N'Edvin', N'edi@gmail.com', N'Beograd10', N'Edvin', N'Ludjak', 2, CAST(N'2019-04-10T00:34:52.947' AS DateTime), N'6DzyMuxCyUaILWE9DYlieA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (39, N'Lorimer', N'lori@gmail.com', N'Beograd10', N'Lorimer', N'Lorimerovic', 2, CAST(N'2019-04-10T00:38:08.887' AS DateTime), N'7r_rI_7UD0yHotUmTxngcQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (40, N'Slobodan', N'sloba@gmail.com', N'Beograd10', N'slobodan', N'veljkovic', 2, CAST(N'2019-04-10T00:40:22.183' AS DateTime), N'wTHTqCXr8keYBXuOtJdlqg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (41, N'Vangelis', N'vang@gmail.com', N'Beograd10', N'Vangelis', N'Baok', 2, CAST(N'2019-04-10T00:42:02.993' AS DateTime), N'WE9umHzCWkSn7bSEe6vgDQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (42, N'Rikardo', N'rki@gmail.com', N'Beograd10', N'Marko', N'ristic', 2, CAST(N'2019-04-10T00:43:32.297' AS DateTime), N'4lBVW5-g1UKbt2fM8uxuBg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (43, N'Gidra', N'gidra@gmail.com', N'Malagurski10', N'Milojko', N'Pantic', 2, CAST(N'2019-05-02T12:48:58.300' AS DateTime), N'VA_Z0-hdfkegJTSZxnN7HQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (44, N'Jovana', N'jovanica@gmail.com', N'Beograd10', N'Joca', N'Stanisic', 2, CAST(N'2019-05-05T19:11:07.160' AS DateTime), N'9xg7D-UVuk-5vYdAb5_VDQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (45, N'Zeljana', N'zeljka@gmail.com', N'Beograd10', N'Zeljana', N'Perisic', 2, CAST(N'2019-05-05T19:17:14.133' AS DateTime), N'BMbkIqLLd0GHFhkHt1LVTg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (46, N'Ratkovica', N'ratkovica@gmail.com', N'Beograd10', N'Ratkovica', N'Perisic', 2, CAST(N'2019-05-05T19:20:12.747' AS DateTime), N'l3I7CGmdUUKbhxBnxRdn3w')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (47, N'Trgovcevic', N'trgovcevic@gmail.com', N'Beograd10', N'nebojsa', N'trgovcevic', 2, CAST(N'2019-05-05T19:22:57.910' AS DateTime), N'mBSZ-TZFgk-3QjNt3pbh5Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (48, N'Ekatarina', N'ekatarina@gmail.com', N'Beograd10', N'Ekatarina', N'EKV', 2, CAST(N'2019-05-05T19:25:49.163' AS DateTime), N'Zt1j8GcCYUyGZoGQgTdiXg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (49, N'Rebarce', N'rebarce@gmail.com', N'Beograd10', N'Rebarce', N'Rebarce', 2, CAST(N'2019-05-05T19:29:29.467' AS DateTime), N'1qHwHXjQlESqzSDy-bKzxg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (50, N'Matora', N'matora@gmail.com', N'Beograd10', N'Matora', N'Matora', 2, CAST(N'2019-05-05T19:32:42.543' AS DateTime), N'glL-jgxSDkOYSvOfasJGKA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (51, N'BIGI', N'BIGI@gmail.com', N'Beograd10', N'BIGI', N'dogog', 2, CAST(N'2019-05-05T19:34:50.163' AS DateTime), N'LAb-z-QKhkmY47JkZGiuLA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (52, N'Dragance', N'makaveli10@verat.net', N'Beograd10', N'Dragan', N'Puaca', 2, CAST(N'2019-05-05T19:48:06.977' AS DateTime), N'z669_Iu3D0OdCVg-rn-wig')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (53, N'Mikirubio1010', N'mikirubio@gmai.com', N'Beograd10', N'milos', N'stojanovic', 2, CAST(N'2019-05-07T21:02:12.290' AS DateTime), N'xNI9LtAJNUqBKlZq10wzQA')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (54, N'MikiRubio', N'miki@gmail.kom', N'Beograd10', N'Milos', N'Stojanovic', 2, CAST(N'2019-05-07T21:29:31.707' AS DateTime), N'jzu4oWaQZUOdI6X0BpppYg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (55, N'MikRub', N'mak@gmail.net', N'Beograd10', N'milos', N'stojanovic', 2, CAST(N'2019-05-07T21:33:28.227' AS DateTime), N'esw8ogbiYkqHXK5d0MnOxg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (56, N'MilkaCanic', N'mila@gmail.com', N'Beograd10', N'Milos', N'Stojanovic', 3, CAST(N'2019-05-07T22:09:40.930' AS DateTime), N'iCFf4-rQx0uCcOyNd-rTLg')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (57, N'MilanKob', N'makaveli10@verat.com', N'Beograd10', N'Milos', N'Stojanovic', 2, CAST(N'2019-05-07T22:32:57.227' AS DateTime), N'JSkalyIp6k-UWgkcHtXM-Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (58, N'LepiDzoni', N'makaveli10@verat.zzz', N'Beograd10', N'Miki', N'Dog', 2, CAST(N'2019-05-07T22:37:19.913' AS DateTime), N'0IUxN-ggDE60_Q0uFSzfPw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (59, N'MikiRubio20', N'makaveli10@ggg.net', N'Beograd10', N'milos', N'stojanovic', 1, CAST(N'2019-05-07T22:52:17.053' AS DateTime), N'FmWUBbo40U-qIphYFl37LQ')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (60, N'Vladimir', N'vladimir@gmail.com', N'Beograd10', N'Vladimir', N'preradovic', 2, CAST(N'2019-05-08T15:05:53.817' AS DateTime), N'u1mSj7hYm0qHDSYrI-Pp3Q')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (61, N'MikiRubio30', N'milos@gmail.com', N'Beograd10', N'Milos', N'Stojanovic', 2, CAST(N'2019-05-08T20:28:24.000' AS DateTime), N'erGSyBdzt0GrjOGvz1u4Vw')
INSERT [dbo].[KORISNICI] ([ID], [USERNAME], [MeJL], [LOZINKA], [IME], [PREZIME], [OVLASCENJE], [VREME_REGISTRACIJE], [TOKEN]) VALUES (62, N'Beograd10', N'miki@verat.net', N'Beograd10', N'Milos', N'Stojanovic', 2, CAST(N'2019-05-08T23:01:20.477' AS DateTime), N'Bpc7Mq0QRkGzKtkqRxJqDg')
SET IDENTITY_INSERT [dbo].[KORISNICI] OFF
SET IDENTITY_INSERT [dbo].[Lokacija] ON 

INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (1, N'Beograd')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (2, N'Novi Sad')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (3, N'Nis')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (4, N'Loznica')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (5, N'Subotica')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (6, N'Kraljevo')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (7, N'Kragujevac')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (8, N'Krusevac')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (9, N'Uzice')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (10, N'Bor')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (11, N'Sremska Mitrovic')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (12, N'Smederevo')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (13, N'Jagodina')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (14, N'Valjevo')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (15, N'Pirot')
INSERT [dbo].[Lokacija] ([ID], [Naziv]) VALUES (16, N'Kosovska Mitrovica')
SET IDENTITY_INSERT [dbo].[Lokacija] OFF
SET IDENTITY_INSERT [dbo].[Marka] ON 

INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (1, N'AC')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (2, N'Alfa Romeo')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (3, N'Audi')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (4, N'BMW')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (5, N'Citroen')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (6, N'Dachia')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (7, N'Daewoo')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (8, N'Fiat')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (9, N'Ford')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (10, N'Honda')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (11, N'Hyndai')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (12, N'Kia')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (13, N'Lada')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (14, N'Mazda')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (15, N'Mercedes')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (16, N'Nissan')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (17, N'Opel')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (18, N'Peugeot')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (19, N'Renault')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (20, N'Saab')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (21, N'Subaru')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (22, N'Suzuki')
INSERT [dbo].[Marka] ([ID], [Naziv]) VALUES (23, N'Volkswage')
SET IDENTITY_INSERT [dbo].[Marka] OFF
SET IDENTITY_INSERT [dbo].[Menjac] ON 

INSERT [dbo].[Menjac] ([ID], [Naziv]) VALUES (1, N'Manuelni 4 brzine')
INSERT [dbo].[Menjac] ([ID], [Naziv]) VALUES (2, N'Manuelni 5 brzina')
INSERT [dbo].[Menjac] ([ID], [Naziv]) VALUES (3, N'Manuelni 6 brzina')
INSERT [dbo].[Menjac] ([ID], [Naziv]) VALUES (4, N'Poluautomatski')
INSERT [dbo].[Menjac] ([ID], [Naziv]) VALUES (5, N'Automatski')
SET IDENTITY_INSERT [dbo].[Menjac] OFF
SET IDENTITY_INSERT [dbo].[Modeli] ON 

INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (1, N'80', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (2, N'90', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (3, N'100', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (4, N'200', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (5, N'A1', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (6, N'A2', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (7, N'A3', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (8, N'A4', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (9, N'A5', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (10, N'A6', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (11, N'A7', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (12, N'A8', 3)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (13, N'80', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (14, N'Golf 1', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (15, N'Golf 2', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (16, N'Golf 3', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (17, N'Golf 4', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (18, N'Golf 5', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (19, N'Golf 6', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (20, N'Golf 7', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (21, N'Golf 8', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (22, N'Jetta', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (23, N'Polo', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (24, N'Passat B1', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (25, N'Passat B2', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (26, N'Passat B3', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (27, N'Passat B4', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (28, N'Passat B5', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (29, N'Passat B6', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (30, N'Passat B7', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (31, N'Passat B8', 23)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (32, N'145', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (33, N'146', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (34, N'147', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (35, N'156', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (36, N'159', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (37, N'164', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (38, N'166', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (39, N'Brera', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (40, N'GT', 2)
INSERT [dbo].[Modeli] ([ID], [Model], [Marka]) VALUES (41, N'Giulia', 2)
SET IDENTITY_INSERT [dbo].[Modeli] OFF
SET IDENTITY_INSERT [dbo].[OVLASCENJA] ON 

INSERT [dbo].[OVLASCENJA] ([ID], [Naziv]) VALUES (1, N'Admin')
INSERT [dbo].[OVLASCENJA] ([ID], [Naziv]) VALUES (2, N'User')
INSERT [dbo].[OVLASCENJA] ([ID], [Naziv]) VALUES (3, N'Neaktivan')
SET IDENTITY_INSERT [dbo].[OVLASCENJA] OFF
SET IDENTITY_INSERT [dbo].[POGON] ON 

INSERT [dbo].[POGON] ([ID], [Naziv]) VALUES (1, N'Prednji')
INSERT [dbo].[POGON] ([ID], [Naziv]) VALUES (2, N'Zadnji')
SET IDENTITY_INSERT [dbo].[POGON] OFF
SET IDENTITY_INSERT [dbo].[POREKLO] ON 

INSERT [dbo].[POREKLO] ([ID], [Naziv]) VALUES (1, N'Domace tablice')
INSERT [dbo].[POREKLO] ([ID], [Naziv]) VALUES (2, N'Na ime kupca')
INSERT [dbo].[POREKLO] ([ID], [Naziv]) VALUES (3, N'Strane tablice')
SET IDENTITY_INSERT [dbo].[POREKLO] OFF
SET IDENTITY_INSERT [dbo].[PROCITANO] ON 

INSERT [dbo].[PROCITANO] ([ID], [Naziv]) VALUES (1, N'DA')
INSERT [dbo].[PROCITANO] ([ID], [Naziv]) VALUES (2, N'NE')
SET IDENTITY_INSERT [dbo].[PROCITANO] OFF
SET IDENTITY_INSERT [dbo].[Status_CENE] ON 

INSERT [dbo].[Status_CENE] ([ID], [Naziv]) VALUES (1, N'Cena nije fiksna')
INSERT [dbo].[Status_CENE] ([ID], [Naziv]) VALUES (2, N'Cena je fiksna')
SET IDENTITY_INSERT [dbo].[Status_CENE] OFF
SET IDENTITY_INSERT [dbo].[TELEFONI] ON 

INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (1, N'0638612429', 1)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (2, N'0662334543', 2)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (4, N'0663432134', 6)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (5, N'0654321234', 7)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (6, N'0665432345', 8)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (7, N'0638976543', 9)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (8, N'0623456789', 10)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (9, N'068612429', 11)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (10, N'0638612429', 12)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (11, N'0638612429', 13)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (12, N'0638612429', 14)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (13, N'0638612429', 15)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (14, N'0638612429', 16)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (15, N'0638612429', 17)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (16, N'0638612429', 18)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (17, N'0638612429', 19)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (18, N'0638612429', 20)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (19, N'0638612429', 21)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (20, N'0638612429', 22)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (21, N'0638612429', 23)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (22, N'0638612429', 24)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (23, N'0638612429', 25)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (24, N'0638612429', 26)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (25, N'0638612429', 27)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (26, N'0638612429', 28)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (27, N'0638612429', 29)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (28, N'0638612429', 30)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (29, N'0638612429', 31)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (30, N'0638612429', 32)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (31, N'0638612429', 33)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (32, N'0638612429', 34)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (33, N'0638612429', 35)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (34, N'0638612429', 36)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (35, N'0638612429', 37)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (36, N'0638612429', 38)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (37, N'0638612429', 39)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (38, N'0638612429', 40)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (39, N'0638612429', 41)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (40, N'0638612429', 42)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (41, N'063999888', 43)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (42, N'0638612429', 44)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (44, N'0638612429', 45)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (45, N'0654345234', 46)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (46, N'0638612429', 47)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (47, N'0112345678', 47)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (48, N'0661923456', 47)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (49, N'064567789', 48)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (50, N'0112345678', 48)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (51, N'', 48)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (52, N'0638612429', 49)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (53, N'0112345434', 49)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (54, N'', 49)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (55, N'0638612429', 50)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (56, N'0665434567', 50)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (57, N'0638612429', 51)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (58, N'0112345678', 51)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (59, N'0638612429', 52)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (60, N'0112334543', 52)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (61, N'0638612429', 52)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (62, N'0662345467', 1)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (63, N'0113455654', 1)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (64, N'0664455321', 53)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (65, N'0112345678', 53)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (66, N'0662344556', 53)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (67, N'0665544334', 54)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (68, N'0112344444', 54)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (69, N'0662345678', 55)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (70, N'0663422344', 56)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (71, N'0332233445', 56)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (72, N'0662344556', 57)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (73, N'0112233445', 57)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (74, N'0661923456', 57)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (75, N'0638612429', 58)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (76, N'0113511214', 58)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (77, N'0642648324', 58)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (78, N'0663445223', 59)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (79, N'0652233445', 59)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (80, N'066123123', 60)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (81, N'0112345467', 60)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (82, N'066456789', 60)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (83, N'0638612429', 61)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (84, N'0112233445', 61)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (85, N'0665567341', 62)
INSERT [dbo].[TELEFONI] ([ID], [TELEFON], [KORISNIK]) VALUES (86, N'0661234334', 62)
SET IDENTITY_INSERT [dbo].[TELEFONI] OFF
SET IDENTITY_INSERT [dbo].[VOLAN] ON 

INSERT [dbo].[VOLAN] ([ID], [Naziv]) VALUES (1, N'Leva')
INSERT [dbo].[VOLAN] ([ID], [Naziv]) VALUES (2, N'Desna')
SET IDENTITY_INSERT [dbo].[VOLAN] OFF
SET IDENTITY_INSERT [dbo].[Vrata] ON 

INSERT [dbo].[Vrata] ([ID], [Naziv]) VALUES (1, N'2/3 vrata')
INSERT [dbo].[Vrata] ([ID], [Naziv]) VALUES (2, N'4/5 vrata')
SET IDENTITY_INSERT [dbo].[Vrata] OFF
SET IDENTITY_INSERT [dbo].[ZAMENA] ON 

INSERT [dbo].[ZAMENA] ([ID], [Naziv]) VALUES (1, N'Bez zamene')
INSERT [dbo].[ZAMENA] ([ID], [Naziv]) VALUES (2, N'Zamena za jeftinije')
INSERT [dbo].[ZAMENA] ([ID], [Naziv]) VALUES (3, N'U istoj ceni')
INSERT [dbo].[ZAMENA] ([ID], [Naziv]) VALUES (4, N'Zamena za skuplje')
INSERT [dbo].[ZAMENA] ([ID], [Naziv]) VALUES (5, N'Svejedno')
SET IDENTITY_INSERT [dbo].[ZAMENA] OFF
ALTER TABLE [dbo].[Auti] ADD  CONSTRAINT [vremenska_marka]  DEFAULT (sysutcdatetime()) FOR [Unos_vreme]
GO
ALTER TABLE [dbo].[CHATOVI] ADD  DEFAULT (sysutcdatetime()) FOR [Datum]
GO
ALTER TABLE [dbo].[KORISNICI] ADD  CONSTRAINT [vezan_datum]  DEFAULT (sysutcdatetime()) FOR [VREME_REGISTRACIJE]
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Boja])
REFERENCES [dbo].[BOJA] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Cena_status])
REFERENCES [dbo].[Status_CENE] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Karoserija])
REFERENCES [dbo].[Karoserija] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Klima])
REFERENCES [dbo].[KLIMA] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Lokacija])
REFERENCES [dbo].[Lokacija] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Marka])
REFERENCES [dbo].[Marka] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Menjac])
REFERENCES [dbo].[Menjac] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Model])
REFERENCES [dbo].[Modeli] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Gorivo])
REFERENCES [dbo].[Gorivo] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Pogon])
REFERENCES [dbo].[POGON] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Poreklo])
REFERENCES [dbo].[POREKLO] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Vlasnik])
REFERENCES [dbo].[KORISNICI] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Volan])
REFERENCES [dbo].[VOLAN] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Vrata])
REFERENCES [dbo].[Vrata] ([ID])
GO
ALTER TABLE [dbo].[Auti]  WITH CHECK ADD FOREIGN KEY([Zamena])
REFERENCES [dbo].[ZAMENA] ([ID])
GO
ALTER TABLE [dbo].[CHATOVI]  WITH CHECK ADD FOREIGN KEY([Chat])
REFERENCES [dbo].[CHAT] ([ID])
GO
ALTER TABLE [dbo].[CHATOVI]  WITH CHECK ADD FOREIGN KEY([Poslao])
REFERENCES [dbo].[KORISNICI] ([ID])
GO
ALTER TABLE [dbo].[CHATOVI]  WITH CHECK ADD FOREIGN KEY([Primio])
REFERENCES [dbo].[KORISNICI] ([ID])
GO
ALTER TABLE [dbo].[CHATOVI]  WITH CHECK ADD FOREIGN KEY([Stanje])
REFERENCES [dbo].[PROCITANO] ([ID])
GO
ALTER TABLE [dbo].[DODATNA]  WITH CHECK ADD FOREIGN KEY([Kola])
REFERENCES [dbo].[Auti] ([ID])
GO
ALTER TABLE [dbo].[KORISNICI]  WITH CHECK ADD FOREIGN KEY([OVLASCENJE])
REFERENCES [dbo].[OVLASCENJA] ([ID])
GO
ALTER TABLE [dbo].[Modeli]  WITH CHECK ADD FOREIGN KEY([Marka])
REFERENCES [dbo].[Marka] ([ID])
GO
ALTER TABLE [dbo].[TELEFONI]  WITH CHECK ADD FOREIGN KEY([KORISNIK])
REFERENCES [dbo].[KORISNICI] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[Brisanje_isteklih]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Brisanje_isteklih] @Vreme DATETIME
AS
SELECT Auti.ID FROM AUTI WHERE Unos_vreme < @Vreme
DECLARE @broj INT
SET @broj = (SELECT COUNT(ID) FROM AUTI  WHERE Unos_vreme < @Vreme) 
DECLARE @pocetak INT
SET @pocetak = 0
WHILE @pocetak < @broj
BEGIN
DECLARE @ID INT
SET @ID = (SELECT TOP 1 Auti.ID FROM Auti WHERE Unos_vreme < @Vreme)
DELETE FROM DODATNA WHERE DODATNA.Kola = @ID
DELETE FROM AUTI WHERE Auti.ID = @ID
SET @pocetak = @pocetak + 1
END
GO
/****** Object:  StoredProcedure [dbo].[BRISANJE_OGLASA]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BRISANJE_OGLASA] @ID INT
AS
DELETE FROM DODATNA WHERE Kola = @ID
DELETE FROM AUTI WHERE ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[Cetovanje]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cetovanje] @Naslov NVARCHAR(20), @Sadrzaj NVARCHAR(MAX), @Poslao INT, @Primio INT
AS
DECLARE @ID TABLE(id INT)
INSERT INTO CHAT(Naslov) OUTPUT INSERTED.ID INTO @ID VALUES(@Naslov)
DECLARE @BROJ_REDA INT
SET @BROJ_REDA = (SELECT * FROM @ID)
INSERT INTO CHATOVI(Sadrzaj,Poslao,Primio,Chat,Stanje) VALUES(@Sadrzaj, @Poslao, @Primio, @BROJ_REDA, 2)
GO
/****** Object:  StoredProcedure [dbo].[Convo]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Convo] @Chat INT, @Primio INT
AS
SELECT CHATOVI.ID, CHATOVI.Sadrzaj, KORISNICI.USERNAME, Chat, ChatOVI.Stanje,Datum FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Poslao WHERE CHAT = @Chat ORDER BY DATUM ASC
UPDATE CHATOVI SET STANJE = 1 WHERE CHAT = @Chat AND Primio = @Primio AND STANJE = 2
GO
/****** Object:  StoredProcedure [dbo].[Detalj]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Detalj] @ID INT
AS
SELECT AUTI.ID, Marka.Naziv, Modeli.Model, Karoserija.Naziv, Gorivo.Naziv, Vrata.Naziv, Lokacija.Naziv, Unos_vreme, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac.Naziv, Snaga, Volan.Naziv, Pogon.Naziv, Registrovan_do, Status_CENE.Naziv, ZAMENA.Naziv, BOJA.Naziv, KLIMA.Naziv, Poreklo.Naziv, Opis, Vlasnik FROM AUTI
INNER JOIN Marka ON Marka.ID = AUTI.Marka
INNER JOIN Modeli ON Modeli.ID = Auti.Model
INNER JOIN Karoserija ON Karoserija.ID = Auti.Karoserija
INNER JOIN Gorivo ON Gorivo.ID = Auti.Gorivo
INNER JOIN Vrata ON Vrata.ID = Auti.Vrata
INNER JOIN Lokacija ON Lokacija.ID = Auti.Lokacija 
INNER JOIN Menjac ON Menjac.ID = Auti.Menjac 
INNER JOIN Status_CENE ON Status_CENE.ID = AUTI.Cena_status 
INNER JOIN ZAMENA ON ZAMENA.ID = AUTI.Zamena 
INNER JOIN VOLAN ON VOLAN.ID = AUTI.VOLAN 
INNER JOIN POGON ON POGON.ID = AUTI.POGON 
INNER JOIN BOJA ON BOJA.ID = AUTI.Boja 
LEFT JOIN KLIMA ON KLIMA.ID = Auti.Klima 
INNER JOIN POREKLO ON POREKLO.ID = AUTI.Poreklo WHERE Auti.ID = @ID
SELECT DODATNA.Naziv FROM DODATNA WHERE DODATNA.Kola = @ID
DECLARE @vlas INT
SET @vlas = (SELECT Auti.Vlasnik FROM AUTI WHERE Auti.id = @ID)
SELECT TELEFON FROM TELEFONI WHERE TELEFONI.KORISNIK = @vlas
GO
/****** Object:  StoredProcedure [dbo].[Izbor]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Izbor] @Vlasnik INT, @offset INT, @tip_pretrage INT
AS
IF (@tip_pretrage = 1)
BEGIN
  DECLARE @Broj_pogodaka INT
  SET @Broj_pogodaka = (SELECT COUNT(ID) FROM AUTI WHERE VLASNIK = @Vlasnik)
    IF (@Broj_pogodaka != 0)
	  BEGIN
	  DECLARE @privremena table(broj_pogodaka INT)
      INSERT INTO @privremena(broj_pogodaka) VALUES(@Broj_pogodaka)
	  SELECT * FROM @privremena
      SELECT AUti.ID, Marka.Naziv as Marka, Modeli.Model, Oznaka, Godiste, Vlasnik FROM AUTI INNER JOIN MARKA ON MARKA.ID = AUTI.Marka INNER JOIN modeli on modeli.id = auti.model  WHERE Vlasnik = @Vlasnik ORDER BY ID DESC OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
      END
    ELSE
      BEGIN
      SELECT @Broj_pogodaka as BrojPogodaka
      END
END
ELSE
   BEGIN
   SELECT AUti.ID, Marka.Naziv as Marka, Modeli.Model, Oznaka, Godiste, Vlasnik FROM AUTI INNER JOIN MARKA ON MARKA.ID = AUTI.Marka INNER JOIN modeli on modeli.id = auti.model  WHERE Vlasnik = @Vlasnik ORDER BY ID DESC OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
   END
GO
/****** Object:  StoredProcedure [dbo].[Izmene_selekt]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Izmene_selekt] @ID INT
AS
SELECT * FROM AUTI WHERE ID = @ID
SELECT * FROM DODATNA WHERE DODATNA.Kola = @ID
GO
/****** Object:  StoredProcedure [dbo].[PORUKE_GLAVNI]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PORUKE_GLAVNI] @Korisnik INT
AS
SELECT CHAT.ID, CHAT.Naslov, (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat) as DATUM, (SELECT TOP 1 STANJE FROM CHATOVI WHERE Primio = @Korisnik  AND CHAT = CHAT.ID ORDER BY DATUM DESC) as Stanje, (SELECT Poslao FROM CHATOVI WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat ) AND Poslao = @Korisnik) as Poceo_chat, (SELECT Primio FROM CHATOVI WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat) AND Primio = @Korisnik) as Sagovornik FROM CHAT ORDER BY DATUM DESC
GO
/****** Object:  StoredProcedure [dbo].[PROBNA]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--proba
CREATE PROC [dbo].[PROBNA] @ID INT, @IME NVARCHAR(30)
AS
SELECT * FROM ( SELECT CHAT.ID, CHAT.Naslov, (SELECT MAX(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat) as DATUM, (SELECT TOP 1 STANJE FROM CHATOVI WHERE CHATOVI.Primio = @ID AND Chat.id = CHATOVI.Chat ORDER BY DATUM DESC ) as Stanje, (SELECT KORISNICI.USERNAME FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Poslao WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat)) as Poceo_chat, (SELECT KORISNICI.USERNAME FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Primio WHERE Datum = (SELECT MIN(DATUM) FROM CHATOVI WHERE Chat.id = CHATOVI.Chat))as Sagovornik FROM CHAT ) AS GRUPNI WHERE Sagovornik = @IME or Poceo_chat = @IME ORDER BY DATUM DESC
GO
/****** Object:  StoredProcedure [dbo].[unosPoruke]    Script Date: 5/9/2019 7:48:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[unosPoruke] @id INT,@salje INT, @sadrzaj NVARCHAR(1000)
AS
SELECT CHATOVI.ID,Sadrzaj,korisnici.username,CHATOVI.Stanje,Datum FROM CHATOVI INNER JOIN KORISNICI ON KORISNICI.ID = CHATOVI.Poslao WHERE PRIMIO = @salje AND CHATOVI.Chat = @id and CHATOVI.STANJE = 2
--SELECT * FROM CHATOVI WHERE PRIMIO = @salje AND CHATOVI.Chat = @id AND Stanje = 2
DECLARE @meta INT
SET @meta = (SELECT PRIMIO FROM (SELECT PRIMIO FROM CHATOVI WHERE CHAT = @id AND DATUM = (SELECT MIN(DATUM) FROM CHATOVI WHERE CHATOVI.CHAT = @id) UNION SELECT POSLAO FROM CHATOVI WHERE CHAT = @id AND DATUM = (SELECT MIN(DATUM) FROM CHATOVI WHERE CHATOVI.CHAT = @id)) as STAvka WHERE PRIMIO != @salje)
INSERT INTO CHATOVI(SADRZAJ,POSLAO,PRIMIO,CHAT,STANJE) VALUES(@sadrzaj,@salje,@meta,@id,2)
GO
USE [master]
GO
ALTER DATABASE [AUTOMOBILI] SET  READ_WRITE 
GO
