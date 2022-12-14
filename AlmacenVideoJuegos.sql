USE [master]
GO
/****** Object:  Database [AlmacenVideoJuegos]    Script Date: 2/11/2022 09:06:57 ******/
CREATE DATABASE [AlmacenVideoJuegos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmacenVideoJuegos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmacenVideoJuegos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmacenVideoJuegos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmacenVideoJuegos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlmacenVideoJuegos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmacenVideoJuegos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET  MULTI_USER 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmacenVideoJuegos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmacenVideoJuegos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmacenVideoJuegos', N'ON'
GO
ALTER DATABASE [AlmacenVideoJuegos] SET QUERY_STORE = OFF
GO
USE [AlmacenVideoJuegos]
GO
/****** Object:  User [alumno]    Script Date: 2/11/2022 09:06:57 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 2/11/2022 09:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificacion]    Script Date: 2/11/2022 09:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[IdClasificacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Logotipo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[IdClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 2/11/2022 09:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[SedeCentral] [varchar](max) NOT NULL,
	[Fundador] [varchar](max) NOT NULL,
	[fechaFundacion] [date] NOT NULL,
	[Logo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videojuego]    Script Date: 2/11/2022 09:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videojuego](
	[IdVideojuego] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[fechaLanzamiento] [date] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Descripción] [varchar](max) NOT NULL,
	[IdClasificacion] [int] NOT NULL,
	[Caratula] [varchar](max) NULL,
	[Banner] [varchar](max) NULL,
	[Logo] [varchar](max) NULL,
 CONSTRAINT [PK_Videojuego] PRIMARY KEY CLUSTERED 
(
	[IdVideojuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideojuegoXCategoria]    Script Date: 2/11/2022 09:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideojuegoXCategoria](
	[IdCategoria] [int] NOT NULL,
	[IdVideojuego] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Acción')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Aventura')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Arcade')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Deportes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Estrategia')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (6, N'Simulación')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (7, N'Juegos de mesa')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (8, N'Juegos musicales')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (9, N'Juegos de rol
')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (10, N'Puzzle')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Clasificacion] ON 

INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (1, N'Todos', N'https://www.esrb.org/wp-content/uploads/2019/05/Everyone_SP.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (2, N'Todos +10', N'https://www.esrb.org/wp-content/uploads/2019/05/Everyone10_SP.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (3, N'Adolecentes', N'https://www.esrb.org/wp-content/uploads/2019/05/Teen_SP.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (4, N'Maduro +17', N'https://www.esrb.org/wp-content/uploads/2019/05/Mature_SP.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (5, N'Adultos únicamente +18', N'https://www.esrb.org/wp-content/uploads/2019/05/Adult_SP.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (6, N'Aún sin calificar', N'https://www.esrb.org/wp-content/uploads/2021/11/RatingPending_Spanish-1.svg')
INSERT [dbo].[Clasificacion] ([IdClasificacion], [Nombre], [Logotipo]) VALUES (8, N'Aún sin calificar - Posiblemente maduro +17', N'https://www.esrb.org/wp-content/uploads/2021/12/RP-LM17-Spanish.svg')
SET IDENTITY_INSERT [dbo].[Clasificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre], [SedeCentral], [Fundador], [fechaFundacion], [Logo]) VALUES (1, N'Nintendo', N'Kioto, Japón', N'Fusajiro Yamauchi', CAST(N'1889-09-23' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Nintendo_red_logo.svg/1280px-Nintendo_red_logo.svg.png')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre], [SedeCentral], [Fundador], [fechaFundacion], [Logo]) VALUES (2, N'Sega', N'Tokio, Japón', N'Martin Bromley y Richard Stewart', CAST(N'1960-06-03' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/SEGA_logo.svg/1200px-SEGA_logo.svg.png')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre], [SedeCentral], [Fundador], [fechaFundacion], [Logo]) VALUES (3, N'Ubisoft', N'Montreuil-Sous-', N'Christian Guillemot, Claude Guillemot, Gérard Guillemot, Michel Guillemot y Yves Guillemot', CAST(N'1986-03-28' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/SEGA_logo.svg/1200px-https://upload.wikimedia.org/wikipedia/commons/7/78/Ubisoft_logo.svg')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre], [SedeCentral], [Fundador], [fechaFundacion], [Logo]) VALUES (4, N'Square Enix', N'Shibuya, Tokio, Japón', N'Yasuhiro Fukushima, Misashi Miyamoto', CAST(N'1975-08-22' AS Date), N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Square_Enix_logo.svg/2560px-Square_Enix_logo.svg.png')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[Videojuego] ON 

INSERT [dbo].[Videojuego] ([IdVideojuego], [IdEmpresa], [fechaLanzamiento], [Nombre], [Descripción], [IdClasificacion], [Caratula], [Banner], [Logo]) VALUES (1, 1, CAST(N'2017-10-27' AS Date), N'Super Mario Odyssey', N'La entrega nos introduce a una nueva aventura con Mario y su nuevo aliado Cappy, un ser en forma de sombrero que le permite a Mario poseer diversos personajes y objetos, que en su vehículo aéreo la Odyssey se embarcan en una travesía visitando distintos reinos a lo largo del mundo para salvar a la Princesa Peach del matrimonio forzado que Bowser planea. Es el decimonoveno título de la serie Super Mario y el séptimo juego de plataformas en 3D de Mario Bros. La característica principal en este juego es la habilidad de portar a Cappy, este hace que Mario pueda poseer enemigos u objetos para usar sus habilidades para resolver rompecabezas y hacerte paso dentro del juego.', 2, N'https://as01.epimg.net/meristation/imagenes/2018/07/01/game_cover/1530477537_477537_022461_gameplatform.jpg', N'https://miro.medium.com/max/1400/1*NIMNMFbIjby9aLcpZNYdhw.jpeg', N'https://mario.fandom.com/es/wiki/Super_Mario_Odyssey?file=800px-SMO_Logo_-_NA.png')
INSERT [dbo].[Videojuego] ([IdVideojuego], [IdEmpresa], [fechaLanzamiento], [Nombre], [Descripción], [IdClasificacion], [Caratula], [Banner], [Logo]) VALUES (2, 1, CAST(N'2017-03-03' AS Date), N'The Legend of Zelda: Breath of the Wild', N'El jugador controla a Link, que despierta en un mundo postapocalíptico después de estar cien años durmiendo para derrotar a Ganon y salvar al reino de Hyrule. A diferencia de los otros títulos predecesores de la serie, el juego presenta un mundo abierto que le permite al jugador encontrar distintas maneras de completar un objetivo y que la historia pueda ser completada de forma no lineal.', 2, N'https://newesc.com/wp-content/uploads/legend-of-zelda-bow-us.jpg', N'https://nintenfan.com/wp-content/uploads/2017/01/The-Legend-of-Zelda-Breath-of-the-Wild-Release-Date-Banner-for-Nintendo-Switch.jpg', N'https://static.wikia.nocookie.net/logopedia/images/5/53/763px-BotW_NA_Logo.png/revision/latest?https://static.wikia.nocookie.net/doblaje/images/1/1a/The_Legend_of_Zelda_Breath_of_the_Wild.png/revision/latest?cb=20200320051740&path-prefix=es')
INSERT [dbo].[Videojuego] ([IdVideojuego], [IdEmpresa], [fechaLanzamiento], [Nombre], [Descripción], [IdClasificacion], [Caratula], [Banner], [Logo]) VALUES (3, 1, CAST(N'2022-11-02' AS Date), N'djkjdksjdsk', N'wqooiddsofsodfipodsfpofpdsofpsopop', 5, N'https://i.pinimg.com/originals/1c/40/68/1c4068993d62d54d4aabe9fbda74a92c.jpg', N'https://i.pinimg.com/originals/1c/40/68/1c4068993d62d54d4aabe9fbda74a92c.jpg', N'https://i.pinimg.com/originals/1c/40/68/1c4068993d62d54d4aabe9fbda74a92c.jpg')
SET IDENTITY_INSERT [dbo].[Videojuego] OFF
GO
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (1, 2)
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (2, 1)
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (2, 2)
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (9, 2)
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (1, 3)
INSERT [dbo].[VideojuegoXCategoria] ([IdCategoria], [IdVideojuego]) VALUES (10, 3)
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Clasificacion] FOREIGN KEY([IdClasificacion])
REFERENCES [dbo].[Clasificacion] ([IdClasificacion])
GO
ALTER TABLE [dbo].[Videojuego] CHECK CONSTRAINT [FK_Videojuego_Clasificacion]
GO
ALTER TABLE [dbo].[Videojuego]  WITH CHECK ADD  CONSTRAINT [FK_Videojuego_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Videojuego] CHECK CONSTRAINT [FK_Videojuego_Empresa]
GO
ALTER TABLE [dbo].[VideojuegoXCategoria]  WITH CHECK ADD  CONSTRAINT [FK_VideojuegoXCategoria_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[VideojuegoXCategoria] CHECK CONSTRAINT [FK_VideojuegoXCategoria_Categoria]
GO
ALTER TABLE [dbo].[VideojuegoXCategoria]  WITH CHECK ADD  CONSTRAINT [FK_VideojuegoXCategoria_Videojuego] FOREIGN KEY([IdVideojuego])
REFERENCES [dbo].[Videojuego] ([IdVideojuego])
GO
ALTER TABLE [dbo].[VideojuegoXCategoria] CHECK CONSTRAINT [FK_VideojuegoXCategoria_Videojuego]
GO
USE [master]
GO
ALTER DATABASE [AlmacenVideoJuegos] SET  READ_WRITE 
GO
