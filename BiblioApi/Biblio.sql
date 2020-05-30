USE [master]
GO
/****** Object:  Database [biblio]    Script Date: 09-02-20 22:57:07 ******/

ALTER DATABASE [biblio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [biblio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [biblio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [biblio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [biblio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [biblio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [biblio] SET ARITHABORT OFF 
GO
ALTER DATABASE [biblio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [biblio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [biblio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [biblio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [biblio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [biblio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [biblio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [biblio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [biblio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [biblio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [biblio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [biblio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [biblio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [biblio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [biblio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [biblio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [biblio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [biblio] SET RECOVERY FULL 
GO
ALTER DATABASE [biblio] SET  MULTI_USER 
GO
ALTER DATABASE [biblio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [biblio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [biblio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [biblio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [biblio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'biblio', N'ON'
GO
ALTER DATABASE [biblio] SET QUERY_STORE = OFF
GO
USE [biblio]
GO
/****** Object:  Schema [biblio]    Script Date: 09-02-20 22:57:07 ******/
CREATE SCHEMA [biblio]
GO
/****** Object:  Table [biblio].[adresse]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[adresse](
	[id_adresse] [int] IDENTITY(1,1) NOT NULL,
	[rue] [nvarchar](100) NULL,
	[numero] [nvarchar](4) NULL,
	[cp] [nvarchar](5) NULL,
	[localite] [nvarchar](45) NULL,
	[id_pays] [int] NOT NULL,
 CONSTRAINT [PK_adresse_id_adresse] PRIMARY KEY CLUSTERED 
(
	[id_adresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[auteur]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[auteur](
	[id_auteur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](100) NOT NULL,
	[prenom] [nvarchar](100) NULL,
	[pseudo] [nvarchar](100) NULL,
	[id_pays] [int] NOT NULL,
 CONSTRAINT [PK_auteur_id_auteur] PRIMARY KEY CLUSTERED 
(
	[id_auteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[avis]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[avis](
	[id_avis] [int] IDENTITY(1,1) NOT NULL,
	[avis] [nvarchar](255) NOT NULL,
	[note] [int] NOT NULL,
	[commentaire] [nvarchar](255) NULL,
	[date] [datetime2](0) NOT NULL,
	[deja_lu] [smallint] NULL,
	[page_atteinte] [int] NULL,
	[id_emprunteur] [bigint] NOT NULL,
	[id_edition] [int] NOT NULL,
 CONSTRAINT [PK_avis_id_avis] PRIMARY KEY CLUSTERED 
(
	[id_avis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[bibliothecaire]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[bibliothecaire](
	[id_bibliothecaire] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](100) NOT NULL,
	[prenom] [nvarchar](100) NULL,
	[mail] [nvarchar](100) NOT NULL,
	[mdp] [nvarchar](100) NOT NULL,
	[actif] [smallint] NOT NULL,
	[id_role] [int] NULL,
 CONSTRAINT [PK_bibliothecaire_id_bibliothecaire] PRIMARY KEY CLUSTERED 
(
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [bibliothecaire$mail_UNIQUE] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[bibliotheque]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[bibliotheque](
	[id_bibliotheque] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](45) NOT NULL,
	[actif] [smallint] NOT NULL,
	[id_adresse] [int] NOT NULL,
 CONSTRAINT [PK_bibliotheque_id_bibliotheque] PRIMARY KEY CLUSTERED 
(
	[id_bibliotheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[ecriture]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[ecriture](
	[id_auteur] [int] NOT NULL,
	[id_livre] [int] NOT NULL,
 CONSTRAINT [PK_ecriture_id_auteur] PRIMARY KEY CLUSTERED 
(
	[id_auteur] ASC,
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[editeur]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[editeur](
	[id_editeur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_editeur_id_editeur] PRIMARY KEY CLUSTERED 
(
	[id_editeur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [editeur$nom_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[edition]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[edition](
	[id_edition] [int] IDENTITY(1,1) NOT NULL,
	[date_publi] [date] NOT NULL,
	[ISBN] [nvarchar](13) NOT NULL,
	[nbre_pages] [int] NOT NULL,
	[image] [varbinary](max) NULL,
	[id_livre] [int] NOT NULL,
	[id_editeur] [int] NOT NULL,
 CONSTRAINT [PK_edition_id_edition] PRIMARY KEY CLUSTERED 
(
	[id_edition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [edition$ISBN_UNIQUE] UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [biblio].[emprunt]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[emprunt](
	[id_emprunt] [int] IDENTITY(1,1) NOT NULL,
	[date_emprunt] [datetime2](0) NOT NULL,
	[date_retour] [datetime2](0) NOT NULL,
	[id_emprunteur] [bigint] NOT NULL,
 CONSTRAINT [PK_emprunt_id_emprunt] PRIMARY KEY CLUSTERED 
(
	[id_emprunt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[emprunteur]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[emprunteur](
	[id_emprunteur] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](100) NOT NULL,
	[mail] [nvarchar](100) NOT NULL,
	[mdp] [nvarchar](100) NOT NULL,
	[pseudo] [nvarchar](100) NULL,
	[tel] [nvarchar](15) NULL,
	[actif] [smallint] NOT NULL,
	[id_adresse] [int] NOT NULL,
	[prenom] [nvarchar](100) NULL,
	[panier] [int] NULL,
 CONSTRAINT [PK_emprunteur_id_emprunteur] PRIMARY KEY CLUSTERED 
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [emprunteur$mail_UNIQUE] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[etiquete]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[etiquete](
	[id_tag] [int] NOT NULL,
	[id_livre] [int] NOT NULL,
 CONSTRAINT [PK_etiquete_id_tag] PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC,
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[exemplaire]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[exemplaire](
	[id_exemplaire] [int] IDENTITY(1,1) NOT NULL,
	[etat] [nvarchar](15) NOT NULL,
	[prix_achat] [decimal](5, 2) NOT NULL,
	[format] [nvarchar](15) NOT NULL,
	[en_stock] [smallint] NOT NULL,
	[actif] [smallint] NOT NULL,
	[id_edition] [int] NOT NULL,
	[id_bibliotheque] [int] NOT NULL,
	[id_emprunteur] [bigint] NULL,
	[id_emprunt] [int] NULL,
 CONSTRAINT [PK_exemplaire_id_exemplaire] PRIMARY KEY CLUSTERED 
(
	[id_exemplaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[genre]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[genre](
	[nom] [nvarchar](60) NOT NULL,
	[id_genre] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_genre_id_genre] PRIMARY KEY CLUSTERED 
(
	[id_genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [genre$nom_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[hierarchie]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[hierarchie](
	[id_bibliothecaire] [bigint] NOT NULL,
	[id_bibliothecairechef] [bigint] NOT NULL,
 CONSTRAINT [PK_hierarchie_id_bibliothecaire] PRIMARY KEY CLUSTERED 
(
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[livre]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[livre](
	[id_livre] [int] IDENTITY(1,1) NOT NULL,
	[titre] [nvarchar](100) NOT NULL,
	[sous_titre] [nvarchar](150) NULL,
	[resume] [nvarchar](max) NULL,
	[id_genre] [int] NOT NULL,
 CONSTRAINT [PK_livre_id_livre] PRIMARY KEY CLUSTERED 
(
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [biblio].[log]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[log](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](0) NOT NULL,
	[message] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_log_id_log] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[organisation]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[organisation](
	[id_theme] [int] NOT NULL,
	[id_livre] [int] NOT NULL,
 CONSTRAINT [PK_organisation_id_theme] PRIMARY KEY CLUSTERED 
(
	[id_theme] ASC,
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[paiement]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[paiement](
	[id_emprunteur] [bigint] NOT NULL,
	[id_bibliotheque] [int] NOT NULL,
	[date_coti] [datetime2](0) NOT NULL,
	[en_ordre_coti] [smallint] NOT NULL,
	[amende] [smallint] NULL,
	[montant_amende] [decimal](3, 2) NULL,
 CONSTRAINT [PK_paiement_id_emprunteur] PRIMARY KEY CLUSTERED 
(
	[id_emprunteur] ASC,
	[id_bibliotheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[panier]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[panier](
	[id_panier] [int] IDENTITY(1,1) NOT NULL,
	[cotisation] [int] NULL,
	[amende] [bigint] NULL,
	[id_exemplaire] [int] NULL,
 CONSTRAINT [panier_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_panier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[pays]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[pays](
	[nom] [nvarchar](50) NOT NULL,
	[id_pays] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_pays_id_pays] PRIMARY KEY CLUSTERED 
(
	[id_pays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[question]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[question](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[titre] [nvarchar](100) NOT NULL,
	[contenu] [nvarchar](max) NOT NULL,
	[date] [datetime2](0) NOT NULL,
	[reponse] [nvarchar](max) NULL,
	[id_bibliothecaire] [bigint] NOT NULL,
	[id_emprunteur] [bigint] NOT NULL,
 CONSTRAINT [PK_question_id_question] PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [biblio].[role]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_role_id_role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[tag]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[tag](
	[nom] [nvarchar](100) NOT NULL,
	[id_tag] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tag_id_tag] PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tag$nom_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[theme]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[theme](
	[nom] [nvarchar](100) NOT NULL,
	[id_theme] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_theme_id_theme] PRIMARY KEY CLUSTERED 
(
	[id_theme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [theme$nom_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [biblio].[travail]    Script Date: 09-02-20 22:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [biblio].[travail](
	[id_bibliotheque] [int] NOT NULL,
	[id_bibliothecaire] [bigint] NOT NULL,
 CONSTRAINT [PK_travail_id_bibliotheque] PRIMARY KEY CLUSTERED 
(
	[id_bibliotheque] ASC,
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [fk_adresse1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_adresse1_idx] ON [biblio].[adresse]
(
	[id_pays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_auteur2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_auteur2_idx] ON [biblio].[auteur]
(
	[id_pays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_avis1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_avis1_idx] ON [biblio].[avis]
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_avis2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_avis2_idx] ON [biblio].[avis]
(
	[id_edition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliothecaire1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliothecaire1_idx] ON [biblio].[bibliothecaire]
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliotheque1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliotheque1_idx] ON [biblio].[bibliotheque]
(
	[id_adresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_auteur1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_auteur1_idx] ON [biblio].[ecriture]
(
	[id_auteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_livre2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_livre2_idx] ON [biblio].[ecriture]
(
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_edition1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_edition1_idx] ON [biblio].[edition]
(
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_edition2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_edition2_idx] ON [biblio].[edition]
(
	[id_editeur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_emprunt1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_emprunt1_idx] ON [biblio].[emprunt]
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_emprunteur1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_emprunteur1_idx] ON [biblio].[emprunteur]
(
	[id_adresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_livre]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_livre] ON [biblio].[etiquete]
(
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_exemplaire1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_exemplaire1_idx] ON [biblio].[exemplaire]
(
	[id_edition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_exemplaire2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_exemplaire2_idx] ON [biblio].[exemplaire]
(
	[id_bibliotheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_exemplaire3_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_exemplaire3_idx] ON [biblio].[exemplaire]
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_exemplaire4_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_exemplaire4_idx] ON [biblio].[exemplaire]
(
	[id_emprunt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliothecaire2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliothecaire2_idx] ON [biblio].[hierarchie]
(
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliothecaire3_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliothecaire3_idx] ON [biblio].[hierarchie]
(
	[id_bibliothecairechef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_genre]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_genre] ON [biblio].[livre]
(
	[id_genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_livre]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_livre] ON [biblio].[organisation]
(
	[id_livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliotheque2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliotheque2_idx] ON [biblio].[paiement]
(
	[id_bibliotheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_emprunteur2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_emprunteur2_idx] ON [biblio].[paiement]
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_question1_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_question1_idx] ON [biblio].[question]
(
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_question2_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_question2_idx] ON [biblio].[question]
(
	[id_emprunteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliothecaire4_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliothecaire4_idx] ON [biblio].[travail]
(
	[id_bibliothecaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_bibliotheque4_idx]    Script Date: 09-02-20 22:57:07 ******/
CREATE NONCLUSTERED INDEX [fk_bibliotheque4_idx] ON [biblio].[travail]
(
	[id_bibliotheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [biblio].[adresse] ADD  DEFAULT (NULL) FOR [rue]
GO
ALTER TABLE [biblio].[adresse] ADD  DEFAULT (NULL) FOR [numero]
GO
ALTER TABLE [biblio].[adresse] ADD  DEFAULT (NULL) FOR [cp]
GO
ALTER TABLE [biblio].[adresse] ADD  DEFAULT (NULL) FOR [localite]
GO
ALTER TABLE [biblio].[auteur] ADD  DEFAULT (NULL) FOR [prenom]
GO
ALTER TABLE [biblio].[auteur] ADD  DEFAULT (NULL) FOR [pseudo]
GO
ALTER TABLE [biblio].[avis] ADD  DEFAULT (NULL) FOR [commentaire]
GO
ALTER TABLE [biblio].[avis] ADD  DEFAULT (NULL) FOR [deja_lu]
GO
ALTER TABLE [biblio].[avis] ADD  DEFAULT (NULL) FOR [page_atteinte]
GO
ALTER TABLE [biblio].[bibliothecaire] ADD  DEFAULT (NULL) FOR [prenom]
GO
ALTER TABLE [biblio].[emprunteur] ADD  DEFAULT (NULL) FOR [pseudo]
GO
ALTER TABLE [biblio].[emprunteur] ADD  DEFAULT (NULL) FOR [tel]
GO
ALTER TABLE [biblio].[exemplaire] ADD  DEFAULT (NULL) FOR [id_emprunteur]
GO
ALTER TABLE [biblio].[exemplaire] ADD  DEFAULT (NULL) FOR [id_emprunt]
GO
ALTER TABLE [biblio].[livre] ADD  DEFAULT (NULL) FOR [sous_titre]
GO
ALTER TABLE [biblio].[paiement] ADD  DEFAULT (NULL) FOR [amende]
GO
ALTER TABLE [biblio].[paiement] ADD  DEFAULT (NULL) FOR [montant_amende]
GO
ALTER TABLE [biblio].[adresse]  WITH CHECK ADD  CONSTRAINT [adresse$fk_adresse1] FOREIGN KEY([id_pays])
REFERENCES [biblio].[pays] ([id_pays])
GO
ALTER TABLE [biblio].[adresse] CHECK CONSTRAINT [adresse$fk_adresse1]
GO
ALTER TABLE [biblio].[auteur]  WITH CHECK ADD  CONSTRAINT [auteur$fk_auteur2] FOREIGN KEY([id_pays])
REFERENCES [biblio].[pays] ([id_pays])
GO
ALTER TABLE [biblio].[auteur] CHECK CONSTRAINT [auteur$fk_auteur2]
GO
ALTER TABLE [biblio].[avis]  WITH CHECK ADD  CONSTRAINT [avis$fk_avis1] FOREIGN KEY([id_emprunteur])
REFERENCES [biblio].[emprunteur] ([id_emprunteur])
GO
ALTER TABLE [biblio].[avis] CHECK CONSTRAINT [avis$fk_avis1]
GO
ALTER TABLE [biblio].[avis]  WITH CHECK ADD  CONSTRAINT [avis$fk_avis2] FOREIGN KEY([id_edition])
REFERENCES [biblio].[edition] ([id_edition])
GO
ALTER TABLE [biblio].[avis] CHECK CONSTRAINT [avis$fk_avis2]
GO
ALTER TABLE [biblio].[bibliothecaire]  WITH CHECK ADD  CONSTRAINT [bibliothecaire$fk_bibliothecaire1] FOREIGN KEY([id_role])
REFERENCES [biblio].[role] ([id_role])
GO
ALTER TABLE [biblio].[bibliothecaire] CHECK CONSTRAINT [bibliothecaire$fk_bibliothecaire1]
GO
ALTER TABLE [biblio].[bibliotheque]  WITH CHECK ADD  CONSTRAINT [bibliotheque$fk_bibliotheque1] FOREIGN KEY([id_adresse])
REFERENCES [biblio].[adresse] ([id_adresse])
GO
ALTER TABLE [biblio].[bibliotheque] CHECK CONSTRAINT [bibliotheque$fk_bibliotheque1]
GO
ALTER TABLE [biblio].[ecriture]  WITH CHECK ADD  CONSTRAINT [ecriture$fk_auteur1] FOREIGN KEY([id_auteur])
REFERENCES [biblio].[auteur] ([id_auteur])
GO
ALTER TABLE [biblio].[ecriture] CHECK CONSTRAINT [ecriture$fk_auteur1]
GO
ALTER TABLE [biblio].[ecriture]  WITH CHECK ADD  CONSTRAINT [ecriture$fk_livre2] FOREIGN KEY([id_livre])
REFERENCES [biblio].[livre] ([id_livre])
GO
ALTER TABLE [biblio].[ecriture] CHECK CONSTRAINT [ecriture$fk_livre2]
GO
ALTER TABLE [biblio].[edition]  WITH CHECK ADD  CONSTRAINT [edition$fk_edition1] FOREIGN KEY([id_livre])
REFERENCES [biblio].[livre] ([id_livre])
GO
ALTER TABLE [biblio].[edition] CHECK CONSTRAINT [edition$fk_edition1]
GO
ALTER TABLE [biblio].[edition]  WITH CHECK ADD  CONSTRAINT [edition$fk_edition2] FOREIGN KEY([id_editeur])
REFERENCES [biblio].[editeur] ([id_editeur])
GO
ALTER TABLE [biblio].[edition] CHECK CONSTRAINT [edition$fk_edition2]
GO
ALTER TABLE [biblio].[emprunt]  WITH CHECK ADD  CONSTRAINT [emprunt$fk_emprunt1] FOREIGN KEY([id_emprunteur])
REFERENCES [biblio].[emprunteur] ([id_emprunteur])
GO
ALTER TABLE [biblio].[emprunt] CHECK CONSTRAINT [emprunt$fk_emprunt1]
GO
ALTER TABLE [biblio].[emprunteur]  WITH CHECK ADD  CONSTRAINT [emprunteur$fk_emprunteur1] FOREIGN KEY([id_adresse])
REFERENCES [biblio].[adresse] ([id_adresse])
GO
ALTER TABLE [biblio].[emprunteur] CHECK CONSTRAINT [emprunteur$fk_emprunteur1]
GO
ALTER TABLE [biblio].[emprunteur]  WITH CHECK ADD  CONSTRAINT [emprunteur_panier_id_panier_fk] FOREIGN KEY([panier])
REFERENCES [biblio].[panier] ([id_panier])
GO
ALTER TABLE [biblio].[emprunteur] CHECK CONSTRAINT [emprunteur_panier_id_panier_fk]
GO
ALTER TABLE [biblio].[etiquete]  WITH CHECK ADD  CONSTRAINT [etiquete$fk_livre_livre1] FOREIGN KEY([id_livre])
REFERENCES [biblio].[livre] ([id_livre])
GO
ALTER TABLE [biblio].[etiquete] CHECK CONSTRAINT [etiquete$fk_livre_livre1]
GO
ALTER TABLE [biblio].[etiquete]  WITH CHECK ADD  CONSTRAINT [etiquete$fk_tag_tag1] FOREIGN KEY([id_tag])
REFERENCES [biblio].[tag] ([id_tag])
GO
ALTER TABLE [biblio].[etiquete] CHECK CONSTRAINT [etiquete$fk_tag_tag1]
GO
ALTER TABLE [biblio].[exemplaire]  WITH CHECK ADD  CONSTRAINT [exemplaire$fk_exemplaire1] FOREIGN KEY([id_edition])
REFERENCES [biblio].[edition] ([id_edition])
GO
ALTER TABLE [biblio].[exemplaire] CHECK CONSTRAINT [exemplaire$fk_exemplaire1]
GO
ALTER TABLE [biblio].[exemplaire]  WITH CHECK ADD  CONSTRAINT [exemplaire$fk_exemplaire2] FOREIGN KEY([id_bibliotheque])
REFERENCES [biblio].[bibliotheque] ([id_bibliotheque])
GO
ALTER TABLE [biblio].[exemplaire] CHECK CONSTRAINT [exemplaire$fk_exemplaire2]
GO
ALTER TABLE [biblio].[exemplaire]  WITH CHECK ADD  CONSTRAINT [exemplaire$fk_exemplaire3] FOREIGN KEY([id_emprunteur])
REFERENCES [biblio].[emprunteur] ([id_emprunteur])
GO
ALTER TABLE [biblio].[exemplaire] CHECK CONSTRAINT [exemplaire$fk_exemplaire3]
GO
ALTER TABLE [biblio].[exemplaire]  WITH CHECK ADD  CONSTRAINT [exemplaire$fk_exemplaire4] FOREIGN KEY([id_emprunt])
REFERENCES [biblio].[emprunt] ([id_emprunt])
GO
ALTER TABLE [biblio].[exemplaire] CHECK CONSTRAINT [exemplaire$fk_exemplaire4]
GO
ALTER TABLE [biblio].[hierarchie]  WITH CHECK ADD  CONSTRAINT [hierarchie$fk_bibliothecaire2] FOREIGN KEY([id_bibliothecaire])
REFERENCES [biblio].[bibliothecaire] ([id_bibliothecaire])
GO
ALTER TABLE [biblio].[hierarchie] CHECK CONSTRAINT [hierarchie$fk_bibliothecaire2]
GO
ALTER TABLE [biblio].[hierarchie]  WITH CHECK ADD  CONSTRAINT [hierarchie$fk_bibliothecaire3] FOREIGN KEY([id_bibliothecairechef])
REFERENCES [biblio].[bibliothecaire] ([id_bibliothecaire])
GO
ALTER TABLE [biblio].[hierarchie] CHECK CONSTRAINT [hierarchie$fk_bibliothecaire3]
GO
ALTER TABLE [biblio].[livre]  WITH CHECK ADD  CONSTRAINT [livre$fk_livre1] FOREIGN KEY([id_genre])
REFERENCES [biblio].[genre] ([id_genre])
GO
ALTER TABLE [biblio].[livre] CHECK CONSTRAINT [livre$fk_livre1]
GO
ALTER TABLE [biblio].[organisation]  WITH CHECK ADD  CONSTRAINT [organisation$fk_livre] FOREIGN KEY([id_livre])
REFERENCES [biblio].[livre] ([id_livre])
GO
ALTER TABLE [biblio].[organisation] CHECK CONSTRAINT [organisation$fk_livre]
GO
ALTER TABLE [biblio].[organisation]  WITH CHECK ADD  CONSTRAINT [organisation$fk_theme] FOREIGN KEY([id_theme])
REFERENCES [biblio].[theme] ([id_theme])
GO
ALTER TABLE [biblio].[organisation] CHECK CONSTRAINT [organisation$fk_theme]
GO
ALTER TABLE [biblio].[paiement]  WITH CHECK ADD  CONSTRAINT [paiement$fk_bibliotheque2] FOREIGN KEY([id_bibliotheque])
REFERENCES [biblio].[bibliotheque] ([id_bibliotheque])
GO
ALTER TABLE [biblio].[paiement] CHECK CONSTRAINT [paiement$fk_bibliotheque2]
GO
ALTER TABLE [biblio].[paiement]  WITH CHECK ADD  CONSTRAINT [paiement$fk_emprunteur2] FOREIGN KEY([id_emprunteur])
REFERENCES [biblio].[emprunteur] ([id_emprunteur])
GO
ALTER TABLE [biblio].[paiement] CHECK CONSTRAINT [paiement$fk_emprunteur2]
GO
ALTER TABLE [biblio].[panier]  WITH CHECK ADD  CONSTRAINT [panier_exemplaire_id_exemplaire_fk] FOREIGN KEY([id_panier])
REFERENCES [biblio].[exemplaire] ([id_exemplaire])
GO
ALTER TABLE [biblio].[panier] CHECK CONSTRAINT [panier_exemplaire_id_exemplaire_fk]
GO
ALTER TABLE [biblio].[question]  WITH CHECK ADD  CONSTRAINT [question$fk_question1] FOREIGN KEY([id_bibliothecaire])
REFERENCES [biblio].[bibliothecaire] ([id_bibliothecaire])
GO
ALTER TABLE [biblio].[question] CHECK CONSTRAINT [question$fk_question1]
GO
ALTER TABLE [biblio].[question]  WITH CHECK ADD  CONSTRAINT [question$fk_question2] FOREIGN KEY([id_emprunteur])
REFERENCES [biblio].[emprunteur] ([id_emprunteur])
GO
ALTER TABLE [biblio].[question] CHECK CONSTRAINT [question$fk_question2]
GO
ALTER TABLE [biblio].[travail]  WITH CHECK ADD  CONSTRAINT [travail$fk_bibliothecaire4] FOREIGN KEY([id_bibliothecaire])
REFERENCES [biblio].[bibliothecaire] ([id_bibliothecaire])
GO
ALTER TABLE [biblio].[travail] CHECK CONSTRAINT [travail$fk_bibliothecaire4]
GO
ALTER TABLE [biblio].[travail]  WITH CHECK ADD  CONSTRAINT [travail$fk_bibliotheque4] FOREIGN KEY([id_bibliotheque])
REFERENCES [biblio].[bibliotheque] ([id_bibliotheque])
GO
ALTER TABLE [biblio].[travail] CHECK CONSTRAINT [travail$fk_bibliotheque4]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.adresse' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'adresse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.auteur' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'auteur'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.avis' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'avis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.bibliothecaire' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'bibliothecaire'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.bibliotheque' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'bibliotheque'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.ecriture' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'ecriture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.editeur' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'editeur'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.edition' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'edition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.emprunt' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'emprunt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.emprunteur' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'emprunteur'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.etiquete' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'etiquete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.exemplaire' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'exemplaire'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.genre' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'genre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.hierarchie' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'hierarchie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.livre' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'livre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.`log`' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.organisation' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'organisation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.paiement' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'paiement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.pays' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'pays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.question' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'question'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.role' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.tag' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.theme' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'theme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'biblio.travail' , @level0type=N'SCHEMA',@level0name=N'biblio', @level1type=N'TABLE',@level1name=N'travail'
GO
USE [master]
GO
ALTER DATABASE [biblio] SET  READ_WRITE 
GO
