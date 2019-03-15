USE [master]
GO
/****** Object:  Database [Restaurantes]    Script Date: 12/3/2019 23:01:56 ******/
CREATE DATABASE [Restaurantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RESTAURANTES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RESTAURANTES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RESTAURANTES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RESTAURANTES_log.ldf' , SIZE = 2368KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restaurantes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurantes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurantes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurantes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurantes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurantes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurantes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurantes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurantes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurantes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurantes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurantes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurantes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurantes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurantes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurantes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurantes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurantes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurantes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurantes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurantes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurantes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurantes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurantes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurantes] SET RECOVERY FULL 
GO
ALTER DATABASE [Restaurantes] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurantes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurantes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurantes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurantes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restaurantes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Restaurantes]
GO
USE [Restaurantes]
GO
/****** Object:  Sequence [dbo].[SequenceName]    Script Date: 12/3/2019 23:01:56 ******/
CREATE SEQUENCE [dbo].[SequenceName] 
 AS [int]
 START WITH 4
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  Table [dbo].[tbm_Categorias]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Categorias](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](100) NULL,
	[estado] [char](2) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Ciudades]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Ciudades](
	[IdCiudad] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Estado] [char](1) NULL,
	[IdPais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Clientes]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbm_Clientes](
	[IdCliente] [int] NOT NULL,
	[IdPersona] [int] NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbm_comentarios]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_comentarios](
	[IdComentario] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Comentario] [varchar](max) NULL,
	[Fecha] [date] NULL,
	[Estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Empleados]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Empleados](
	[IdEmpleado] [int] NOT NULL,
	[IdPersona] [int] NULL,
	[Tipo] [varchar](20) NULL,
	[FechaSalida] [date] NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Menu]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Menu](
	[id_menu_option] [int] NOT NULL,
	[description] [varchar](50) NULL,
	[id_parent_menu_option] [int] NOT NULL,
	[url] [varchar](80) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Menus]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Menus](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenuId] [int] NULL,
	[Titulo] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[Pagina] [varchar](100) NULL,
	[Id_rol] [int] NULL,
 CONSTRAINT [PK_tbm_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Mesas]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Mesas](
	[IdMesa] [int] NOT NULL,
	[NumAsientos] [int] NULL,
	[Estado] [char](1) NULL,
	[CreadoDate] [date] NULL,
	[CreadoPor] [varchar](30) NULL,
	[ModificadoDate] [date] NULL,
	[ModificadoPor] [varchar](30) NULL,
	[Ocupada] [bit] NULL DEFAULT ((1)),
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Opciones]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Opciones](
	[id_opcion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[estado] [char](1) NULL,
	[nombredepantalla] [varchar](500) NULL,
	[categoria] [int] NULL,
 CONSTRAINT [PK_tbm_Opciones] PRIMARY KEY CLUSTERED 
(
	[id_opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Orden_Detalle]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Orden_Detalle](
	[IdOrdDet] [int] NOT NULL,
	[IdPlato] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [money] NULL,
	[Total] [money] NULL,
	[IdOrden] [int] NULL,
	[Despachado] [char](1) NULL,
 CONSTRAINT [PK_Orden_Detalle] PRIMARY KEY CLUSTERED 
(
	[IdOrdDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Ordenes]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Ordenes](
	[IdOrden] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Cliente] [varchar](50) NULL,
	[IdMesa] [int] NULL,
	[IdEmpleado] [int] NULL,
	[IdSucursal] [int] NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[Subtotal] [money] NULL,
	[IVA] [money] NULL,
	[Total] [money] NULL,
	[Estado] [char](2) NULL CONSTRAINT [DF_tbm_Ordenes_Estado]  DEFAULT ('I'),
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Paises]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Paises](
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Estado] [char](1) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Parametro]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Parametro](
	[nemonico] [varchar](5) NOT NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Permisos_opciones]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbm_Permisos_opciones](
	[id_permisos] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[id_opcion] [int] NULL,
 CONSTRAINT [PK_tbm_Permisos_opciones] PRIMARY KEY CLUSTERED 
(
	[id_permisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbm_Personas]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Personas](
	[IdPersona] [int] NOT NULL,
	[Nombres] [varchar](30) NULL,
	[Apellidos] [varchar](30) NULL,
	[FechaNacimiento] [date] NULL,
	[Numero1] [varchar](15) NULL,
	[Numero2] [varchar](15) NULL,
	[Email] [varchar](40) NULL,
	[CreadoDate] [date] NULL,
	[CreadoPor] [varchar](30) NULL,
	[ModificadoDate] [date] NULL,
	[ModificadoPor] [varchar](30) NULL,
	[CI] [varchar](10) NULL,
	[U_ser] [varchar](50) NULL,
	[Passw] [varchar](50) NULL,
	[Estado] [char](1) NULL,
	[IdCiudad] [int] NULL,
	[id_rol] [int] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Platos]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Platos](
	[IdPlato] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Estado] [char](1) NULL,
	[CreadoDate] [date] NULL,
	[CreadoPor] [varchar](30) NULL,
	[ModificadoDate] [date] NULL,
	[ModificadoPor] [varchar](30) NULL,
	[IdPlatCat] [int] NULL,
	[Informacion] [varchar](max) NULL,
	[Precio] [money] NULL,
	[Tiempo] [int] NULL,
	[urlImagen] [varchar](max) NULL,
 CONSTRAINT [PK_Platos] PRIMARY KEY CLUSTERED 
(
	[IdPlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Platos_Categoria]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Platos_Categoria](
	[IdPlatCat] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Estado] [char](1) NULL,
	[CreadoDate] [date] NULL,
	[CreadoPor] [varchar](30) NULL,
	[ModificadoDate] [date] NULL,
	[ModificadoPor] [varchar](30) NULL,
 CONSTRAINT [PK_Platos_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdPlatCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_rating]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbm_rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Plato] [int] NULL,
	[Id_Usuario] [int] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_tbm_rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbm_Rol]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_tbm_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_Rol_Menu]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbm_Rol_Menu](
	[idRol] [int] NOT NULL,
	[idMenu] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbm_Sucursales]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_Sucursales](
	[IdSucursal] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[CreadoDate] [date] NULL,
	[CreadoPor] [varchar](30) NULL,
	[ModificadoDate] [date] NULL,
	[ModificadoPor] [varchar](30) NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_sugerirplato]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_sugerirplato](
	[Codigo_Iden] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Plato] [int] NOT NULL,
	[Nombre] [char](50) NULL,
	[Observaciones] [varchar](100) NULL,
	[Estado] [char](1) NULL,
	[IdPersona] [int] NULL,
	[CI] [int] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_tbm_sugerirplato_1] PRIMARY KEY CLUSTERED 
(
	[Codigo_Iden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbm_transicion]    Script Date: 12/3/2019 23:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbm_transicion](
	[idordendetalle] [int] NULL,
	[tiempo] [int] NULL,
	[horaarranque] [datetime] NULL,
	[horafinal] [datetime] NULL,
	[estado] [char](1) NULL,
	[idchef] [int] NULL,
	[horarealfin] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbm_Categorias] ON 

GO
INSERT [dbo].[tbm_Categorias] ([id_categoria], [categoria], [estado]) VALUES (1, N'Ingresar', N'A ')
GO
INSERT [dbo].[tbm_Categorias] ([id_categoria], [categoria], [estado]) VALUES (2, N'Modificar', N'A ')
GO
INSERT [dbo].[tbm_Categorias] ([id_categoria], [categoria], [estado]) VALUES (3, N'Eliminar', N'A ')
GO
INSERT [dbo].[tbm_Categorias] ([id_categoria], [categoria], [estado]) VALUES (4, N'Consultas', NULL)
GO
SET IDENTITY_INSERT [dbo].[tbm_Categorias] OFF
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (1, N'GUAYAQUIL', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (2, N'Quito', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (3, N'Cuenca', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (4, N'Ambato', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (5, N'Esmeraldas', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (6, N'Portoviejo', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (7, N'Riobamba', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (8, N'Azogues', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (9, N'Daule', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (10, N'Durán', N'A', 1)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (11, N'Lima', N'A', 2)
GO
INSERT [dbo].[tbm_Ciudades] ([IdCiudad], [Nombre], [Estado], [IdPais]) VALUES (12, N'Cali', N'A', 3)
GO
INSERT [dbo].[tbm_Clientes] ([IdCliente], [IdPersona], [FechaIngreso]) VALUES (1, 35, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[tbm_Clientes] ([IdCliente], [IdPersona], [FechaIngreso]) VALUES (2, 37, CAST(N'2018-10-04' AS Date))
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (1, N'Aldo', N'ahaz@gmail.com', N'Todo muy rico.', CAST(N'2016-01-15' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (2, N'Maria', N'a@hotmail.com', N'No me gusto la comida, estaba agria.', CAST(N'2016-04-12' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (3, N'Jose', N'j@hotmail.com', N'Ahi ahi', CAST(N'2016-05-29' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (4, N'Angela', N'aromero@tes.edu.ec', N'Me parece que usaron mucha sal', CAST(N'2016-05-30' AS Date), N'L')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (5, N'Anthony', N'agarci@tes.edu.ec', N'Volveria con todos los que conozco', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (6, N'Cesar', N'cpolanco@ipac.edu.ec', N'Un lugar muy familiar', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (7, N'Johanna', N'jzamora@ipac.edu.ec', N'Buen Ambiente', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (8, N'Tatiana', N'tespinoza@ipac.edu.ec', N'Mientras mas personas, mas barato', CAST(N'2016-05-30' AS Date), N'L')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (9, N'Sandy', N'ssalinas@hotmail.com', N'No me gusto la atencion', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (10, N'Nayib', N'negas@hotmail.com', N'Se demoraron en mi pedido y estaba apurado', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (11, N'Jessica', N'jpanchana@hotmail.com', N'Muy poca comida', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (12, N'Oscar', N'osaenz@hotmail.com', N'Me gusto, hacen limpieza constantemente', CAST(N'2016-05-30' AS Date), N'L')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (13, N'Armando', N'aparedes@gmail.com', N'Muy rico, pero no me gusto mucho la decoracion', CAST(N'2016-05-30' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (14, N'', N'', N'dfmsndksajdnkjasd', CAST(N'2018-05-19' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (15, N'', N'', N'dfmsndksajdnkjasd', CAST(N'2018-05-19' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (16, N'', N'', N'dfmsndksajdnkjasd', CAST(N'2018-05-19' AS Date), N'N')
GO
INSERT [dbo].[tbm_comentarios] ([IdComentario], [Nombre], [Correo], [Comentario], [Fecha], [Estado]) VALUES (17, N'asdasd', N'kpincay@prueba.com', N'asdasdasdadasdsadad', CAST(N'2018-10-04' AS Date), N'N')
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (6, 26, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-13' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (7, 27, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (8, 28, N'Chef', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (9, 29, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (11, 31, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-01' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (12, 32, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-09-01' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (14, 34, N'Administrador', CAST(N'1900-01-01' AS Date), CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (15, 36, N'Mesero', CAST(N'1900-01-01' AS Date), CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[tbm_Empleados] ([IdEmpleado], [IdPersona], [Tipo], [FechaSalida], [FechaIngreso]) VALUES (29, 29, N'Mesero', CAST(N'1900-01-01' AS Date), CAST(N'2018-10-04' AS Date))
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (1, N'Empleados', 1, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (2, N'Platos', 2, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (3, N'Consultas', 3, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (4, N'Pedidos', 4, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (5, N'Chef', 5, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (6, N'Ingreso', 1, N'~/MenuAdministrador_Emp.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (7, N'Modificar', 1, N'~/MenuAdministrador_Emp.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (8, N'Eliminar', 1, N'~/MenuAdministrador_Emp.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (9, N'Ingreso', 2, N'~/MenuAdministrador_Platos.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (10, N'Modificar', 2, N'~/MenuAdministrador_Platos.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (11, N'Eliminar', 2, N'~/MenuAdministrador_Platos.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (12, N'Reporte de Indicadores', 3, N'~/MenuAdministrador_Reportes0.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (13, N'Reporte de Ventas', 3, N'~/MenuAdministrador_Reportes1.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (14, N'Informarción de Comentarios', 3, N'~/MenuAdministrador_Reportes.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (15, N'Ingreso', 4, N'MenuMesero.aspx?v1=')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (16, N'Asignar', 5, N'MenuCocina.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (17, N'Categoría', 17, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (18, N'Ingresar', 17, N'~/MenuAdministrador_Categ.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (19, N'Modificar', 17, N'~/MenuAdministrador_Categ.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (20, N'Menu para Clientes', 3, N'~/MenuAdministrador_Menu_Cliente.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (1, N'Empleados', 1, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (2, N'Platos', 2, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (3, N'Consultas', 3, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (4, N'Pedidos', 4, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (5, N'Chef', 5, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (6, N'Ingreso', 1, N'~/MenuAdministrador_Emp.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (7, N'Modificar', 1, N'~/MenuAdministrador_Emp.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (8, N'Eliminar', 1, N'~/MenuAdministrador_Emp.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (9, N'Ingreso', 2, N'~/MenuAdministrador_Platos.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (10, N'Modificar', 2, N'~/MenuAdministrador_Platos.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (11, N'Eliminar', 2, N'~/MenuAdministrador_Platos.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (12, N'Reporte de Indicadores', 3, N'~/MenuAdministrador_Reportes0.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (13, N'Reporte de Ventas', 3, N'~/MenuAdministrador_Reportes1.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (14, N'Informarción de Comentarios', 3, N'~/MenuAdministrador_Reportes.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (15, N'Ingreso', 4, N'MenuMesero.aspx?v1=')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (16, N'Asignar', 5, N'MenuCocina.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (17, N'Categoría', 17, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (18, N'Ingresar', 17, N'~/MenuAdministrador_Categ.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (19, N'Modificar', 17, N'~/MenuAdministrador_Categ.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (20, N'Menu para Clientes', 3, N'~/MenuAdministrador_Menu_Cliente.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (1, N'Empleados', 1, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (2, N'Platos', 2, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (3, N'Consultas', 3, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (4, N'Pedidos', 4, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (5, N'Chef', 5, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (6, N'Ingreso', 1, N'~/MenuAdministrador_Emp.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (7, N'Modificar', 1, N'~/MenuAdministrador_Emp.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (8, N'Eliminar', 1, N'~/MenuAdministrador_Emp.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (9, N'Ingreso', 2, N'~/MenuAdministrador_Platos.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (10, N'Modificar', 2, N'~/MenuAdministrador_Platos.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (11, N'Eliminar', 2, N'~/MenuAdministrador_Platos.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (12, N'Reporte de Indicadores', 3, N'~/MenuAdministrador_Reportes0.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (13, N'Reporte de Ventas', 3, N'~/MenuAdministrador_Reportes1.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (14, N'Informarción de Comentarios', 3, N'~/MenuAdministrador_Reportes.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (15, N'Ingreso', 4, N'MenuMesero.aspx?v1=')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (16, N'Asignar', 5, N'MenuCocina.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (17, N'Categoría', 17, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (18, N'Ingresar', 17, N'~/MenuAdministrador_Categ.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (19, N'Modificar', 17, N'~/MenuAdministrador_Categ.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (20, N'Menu para Clientes', 3, N'~/MenuAdministrador_Menu_Cliente.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (1, N'Empleados', 1, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (2, N'Platos', 2, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (3, N'Consultas', 3, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (4, N'Pedidos', 4, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (5, N'Chef', 5, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (6, N'Ingreso', 1, N'~/MenuAdministrador_Emp.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (7, N'Modificar', 1, N'~/MenuAdministrador_Emp.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (8, N'Eliminar', 1, N'~/MenuAdministrador_Emp.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (9, N'Ingreso', 2, N'~/MenuAdministrador_Platos.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (10, N'Modificar', 2, N'~/MenuAdministrador_Platos.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (11, N'Eliminar', 2, N'~/MenuAdministrador_Platos.aspx?v1=2')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (12, N'Reporte de Indicadores', 3, N'~/MenuAdministrador_Reportes0.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (13, N'Reporte de Ventas', 3, N'~/MenuAdministrador_Reportes1.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (14, N'Informarción de Comentarios', 3, N'~/MenuAdministrador_Reportes.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (15, N'Ingreso', 4, N'MenuMesero.aspx?v1=')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (16, N'Asignar', 5, N'MenuCocina.aspx')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (17, N'Categoría', 17, N'#')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (18, N'Ingresar', 17, N'~/MenuAdministrador_Categ.aspx?v1=0')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (19, N'Modificar', 17, N'~/MenuAdministrador_Categ.aspx?v1=1')
GO
INSERT [dbo].[tbm_Menu] ([id_menu_option], [description], [id_parent_menu_option], [url]) VALUES (20, N'Menu para Clientes', 3, N'~/MenuAdministrador_Menu_Cliente.aspx')
GO
SET IDENTITY_INSERT [dbo].[tbm_Menus] ON 

GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (1, 0, N'Ingresar', NULL, NULL, 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (2, 0, N'Modificar', NULL, NULL, 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (3, 0, N'Eliminar', NULL, NULL, 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (4, 0, N'Consultas', NULL, NULL, 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (5, 1, N'Empleado', NULL, N'MenuAdministrador_Emp.aspx?v1=0', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (6, 1, N'Plato', NULL, N'MenuAdministrador_Platos.aspx?v1=0', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (7, 2, N'Empleado', NULL, N'MenuAdministrador_Emp.aspx?v1=1', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (8, 2, N'Plato', NULL, N'MenuAdministrador_Platos.aspx?v1=1', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (9, 3, N'Empleado', NULL, N'MenuAdministrador_Emp.aspx?v1=2', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (10, 3, N'Plato', NULL, N'MenuAdministrador_Platos.aspx?v1=2', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (11, 4, N'Reporte de Indicadores', NULL, N'MenuAdministrador_Reportes0.aspx', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (12, 4, N'Reporte de Ventas', NULL, N'MenuAdministrador_Reportes1.aspx', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (13, 4, N'Información de Comentarios', NULL, N'MenuAdministrador_Reportes.aspx?v1=0', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (19, 0, N'Editar Perfil', NULL, N'menu_cliente.aspx?v1=0', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (20, 0, N'Registro Pedidos', NULL, N'RegistroPedidosClientes.aspx', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (21, 0, N'Modificar  Platos', NULL, N'MenuAdministrador_Platos.aspx?v1=1', 2)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (22, 0, N'Reserva de Mesa', NULL, N'Reservaciones.aspx', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (23, 0, N'Reserva de Mesa', NULL, N'Reservaciones.aspx', 3)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (24, 0, N'Mesas Atendidas', NULL, N'MesasAtendidasMesero.aspx', 3)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (25, 0, N'Platos a Preparar', NULL, N'PlatosaPrepararChef.aspx', 2)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (26, 0, N'Ingreso de Plato ', NULL, N'MenuAdministrador_Platos.aspx?v1=0', 2)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (27, 0, N'Estado de su Pedido', NULL, N'PagEstadoPed.aspx', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (28, 0, N'Votar por platos sugeridos', NULL, N'PAG1.aspx', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (29, 1, N'Categoria', NULL, N'AgregarCategoria.aspx', 1)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (30, 0, N'Sugerir Plato', NULL, N'Sugerir_Plato.aspx', 4)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (31, 0, N'Platos Sugeridos', NULL, N'PAG1.aspx', 3)
GO
INSERT [dbo].[tbm_Menus] ([MenuId], [ParentMenuId], [Titulo], [Descripcion], [Pagina], [Id_rol]) VALUES (32, 4, N'Platos más solicitados', NULL, N'Platos_Solicitados.aspx', 1)
GO
SET IDENTITY_INSERT [dbo].[tbm_Menus] OFF
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (1, 4, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (2, 4, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (3, 4, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (4, 6, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (5, 6, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (6, 6, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (7, 6, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (8, 8, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (9, 8, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (10, 8, N'1', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (11, 2, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (12, 3, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (13, 5, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (14, 2, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (15, 3, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (16, 4, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (17, 7, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (18, 10, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (19, 5, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
INSERT [dbo].[tbm_Mesas] ([IdMesa], [NumAsientos], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [Ocupada]) VALUES (20, 1, N'1', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', 1)
GO
SET IDENTITY_INSERT [dbo].[tbm_Opciones] ON 

GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (1, N'Empleado', N'A', NULL, 1)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (2, N'Plato', N'A', NULL, 1)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (3, N'Empleado', N'A', NULL, 2)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (4, N'Plato', N'A', NULL, 2)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (5, N'Empleado', N'A', NULL, 3)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (6, N'Plato', N'A', NULL, 3)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (7, N'Reporte de Indicadores', N'A', NULL, 4)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (8, N'Reporte de Ventas', N'A', NULL, 4)
GO
INSERT [dbo].[tbm_Opciones] ([id_opcion], [descripcion], [estado], [nombredepantalla], [categoria]) VALUES (9, N'Información de Comentarios', N'A', NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[tbm_Opciones] OFF
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (0, 17, 1, 3.5000, 3.5000, 15, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (1, 15, 1, 6.0000, 6.0000, 17, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (2, 4, 2, 3.5000, 7.0000, 18, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (3, 5, 1, 2.5000, 2.5000, 18, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (4, 18, 1, 4.0000, 4.0000, 19, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (5, 2, 2, 1.0000, 2.0000, 20, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (6, 16, 2, 5.0000, 10.0000, 21, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (7, 1, 3, 1.5000, 4.5000, 21, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (8, 19, 2, 3.5000, 7.0000, 22, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (9, 18, 10, 4.0000, 40.0000, 24, NULL)
GO
INSERT [dbo].[tbm_Orden_Detalle] ([IdOrdDet], [IdPlato], [Cantidad], [Precio], [Total], [IdOrden], [Despachado]) VALUES (10, 4, 14, 3.5000, 49.0000, 25, NULL)
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (0, CAST(N'2017-09-20' AS Date), N'leonel', 1, 9, 1, N'', N'', 5.0000, 0.6000, 5.6000, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (1, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 5.0000, 0.6000, 5.6000, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (2, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 3, 9, 1, N'', N'', 15.0000, 1.8000, 16.8000, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (3, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 5.0000, 0.6000, 5.6000, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (4, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (5, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 20, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (6, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 4.0000, 0.4800, 4.4800, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (7, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 4.0000, 0.4800, 4.4800, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (8, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 42.0000, 5.0400, 47.0400, N'X ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (9, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 48.0000, 5.7600, 53.7600, N'X ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (10, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'X ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (11, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 7.0000, 0.8400, 7.8400, N'X ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (12, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (13, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (14, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 5.0000, 0.6000, 5.6000, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (15, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 18, 9, 1, N'', N'', 3.5000, 0.4200, 3.9200, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (16, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 5.0000, 0.6000, 5.6000, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (17, CAST(N'2017-09-20' AS Date), N'Alexandra Guillin', 1, 9, 1, N'', N'', 6.0000, 0.7200, 6.7200, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (18, CAST(N'2017-09-21' AS Date), N'maria morocho', 1, 9, 1, N'', N'', 9.5000, 1.1400, 10.6400, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (19, CAST(N'2017-09-21' AS Date), N'roberto gacia', 1, 9, 1, N'', N'', 4.0000, 0.4800, 4.4800, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (20, CAST(N'2017-07-09' AS Date), N'ALE', 2, 6, 1, N'', N'', 2.0000, 0.2400, 2.2400, N'D ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (21, CAST(N'2017-09-28' AS Date), N'Manuel ', 1, 9, 1, N'', N'', 14.5000, 1.7400, 16.2400, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (22, CAST(N'2017-10-10' AS Date), N'Malena', 1, 15, 1, N'', N'', 7.0000, 0.8400, 7.8400, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (23, CAST(N'2018-10-04' AS Date), N'Prueba', 1, 29, 1, N'', N'', 73.5000, 8.8200, 82.3200, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (24, CAST(N'2018-10-04' AS Date), N'asdasdasd', 1, 29, 1, N'', N'', 40.0000, 4.8000, 44.8000, N'I ')
GO
INSERT [dbo].[tbm_Ordenes] ([IdOrden], [Fecha], [Cliente], [IdMesa], [IdEmpleado], [IdSucursal], [Direccion], [Telefono], [Subtotal], [IVA], [Total], [Estado]) VALUES (25, CAST(N'2018-10-05' AS Date), N'sdfsdfdsfdsf', 5, 29, 1, N'', N'', 49.0000, 5.8800, 54.8800, N'I ')
GO
INSERT [dbo].[tbm_Paises] ([IdPais], [Nombre], [Estado]) VALUES (1, N'Ecuador', N'A')
GO
INSERT [dbo].[tbm_Paises] ([IdPais], [Nombre], [Estado]) VALUES (2, N'Perú', N'A')
GO
INSERT [dbo].[tbm_Paises] ([IdPais], [Nombre], [Estado]) VALUES (3, N'Colombia', N'A')
GO
INSERT [dbo].[tbm_Parametro] ([nemonico], [valor]) VALUES (N'MAXW', N'300')
GO
INSERT [dbo].[tbm_Parametro] ([nemonico], [valor]) VALUES (N'MAXH', N'300')
GO
INSERT [dbo].[tbm_Parametro] ([nemonico], [valor]) VALUES (N'MAXW', N'300')
GO
INSERT [dbo].[tbm_Parametro] ([nemonico], [valor]) VALUES (N'MAXH', N'300')
GO
SET IDENTITY_INSERT [dbo].[tbm_Permisos_opciones] ON 

GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (1, 1, 1)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (2, 1, 2)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (3, 1, 3)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (4, 1, 4)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (5, 1, 5)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (6, 1, 6)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (7, 1, 7)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (8, 1, 8)
GO
INSERT [dbo].[tbm_Permisos_opciones] ([id_permisos], [id_rol], [id_opcion]) VALUES (9, 1, 9)
GO
SET IDENTITY_INSERT [dbo].[tbm_Permisos_opciones] OFF
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (3, N'Miguel', N'Pallo', CAST(N'1995-12-12' AS Date), N'2258746', N'0952365418', N'mpallo@tes.edu.ec', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', N'0995175325', N'mpallo', N'1234', N'A', 1, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (4, N'Angela', N'Romero', CAST(N'1979-09-25' AS Date), N'2365478', N'0967312385', N'aromero@tes.edu.ec', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', N'0909261548', N'aromero', N'12345', N'A', 3, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (5, N'Anthony', N'Garcia', CAST(N'1996-03-25' AS Date), N'2365877', N'0965239968', N'agarci@tes.edu.ec', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', N'0978563214', N'agarcia', N'54321', N'A', 8, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (6, N'El', N'Man', CAST(N'1996-03-25' AS Date), N'2365877', N'0965239968', N'elman@hotmail.com', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', N'0978563214', N'eman', N'54321', N'I', 10, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (7, N'Cesar', N'Polanco', CAST(N'1977-11-29' AS Date), N'2368456', N'0994610804', N'cpolanco@ipac.edu.ec', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0915102030', N'cpolanco', N'23454', N'A', 7, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (8, N'Johanna', N'Zamora', CAST(N'1994-07-29' AS Date), N'2617272', N'0939688684', N'jzamora@ipac.edu.ec', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1206177769', N'jzamora', N'34568', N'A', 5, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (9, N'Tatiana', N'Espinoza', CAST(N'1970-01-18' AS Date), N'2345678', N'0987654569', N'tespinoza@ipac.edu.ec', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0934568265', N'tespinoza', N'67543', N'A', 4, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (10, N'Sandy', N'Salinas', CAST(N'1994-01-03' AS Date), N'2508237', N'0993456823', N'ssalinas@hotmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1234567890', N'ssalinas', N'56725', N'A', 6, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (11, N'Nayib', N'Egas', CAST(N'1990-04-30' AS Date), N'2346547', N'0986748590', N'negas@hotmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1568490333', N'negas', N'68867', N'A', 1, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (12, N'Jessica', N'Panchana', CAST(N'1970-12-12' AS Date), N'3648494', N'0974528498', N'jpanchana@hotmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1246805479', N'jpanchana', N'87655', N'A', 2, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (13, N'Oscar', N'Saenz', CAST(N'1950-12-30' AS Date), N'4728490', N'0975375974', N'osaenz@hotmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1563839508', N'osaenz', N'74629', N'A', 3, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (14, N'Armando', N'Paredes', CAST(N'1980-04-06' AS Date), N'3746485', N'0987654333', N'aparedes@gmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0987678975', N'aparedes', N'754807978', N'A', 4, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (15, N'Maria', N'Garcia', CAST(N'1975-05-30' AS Date), N'6546897', N'0987864235', N'mgarcia@gmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0987589054', N'mgarcia', N'holi', N'A', 5, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (16, N'Dione', N'Martinez', CAST(N'1989-06-12' AS Date), N'4638274', N'0983647482', N'dmartinez@gmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0987654421', N'dmartinez', N'houdini', N'A', 6, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (17, N'Azucena', N'Zamora', CAST(N'1940-09-25' AS Date), N'8465957', N'0986580354', N'azamora@gmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1234321345', N'azamora', N'hihi', N'A', 7, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (18, N'Miguel', N'Avila', CAST(N'1987-08-31' AS Date), N'7464848', N'0984659385', N'mavila@gmail.com', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'1265857969', N'mavila', N'kiki', N'A', 8, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (21, N'Washinton', N'Bajaña', CAST(N'1987-07-06' AS Date), N'2152368', N'0993653286', N'wbajana@ipac.edu.ec', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', CAST(N'2016-05-30' AS Date), N'Rosa Navarrete', N'0987656784', N'wbajana', N'45673', N'A', 1, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (23, N'Leonel Adan', N'Triviño Sanchez', CAST(N'1995-11-25' AS Date), N'32333', N'09923232344', N'leogu1996@hotmail.com', CAST(N'2017-09-08' AS Date), N'KEVIN PINCAY', CAST(N'2017-09-08' AS Date), N'KEVIN PINCAY', N'0923239065', N'ltrivino', N'Leonel', N'A', 1, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (25, N'miguel', N'rodriguez', CAST(N'2017-01-31' AS Date), N'344222', N'4877585885', N'jfuurjrj@gmail.com', CAST(N'2017-09-08' AS Date), N'KEVIN PINCAY', CAST(N'2017-09-08' AS Date), N'KEVIN PINCAY', N'0999999999', N'mrodriguez', N'1234', N'A', 4, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (26, N'pruebaA', N'pruebaA', CAST(N'1994-02-02' AS Date), N'12345', N'123456789', N'puebaA@hotmail.com', CAST(N'2017-09-20' AS Date), N'Leonel Adan Triviño Sanchez', CAST(N'2017-09-20' AS Date), N'Leonel Adan Triviño Sanchez', N'0911111111', N'pA', N'1234', N'A', 1, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (27, N'puebaB', N'pruebaB', CAST(N'2010-02-10' AS Date), N'12345', N'09333333', N'puebaB@hotmail.com', CAST(N'2017-09-20' AS Date), N'Leonel Adan Triviño Sanchez', CAST(N'2017-09-20' AS Date), N'Leonel Adan Triviño Sanchez', N'0999999993', N'pB', N'1234', N'A', 11, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (28, N'Dayana', N'Guillin', CAST(N'1996-01-31' AS Date), N'2278544', N'90986938775', N'dayana.guillin@hotmail.com', CAST(N'2017-09-20' AS Date), N'puebaB pruebaB', CAST(N'2017-09-20' AS Date), N'puebaB pruebaB', N'0923239065', N'dguillin', N'1234', N'A', 3, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (29, N'Kevin', N'Pincay', CAST(N'1999-07-22' AS Date), N'111111', N'0944444', N'kpincay@hotmail.com', CAST(N'2017-09-20' AS Date), N'puebaB pruebaB', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', N'0923239064', N'kpincay', N'1234', N'A', 12, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (31, N'Emilio', N'Cayambe', CAST(N'1987-09-01' AS Date), N'76677632', N'67672167', N'lemi@hotmail.com', CAST(N'2017-09-28' AS Date), N'pruebaA pruebaA', CAST(N'2017-09-28' AS Date), N'pruebaA pruebaA', N'099999992', N'ecayambe', N'1234', N'A', 12, 4)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (32, N'Alexandra', N'Pinos', CAST(N'2017-09-01' AS Date), N'233232', N'23323', N'ao@hotmail.com', CAST(N'2017-09-28' AS Date), N'Emilio Cayambe', CAST(N'2017-09-28' AS Date), N'Emilio Cayambe', N'094334434', N'apinos', N'1234', N'A', 12, 2)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (34, N'Leonel Adan', N'Triviño Sanchez', CAST(N'1995-11-25' AS Date), N'093388383', N'093993333', N'leogu1996@hotmail.com', CAST(N'2017-10-10' AS Date), N'pruebaA pruebaA', CAST(N'2017-10-10' AS Date), N'pruebaA pruebaA', N'0923230965', N'ltrivinos', N'1234', N'A', 10, 1)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (35, N'Cliente', N'Prueba', CAST(N'1995-12-25' AS Date), N'000001', N'222223', N'ltrivino@favorita.com', CAST(N'2017-09-28' AS Date), N'Emilio Cayambe', CAST(N'2017-09-28' AS Date), N'Emilio Cayambe', N'1212121212', N'ltrivinoc', N'1234', N'A', 3, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (36, N'Adan', N'Sanchez', CAST(N'2017-10-10' AS Date), N'2344', N'342433234243', N'adan@hotmail.com', CAST(N'2017-10-10' AS Date), N'Leonel Adan Triviño Sanchez', CAST(N'2017-10-10' AS Date), N'Leonel Adan Triviño Sanchez', N'1313131313', N'sadan', N'1234', N'A', 5, 3)
GO
INSERT [dbo].[tbm_Personas] ([IdPersona], [Nombres], [Apellidos], [FechaNacimiento], [Numero1], [Numero2], [Email], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [CI], [U_ser], [Passw], [Estado], [IdCiudad], [id_rol]) VALUES (37, N'Kevin', N'Pincay', CAST(N'2018-10-18' AS Date), N'0543535345', N'749310271', N'kpincay@hotmail.com', NULL, NULL, NULL, NULL, N'0988785421', N'kpincayl', N'1234', N'A', 10, 1)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (1, N'Jugos Naturales', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 6, N'Ponemos a su disposición una variedad 
de    jugos   naturales   endulzados   con 
esplenda  y  hecho  a  base  de  la  pulpa 
de la fruta.', 1.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (2, N'Aguas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 6, N'1 Botella de agua de 250ml', 1.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (3, N'Vinos', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 6, N'Tenemos un extenso catalogo de vinos 
para  su  eleccion,  selecionados  espe-
cialmente para nuestros mas refinados 
clientes.', 5.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (4, N'Cervezas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 6, N'1 Cerveza 600ml', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (5, N'Cafe', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2017-10-09' AS Date), N'pruebaA pruebaA', 1, N'Cafe', 25000.0000, 120, N'~/images/naturo.jpg')
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (6, N'Cappuccino', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Cappuccino', 3.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (7, N'Mocaccino', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Mocaccino', 3.2000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (8, N'Batidos', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Batios de frutas.', 3.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (9, N'Pancakes', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Pancakes', 1.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (10, N'Tostadas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Tostadas', 2.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (11, N'Sanduches', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Sanduches', 2.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (12, N'Humitas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Humitas', 1.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (13, N'Bolon de Verde', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Bolon de verde', 1.2000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (14, N'Hallacas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 1, N'Hallacas', 1.2000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (15, N'Aji de Carne', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Carne, papa, maní, cebolla blanca, 
ajo,    cebolla    paiteña    colorada, 
comino,  mantequilla, manqueños, 
achiote, culantro, leche, aguacate, 
queso.', 6.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (16, N'Caldo de Bola', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Pulpa de res, Costilla de res, yuca, 
papa,    verdura,    col,    zanahoria,
choclo tierno, verde grande, maní,
achiote, tomates, cebolla colorada,
pimiento verde, ajo, cilantro, arveja,
huevos, pasa, aceituna, hierbabuena.', 5.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (17, N'Caldo de Pata', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Pata de res, Cebolla Blanca, Perejil, 
aceite,  maní,  leche,  mote, Achiote, 
sal    y    comino    molido   al  gusto.', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (18, N'Crema de Choclo', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Choclos tiernos, Dientes de ajo, 
Cebolla Blanca, Caldo de Pollo, 
Huevo,    Leche,    Pimienta,  Sal', 4.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (19, N'Encebollado', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Albacora, Yuca, Cebolla colorada, 
Cebolla blanca, Tomate, Pimiento, 
Ají peruano.', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (20, N'Locro de Papa', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Papa chola, Queso de Mesa, leche, 
Huevo,    Cebolla    Blanca,   Aceite, 
Orégano, Acompañado para el Locro, 
Lechuga, Tomate con rábano hecho 
ensaladita con limón y sal, Aguacate.', 4.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (21, N'Menestron', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Fréjol Maduro, Fideo Macarron, Papas,
Carne   de   res  o   de   chancho,   Ajo, 
Especies   al   gusto,   Cebolla,   Apio, 
Tomate.', 4.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (22, N'Sopa de Lentejas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 2, N'Lenteja en conserva, Cebolla, Diente de 
ajo,  Apio,  Aceite  de  oliva  extra virgen, 
Rebanadas  de  pan  duro,  Sal  al gusto.', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (23, N'Arroz con Cangrejo y Camaron', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Camarón, Cangrejo, Arroz, Tomates, 
Pimiento Rojo, Pimiento Verde, Cebolla 
Colorada, Aceite, Achiote, Culantro, Sal, 
Pimienta, Comino ', 6.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (24, N'Arroz con Concha', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Conchas, Arroz, Cebolla paiteña grande,
Pimiento verde, Perejil picado, Cilantro 
picado, Orégano, Aceite, Sal y pimienta 
al gusto.', 6.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (25, N'Arroz con Pollo', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Pollo, Cebollas Coloradas, Cebollas 
Blancas, Pimiento, Aceite, Achiote, 
Hierbita, Zanahoria, Dientes de ajo, 
Alverjas    Cocidas,    Pasas,    Sal, 
Pimiento y Comino.', 5.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (26, N'Arroz Marinero', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Arroz, Caldo de pescado o mariscos, 
Camarones, Almejas, Conchas, Calamar, 
Mejillones, Gambas, Pescado blanco, 
Aceite de girasol, Mantequilla, Achiote 
molido, Dientes de ajo machacado, 
Cilantro, Comino, Cebolla blanca 
picada finamente, Pimiento picado, 
Sal y pimienta al gusto.', 7.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (27, N'Arroz con Menestra y Carne', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Fréjol, Arroz, Cebolla Blanca, Tomate, 
Aceite con achiote, Plátano en rodaja 
frito, Pimienta, Bistec de ternera, 
Pimiento verde, Cebolla paiteña, 
Perejil picado, Comino molido, Sal. ', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (28, N'Cangrejos', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Cangrejos, Cebollas blanca largas, 
Pimienta negra, Cilantro, Orégano, 
Comino en grano, Sal, Ajos machacados, 
Cerveza, Plátanos maduros, Plátanos ', 8.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (29, N'Ceviche', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Camarones frescos, Cebollas coloradas 
grandes, Limones, Salsa de tomate, Ají 
al gusto, Aceite de mesa.', 5.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (30, N'Churrasco', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 3, N'Lomo, Huevos, Arroz, Papas, Maduros, 
Lechuga, Tomates, Cebolla, Pepino.', 3.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (31, N'Corviche', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 4, N'Corviche', 2.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (32, N'Croquetas de Arroz', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 4, N'Croquetas de Arroz', 3.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (33, N'Empanadas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 4, N'Empanadas', 1.5000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (34, N'Tres Leches', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 5, N'Tres Leches', 3.7000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (35, N'Flan de Coco', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 5, N'Flan de Coco', 4.0000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (36, N'Cheesecake', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 5, N'Cheesecake', 3.9000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (37, N'Croquetas de camarón', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz', 4, N'Croquetas de camarón, con salsa de aguacate.', 2.9000, 120, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (38, N'Amareto', N'A', CAST(N'2016-10-13' AS Date), N'Aldo Haz', CAST(N'2016-10-13' AS Date), N'Aldo Haz', 6, N'1', 1.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (39, N'Amareto', N'A', CAST(N'2016-10-13' AS Date), N'Aldo Haz', CAST(N'2016-10-13' AS Date), N'Aldo Haz', 6, N'1', 1.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (42, N'Amareto', N'A', CAST(N'2016-10-13' AS Date), N'Aldo Haz', CAST(N'2016-10-13' AS Date), N'Aldo Haz', 6, N'1', 1.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (43, N'Scott', N'A', CAST(N'2016-10-13' AS Date), N'Aldo Haz', CAST(N'2016-10-13' AS Date), N'Aldo Haz', 6, N'bebida', 1.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (44, N'Aromatica', N'A', CAST(N'2016-10-13' AS Date), N'Aldo Haz', CAST(N'2016-10-13' AS Date), N'Aldo Haz', 6, N'te', 1.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (46, N'Sangria', N'A', CAST(N'2017-09-26' AS Date), N'pruebaA pruebaA', CAST(N'2017-09-26' AS Date), N'pruebaA pruebaA', 6, N'Sangria', 23.0000, 30, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (47, N'Guanchaca', N'A', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', 6, N'levanta Muerto', 12.0000, 1, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (48, N'Kripi', N'A', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', 6, N'Prueba 1', 120000.0000, 12, N'~/images/foto.jpg')
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (49, N'patuta', N'A', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', CAST(N'2017-10-08' AS Date), N'pruebaA pruebaA', 6, N'hi', 34.0000, 12, N'~/images/lucas.jpg')
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (50, N'Tapado Arrecho', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (51, N'Tapado Arrecho', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (52, N'Tapado Arrecho', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (53, N'Prueba Uno', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (54, N'Prueba Dos', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (55, N'Prueba Cuatro', N'A', CAST(N'2018-10-11' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (56, N'Prueba Tres', N'A', CAST(N'2019-02-21' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (57, N'asdasd', N'A', CAST(N'2019-02-22' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos] ([IdPlato], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor], [IdPlatCat], [Informacion], [Precio], [Tiempo], [urlImagen]) VALUES (58, N'Prueba 1', N'A', CAST(N'2019-02-25' AS Date), N'Plato Sugerido', NULL, NULL, 3, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (1, N'Desayunos', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (2, N'Entradas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (3, N'Platos Fuertes', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (4, N'Piqueos', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (5, N'Postres', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (6, N'Bebidas', N'A', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (7, N'Cebiche', N'I', CAST(N'2016-10-03' AS Date), N'Aldo Haz', CAST(N'2016-10-03' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (8, N'Encebollado', N'A', CAST(N'2016-10-03' AS Date), N'Aldo Haz', CAST(N'2016-10-03' AS Date), N'Aldo Haz')
GO
INSERT [dbo].[tbm_Platos_Categoria] ([IdPlatCat], [Nombre], [Estado], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (9, N'Entrada 2', N'A', CAST(N'2016-10-03' AS Date), N'Aldo Haz', CAST(N'2016-10-03' AS Date), N'Aldo Haz')
GO
SET IDENTITY_INSERT [dbo].[tbm_rating] ON 

GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (1, 6, 29, 2)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (2, 6, 29, 2)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (3, 12, 29, 3)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (4, 4, 29, 2)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (5, 7, 29, 5)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (6, 11, 29, 3)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (7, 15, 29, 1)
GO
INSERT [dbo].[tbm_rating] ([Id], [Id_Plato], [Id_Usuario], [Rating]) VALUES (8, 2, 29, 5)
GO
SET IDENTITY_INSERT [dbo].[tbm_rating] OFF
GO
SET IDENTITY_INSERT [dbo].[tbm_Rol] ON 

GO
INSERT [dbo].[tbm_Rol] ([idRol], [description]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[tbm_Rol] ([idRol], [description]) VALUES (2, N'Chef')
GO
INSERT [dbo].[tbm_Rol] ([idRol], [description]) VALUES (3, N'Mesero')
GO
INSERT [dbo].[tbm_Rol] ([idRol], [description]) VALUES (4, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[tbm_Rol] OFF
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 1)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 2)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 3)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 4)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 5)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 6)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 7)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 8)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 9)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 10)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 11)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 12)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 14)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 15)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 16)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 17)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 18)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 19)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 20)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 1)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 2)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 3)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 4)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 5)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 6)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 7)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 8)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 9)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 10)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 11)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 12)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 14)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 15)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 16)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 17)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 18)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 19)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 20)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 1)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 2)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 3)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 4)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 5)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 6)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 7)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 8)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 9)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 10)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 11)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 12)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 14)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 15)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 16)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 17)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 18)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 19)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 20)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 1)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 2)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 3)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 4)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 5)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 6)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 7)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 8)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 9)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 10)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 11)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 12)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 14)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (2, 15)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (3, 16)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 17)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 18)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 19)
GO
INSERT [dbo].[tbm_Rol_Menu] ([idRol], [idMenu]) VALUES (1, 20)
GO
INSERT [dbo].[tbm_Sucursales] ([IdSucursal], [Nombre], [CreadoDate], [CreadoPor], [ModificadoDate], [ModificadoPor]) VALUES (1, N'GYE', CAST(N'2016-05-14' AS Date), N'Aldo Haz', CAST(N'2016-05-14' AS Date), N'Aldo Haz')
GO
SET IDENTITY_INSERT [dbo].[tbm_sugerirplato] ON 

GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (1, 1, N'Prueba 1                                          ', N'asdas', N'A', 0, 0, CAST(N'2019-02-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (2, 2, N'Prueba 2                                          ', N'asdasda', N'P', 0, 0, CAST(N'2019-02-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (3, 3, N'Prueba 3                                          ', N'asda', N'P', 0, 0, CAST(N'2019-02-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (4, 4, N'Prueba 4                                          ', N'asdas', N'P', 0, 0, CAST(N'2019-02-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (5, 5, N'Prueba 5                                          ', N'adasd', N'P', 0, 0, CAST(N'2019-08-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (6, 6, N'Prueba 6                                          ', N'asdasd', N'P', 0, 0, CAST(N'2019-02-22' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (7, 7, N'Prueba 7                                          ', N'ASDASDAS', N'P', 0, 0, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (8, 1, N'Prueba 1                                          ', N'asdas', N'A', 29, 1, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (9, 4, N'Prueba 4                                          ', N'asdas', N'V', 29, 1, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (10, 3, N'Prueba 3                                          ', N'asda', N'V', 29, 1, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (11, 7, N'Prueba 7                                          ', N'ASDASDAS', N'V', 29, 1, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (12, 2, N'Prueba 2                                          ', N'asdasda', N'V', 29, 1, CAST(N'2019-02-25' AS Date))
GO
INSERT [dbo].[tbm_sugerirplato] ([Codigo_Iden], [Codigo_Plato], [Nombre], [Observaciones], [Estado], [IdPersona], [CI], [Fecha]) VALUES (13, 1, N'Prueba 1                                          ', N'adasd', N'A', 30, 1, CAST(N'2019-02-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tbm_sugerirplato] OFF
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (1, 600, CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'I', 1, CAST(N'2016-05-14 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (2, 1, CAST(N'2016-05-30 14:50:43.000' AS DateTime), CAST(N'2016-05-30 14:51:43.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (1, 600, CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'I', 1, CAST(N'2016-05-14 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (2, 1, CAST(N'2016-05-30 14:50:43.000' AS DateTime), CAST(N'2016-05-30 14:51:43.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (9, 120, CAST(N'2017-09-21 09:24:42.000' AS DateTime), CAST(N'2017-09-21 09:26:42.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (10, 120, CAST(N'2017-09-28 20:42:16.000' AS DateTime), CAST(N'2017-09-28 20:44:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (11, 120, CAST(N'2017-09-28 20:42:16.000' AS DateTime), CAST(N'2017-09-28 20:44:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (12, 120, CAST(N'2017-10-10 23:11:06.000' AS DateTime), CAST(N'2017-10-10 23:13:06.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (13, 120, CAST(N'2018-10-04 11:19:18.000' AS DateTime), CAST(N'2018-10-04 11:19:18.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (14, 120, CAST(N'2018-10-05 13:59:40.000' AS DateTime), CAST(N'2018-10-05 13:59:40.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (1, 600, CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'I', 1, CAST(N'2016-05-14 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (2, 1, CAST(N'2016-05-30 14:50:43.000' AS DateTime), CAST(N'2016-05-30 14:51:43.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (1, 600, CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'I', 1, CAST(N'2016-05-14 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (2, 1, CAST(N'2016-05-30 14:50:43.000' AS DateTime), CAST(N'2016-05-30 14:51:43.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (3, 2, CAST(N'2016-05-30 15:47:05.000' AS DateTime), CAST(N'2016-05-30 15:49:05.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (4, 3, CAST(N'2016-05-30 15:49:32.000' AS DateTime), CAST(N'2016-05-30 15:52:32.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (6, 5, CAST(N'2016-05-30 16:01:52.000' AS DateTime), CAST(N'2016-05-30 16:06:52.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (7, 6, CAST(N'2016-05-30 16:04:47.000' AS DateTime), CAST(N'2016-05-30 16:10:47.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (8, 7, CAST(N'2016-05-30 16:06:16.000' AS DateTime), CAST(N'2016-05-30 16:13:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (5, 4, CAST(N'2016-05-30 15:57:41.000' AS DateTime), CAST(N'2016-05-30 16:01:41.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (9, 120, CAST(N'2017-09-21 09:24:42.000' AS DateTime), CAST(N'2017-09-21 09:26:42.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (10, 120, CAST(N'2017-09-28 20:42:16.000' AS DateTime), CAST(N'2017-09-28 20:44:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (11, 120, CAST(N'2017-09-28 20:42:16.000' AS DateTime), CAST(N'2017-09-28 20:44:16.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (12, 120, CAST(N'2017-10-10 23:11:06.000' AS DateTime), CAST(N'2017-10-10 23:13:06.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (13, 120, CAST(N'2018-10-04 11:19:18.000' AS DateTime), CAST(N'2018-10-04 11:19:18.000' AS DateTime), N'C', 0, NULL)
GO
INSERT [dbo].[tbm_transicion] ([idordendetalle], [tiempo], [horaarranque], [horafinal], [estado], [idchef], [horarealfin]) VALUES (14, 120, CAST(N'2018-10-05 13:59:40.000' AS DateTime), CAST(N'2018-10-05 13:59:40.000' AS DateTime), N'C', 0, NULL)
GO
ALTER TABLE [dbo].[tbm_Ciudades]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[tbm_Paises] ([IdPais])
GO
ALTER TABLE [dbo].[tbm_Ciudades]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[tbm_Paises] ([IdPais])
GO
ALTER TABLE [dbo].[tbm_Ciudades]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[tbm_Paises] ([IdPais])
GO
ALTER TABLE [dbo].[tbm_Ciudades]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[tbm_Paises] ([IdPais])
GO
ALTER TABLE [dbo].[tbm_Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[tbm_Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[tbm_Clientes] CHECK CONSTRAINT [FK_Clientes_Personas]
GO
ALTER TABLE [dbo].[tbm_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[tbm_Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[tbm_Empleados] CHECK CONSTRAINT [FK_Empleados_Personas]
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle]  WITH CHECK ADD  CONSTRAINT [fk_detalle] FOREIGN KEY([IdPlato])
REFERENCES [dbo].[tbm_Platos] ([IdPlato])
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle] CHECK CONSTRAINT [fk_detalle]
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle]  WITH CHECK ADD  CONSTRAINT [fk_Orden] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[tbm_Ordenes] ([IdOrden])
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle] CHECK CONSTRAINT [fk_Orden]
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle]  WITH CHECK ADD  CONSTRAINT [fk_Ordenes] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[tbm_Ordenes] ([IdOrden])
GO
ALTER TABLE [dbo].[tbm_Orden_Detalle] CHECK CONSTRAINT [fk_Ordenes]
GO
ALTER TABLE [dbo].[tbm_Ordenes]  WITH CHECK ADD  CONSTRAINT [fk_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbm_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbm_Ordenes] CHECK CONSTRAINT [fk_Empleado]
GO
ALTER TABLE [dbo].[tbm_Ordenes]  WITH CHECK ADD  CONSTRAINT [fk_Mesa] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[tbm_Mesas] ([IdMesa])
GO
ALTER TABLE [dbo].[tbm_Ordenes] CHECK CONSTRAINT [fk_Mesa]
GO
ALTER TABLE [dbo].[tbm_Ordenes]  WITH CHECK ADD  CONSTRAINT [fk_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[tbm_Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[tbm_Ordenes] CHECK CONSTRAINT [fk_Sucursal]
GO
ALTER TABLE [dbo].[tbm_Permisos_opciones]  WITH CHECK ADD  CONSTRAINT [fk_id_opciones] FOREIGN KEY([id_permisos])
REFERENCES [dbo].[tbm_Opciones] ([id_opcion])
GO
ALTER TABLE [dbo].[tbm_Permisos_opciones] CHECK CONSTRAINT [fk_id_opciones]
GO
ALTER TABLE [dbo].[tbm_Personas]  WITH CHECK ADD  CONSTRAINT [fk_ciudad] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tbm_Ciudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tbm_Personas] CHECK CONSTRAINT [fk_ciudad]
GO
ALTER TABLE [dbo].[tbm_Platos]  WITH CHECK ADD  CONSTRAINT [FK_Platos_Platos_Categoria] FOREIGN KEY([IdPlatCat])
REFERENCES [dbo].[tbm_Platos_Categoria] ([IdPlatCat])
GO
ALTER TABLE [dbo].[tbm_Platos] CHECK CONSTRAINT [FK_Platos_Platos_Categoria]
GO
/****** Object:  StoredProcedure [dbo].[RegistraClientes]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[RegistraClientes]  
	-- parametros
	@Nombres   varchar(30),
	@Apellido	Varchar(30),
	@FchNaci	date,
	@Celu		varchar(10),
	@Telf		varchar(9),
	@correo		varchar(60),
	@User		varchar(50),
	@Passw		varchar(50),
	@Cedula		varchar(10),
	@Ciudad		int,
	@Error varchar(100) output

	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
     set @Error  = 'OK'

	declare @IDPersona  int,@IdCliente int , @Validador int , @Continuar varchar(1) = 'S'

	 
	--OBTENGO ID DE TABLAS 
	 set @IDPersona   = (SELECT isnull(MAX(p.IdPersona),0) +1
							    FROM tbm_Personas as p)

	 set @IdCliente  = (select  isnull(max(c.IdCliente),0) +1 
								from tbm_Clientes c) 

     	--valido que no exista otro cliente con el mismo id
	set @Validador   = (select COUNT(1) 
							   from tbm_Personas as per
								 where per.CI = @Cedula)

	if @Validador > 0 
	  begin
	   set @Error  = 'Ya existe otro Cliente con el mismo numero de identificacion'
	   set @Continuar = 'N'
	end

	--valido que no exista otra persona con el mismo usuario
	if @Validador = 0
	  begin
	  set @Validador = (select count(1)
					    from tbm_Personas
						where U_ser = @User)

		if @Validador > 0 
		  begin
		   set @Error  = 'Ya existe otro Cliente con  el mismo usuario'
		   set @Continuar = 'N' 
		end
    end 



	 IF @Continuar = 'S'
	 begin
	 -- Insert statements for procedure here
		--LLENO TABLA PERSONAS
		Insert into tbm_Personas(IdPersona,Nombres, Apellidos, FechaNacimiento, Numero1, Numero2, Estado,CI,IdCiudad,Email,U_ser,Passw)
		values(
		@IDPersona,	
		@Nombres, 
		@Apellido, 
		@FchNaci,  
		@Celu,
		@Telf,
		'A',
		@Cedula,
		@Ciudad,
		@correo,
		@User,
		@Passw)

		--lleno tabla  de clientes
		Insert into tbm_Clientes(IdCliente,IdPersona,FechaIngreso)
		values
		(@IdCliente,
		 @IDPersona,
		 GETDATE())
		 --si todo esta bien retorno  ok 
		  set @Error  = 'OK'
	 END
end



GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZA_PLATOS]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
create PROCEDURE [dbo].[SP_ACTUALIZA_PLATOS]
	-- Add the parameters for the stored procedure here
  @IdPlato  int,
  @IdCategoria int,
  @Nombre  varchar(30),
  @Estado   varchar(1),
  @Precio   Money,  
  @Informacion  varchar(3000),
  @Tiempo      int,
  @Control     int,--1 para actualziar 2 para guadrar un plato nuevo
  @Error     varchar(500) output

  
AS

BEGIN

	SET NOCOUNT ON;
	declare @intControl int = 0, @SecPlato int

	if @Control = 1 
	begin
	 --actualzio reporte
     Update tbm_Platos Set
	  Nombre  = @Nombre ,
	  ModificadoDate = GETDATE(),
	 -- ModificadoPor  = 
	 IdPlatCat  = @IdCategoria ,
	 Informacion  = @Informacion ,
	 Precio = @Precio,
	 Tiempo  = @Tiempo
	 Where  IdPlato = @IdPlato
	 set @Error   = 'OK' --si nunca hay errore se retorna un ok en esta variable
	end 

	if @Control = 2
	begin

	set @intControl = (SELECT  count(1)
					   FROM tbm_Platos AS P
					   WHERE p.Nombre = @Nombre)

      if @intControl = 0 

	  set @SecPlato = (SELECT  isnull(MAX(IdPlato),0) +1
					    FROM tbm_Platos )
	  begin 
		 Insert into tbm_Platos(IdPlato,Nombre,Estado,CreadoDate,CreadoPor,ModificadoDate,ModificadoPor,IdPlatCat,Informacion,Precio,Tiempo)
			values
			(@SecPlato ,
			 @Nombre ,
			 @Estado ,
			 GETDATE(),
			 null,
			 null,
			 null,
			 @IdCategoria ,
			 @Informacion ,
			 @Precio ,
			 @Tiempo )
	       set @Error   = 'OK'
		end

		if @intControl <> 0
		begin
	    set @Error   = 'Ya existe otro plato con el mismo nombre'
		end 

	end 


END



GO
/****** Object:  StoredProcedure [dbo].[SP_BOR_PLATO]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BOR_PLATO] @IdPlato integer

as
begin

DELETE FROM tbm_Platos
WHERE IdPlato = @IdPlato

end;



GO
/****** Object:  StoredProcedure [dbo].[SP_BORRAR]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BORRAR] @pers integer

as
begin

delete from tbm_Empleados
where IdPersona = @pers

delete from tbm_Personas
where IdPersona = @pers


end;



GO
/****** Object:  StoredProcedure [dbo].[SP_EDITARPERFIL]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_EDITARPERFIL]
@Nombres varchar(30),
@Apellidos varchar(30),
@Nacimiento  date,
@email varchar(40),
@num2 varchar(15),
@num1 varchar(15),
@ciu integer,
@idper integer
as
begin

update tbm_Personas
set Nombres = @Nombres, Apellidos=@Apellidos, FechaNacimiento=@Nacimiento, Email=@email, Numero2=@num2, Numero1=@num1,IdCiudad=@ciu
where CI = @idper

end

GO
/****** Object:  StoredProcedure [dbo].[SP_EXTRAER]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EXTRAER] @Persona integer
As
Begin

select PE.Nombres,PE.Apellidos, PE.FechaNacimiento, PE.Numero1, PE.Numero2, PE.Email, PE.Estado, PE.IdCiudad , PE.CI, PE.CreadoDate, PE.U_ser, PE.Passw
from tbm_Personas as PE
where IdPersona = @Persona

declare @ciudad as integer
select @ciudad = (select PE.IdCiudad
from tbm_Personas as PE
where IdPersona = @Persona)

select Tipo, FechaIngreso
from tbm_Empleados as EM
where EM.IdPersona = @Persona

select IdPais
from tbm_Ciudades
where IdCiudad = @ciudad

END;





GO
/****** Object:  StoredProcedure [dbo].[SP_INICIO]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INICIO] @Usr varchar(50), @Psw varchar(50)
As
Begin

select PE.IdPersona, PE.Nombres, PE.Apellidos
from tbm_Personas as PE
where U_ser=@Usr and Passw=@Psw

declare @pers as integer
select @pers = ''
select @pers = (select PE.IdPersona
from tbm_Personas as PE
where U_ser=@Usr and Passw=@Psw)

Select EM.Tipo, EM.IdEmpleado
from tbm_Empleados as EM
where em.IdPersona=@pers

END;



GO
/****** Object:  StoredProcedure [dbo].[SP_Ins_Orden]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Ins_Orden]
@IdOrden Integer, 
@Fecha date, 
@Cliente Varchar(50), 
@IdMesa Integer, 
@IdEmpleado Integer, 
@IdSucursal Integer, 
@Direccion varchar(100), 
@Telefono varchar(15), 
@Subtotal money, 
@IVA money, 
@Total money

As
Begin

insert into tbm_Ordenes(IdOrden, Fecha, Cliente, IdMesa, IdEmpleado, IdSucursal, Direccion, Telefono, Subtotal, IVA, Total)
values(@IdOrden, @Fecha, @Cliente, @IdMesa, @IdEmpleado, @IdSucursal, @Direccion, @Telefono, @Subtotal, @IVA, @Total)

end;



GO
/****** Object:  StoredProcedure [dbo].[SP_Ins_Orden_Det]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Ins_Orden_Det]
@IdOrdDet Integer,
@IdPlato Integer, 
@Cantidad Integer, 
@Precio Money,
@Total Money,
@IdOrden Integer

As
Begin

insert into tbm_Orden_Detalle(IdOrdDet, IdPlato, Cantidad, Precio, Total, IdOrden)
values(@IdOrdDet, @IdPlato, @Cantidad, @Precio, @Total, @IdOrden)

end;



GO
/****** Object:  StoredProcedure [dbo].[SP_MENU]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MENU] @Usr varchar(50)
As
Begin

select id_menu_option,description,id_parent_menu_option,url
from tbm_Menu, tbm_Rol_Menu, tbm_Empleados e, tbm_Personas p
where id_menu_option = idMenu
and idRol = convert(int,Tipo)
and e.IdPersona = p.IdPersona
and p.U_ser = @Usr

END;



GO
/****** Object:  StoredProcedure [dbo].[SP_MOD_PLATO]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MOD_PLATO] 
@Nombres varchar(30), 
@Tiempo integer,
@moddate date,
@modpor varchar(30),
@info varchar(max),
@precio money,
@IdPlato integer,
@UrlImagen varchar(MAX)

As
Begin

UPDATE tbm_Platos
SET Nombre = @Nombres, Tiempo = @Tiempo, ModificadoDate =@moddate, ModificadoPor = @modpor, informacion = @info, Precio = @precio, urlImagen = @UrlImagen
WHERE IdPlato = @IdPlato

END;



GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICAR] 
@Nombres varchar(30), 
@Nacimiento  date,
@num1 varchar(15),
@num2 varchar(15),
@email varchar(40),
@moddate date,
@modpor varchar(30),
@user varchar(100),
@pass varchar(50),
@est char(1),
@ciu integer,
@idper integer,
@tipo varchar(20),
@fecing date

As
Begin

UPDATE tbm_Personas 
SET Nombres = @Nombres, FechaNacimiento = @Nacimiento, Numero1 = @num1, Numero2 = @num2, 
Email = @email, ModificadoDate = @moddate, ModificadoPor = @modpor,Passw = @pass, Estado = @est, IdCiudad = @ciu, U_ser=@user
WHERE IdPersona = @idper

UPDATE tbm_Empleados
SET Tipo = @tipo, FechaIngreso = @fecing
WHERE IdPersona = @idper

END;


GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_MENSAJES]    Script Date: 12/3/2019 23:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_MENSAJES]
	-- Add the parameters for the stored procedure here
	@idComentario integer,
	@estado char(1)
AS
BEGIN
	UPDATE tbm_comentarios
SET Estado = @estado
WHERE IdComentario = @idComentario
END



GO
USE [master]
GO
ALTER DATABASE [Restaurantes] SET  READ_WRITE 
GO
