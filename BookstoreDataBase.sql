USE [master]
GO
/****** Object:  Database [BookstoreWeb]    Script Date: 26/04/2023 03:58:05 p. m. ******/
CREATE DATABASE [BookstoreWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookstoreWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookstoreWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookstoreWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookstoreWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookstoreWeb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookstoreWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookstoreWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookstoreWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookstoreWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookstoreWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookstoreWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookstoreWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookstoreWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookstoreWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookstoreWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookstoreWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookstoreWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookstoreWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookstoreWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookstoreWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookstoreWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookstoreWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookstoreWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookstoreWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookstoreWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookstoreWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookstoreWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookstoreWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookstoreWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [BookstoreWeb] SET  MULTI_USER 
GO
ALTER DATABASE [BookstoreWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookstoreWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookstoreWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookstoreWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookstoreWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookstoreWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookstoreWeb', N'ON'
GO
ALTER DATABASE [BookstoreWeb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookstoreWeb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookstoreWeb]
GO
/****** Object:  Table [dbo].[BillRegister]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillRegister](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostalCode] [int] NULL,
	[CardNumber] [int] NULL,
	[ExpDate] [date] NULL,
	[SecurityCode] [int] NULL,
 CONSTRAINT [PK_BillRegister] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Photo] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteBooks]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteBooks](
	[bookId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[bookId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (1, N'9786073193320', N'El niño con el Pijama de Rayas', N' John Boyne', CAST(N'2006-01-05' AS Date), N'Bruno, de ocho años, es el hijo mimado de un oficial nazi. Al ascender a su padre, la familia se ve obligada a abandonar su confortable casa de Berlín y trasladarse a una zona aislada donde el solitario chico no tiene nada que hacer ni nadie con quien jugar. Muerto de aburrimiento y atraído por la curiosidad, Bruno hace caso omiso a lo que su madre le dice. No debe ir más allá del jardín bajo ninguna circunstancia. Pero el no le hace caso y se dirige hacia la ‘granja’ que ha vislumbrado en la distancia. Allí conoce a Shmuel, un chico de su edad que vive una extraña y paralela existencia al otro lado de una alambrada. El encuentro de Bruno con el chico del pijama de rayas le lleva a adentrarse de la forma más inocente en el mundo de adultos que les rodea. Entabla una amistad con Shmuel con terribles consecuencias.', N'../Images/1.jpg', CAST(8900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (2, N'9788491292418', N'Caja de botones de Gwendy', N'Stephen King', CAST(N'2018-11-08' AS Date), N'La pequeña ciudad de Castle Rock, en Maine, ha sido testigo de algunos extraños sucesos, pero solo hay una historia que no se ha contado... hasta ahora.Existen tres vías para llegar a Castle View desde la ciudad de Castle Rock: por la carretera 117, por Pleasant Road y por las Escaleras de los Suicidios. Cada día del verano de 1974, Gwendy Peterson, de doce años de edad, toma el camino de las escaleras, que ascienden en zigzag por la ladera rocosa.Pero un día, al llegar a lo alto, mientras recupera el aliento con la cara roja y las manos apoyadas sobre las rodillas, un desconocido la llama. Allí, en un banco a la sombra, se sienta un hombre con una chaqueta negra y un pequeño sombrero. Llegará un día en el que Gwendy sufra pesadillas con ese sombrero...', N'../Images/2.jpg', CAST(16800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (3, N'9780142417805', N'El Cielo está en Cualquier Lugar', N'Jandy Nelson', CAST(N'2010-03-09' AS Date), N'A la deriva después de la repentina muerte de su hermana Bailey, Lennie se encuentra dividida entre el tranquilo y seductor Toby, el novio de Bailey que comparte su dolor, y Joe, el chico nuevo en la ciudad que estalla de vida y genio musical. Cada uno le ofrece a Lennie algo que necesita desesperadamente ... aunque sabe que si los dos chocan, su mundo entero explotará. Únete a Lennie en este desgarrador e hilarante viaje de profundo dolor y amor loco, mientras comete errores colosales y descubrimientos colosales, mientras recorre salas de bandas y dormitorios en el bosque y, finalmente, llega directamente a tu corazón. Tanto una celebración del amor como un retrato conmovedor de la pérdida, la lucha de Lennie por separar su propia melodía del ruido que la rodea es siempre honesta, a menudo estruendosa y absolutamente inolvidable.', N'../Images/3.jpg', CAST(9500 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (4, N'9788415618782', N'Orgullo y Prejuicio ', N'Jane Austen', CAST(N'1813-01-28' AS Date), N'Jane Austen ocupó un lugar preminente en la literatura británica. Reivindicada vehementemente por Rudyard Kipling y Edward Said, la elegancia estilística de su prosa, su ironía y, sobre todo, su perspicacia para el retrato social convierten sus obras en una referencia ineludible de la literatura del siglo XIX. Orgullo y prejuicio, su novela más conocida, narra cómo Elizabeth Bennet y Fitzwilliam Darcy se enfrentan a sus prejuicios movidos por el amor que, contra pronóstico, surge entre ellos. “Es una verdad reconocida universalmente que a todo hombre soltero que posee una gran fortuna le hace falta una esposa.', N'../Images/4.jpg', CAST(14800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (5, N'9789585496606', N'Alguien está Mintiendo ', N'Karen M McMacnus', CAST(N'2017-05-29' AS Date), N'Una nueva app está acorralando a la élite del instituto Bayview para estudiantes de perfil elevado. Las filtraciones de la vida privada de los estudiantes corren como la pólvora por la nueva red social creada por Simon Kelleher, alumno de la misma institución.
Pero la cosa se pone muy seria cuando Simon es asesinado justo delante de sus víctimas. Los cuatro cabecillas de la «crème de la crème» estudiantil se convierten en sospechosos directos del asesinato.
¿Qué secretos guardarían para arriesgarse a acabar con Simon?
¿Quién será el culpable?
Un thriller que te mantendrá conteniendo la respiración hasta el final.
Simon Kelleher es Gossip Girl en el mundo real, donde el peligro de hacer un mal uso de las redes sociales está latente en la sociedad, sobre todo entre los más jóvenes.
', N'../Images/5.jpg', CAST(14800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (6, N'9788408267195', N'Volver a empezar', N'Collen Hoover', CAST(N'2022-10-18' AS Date), N'La esperada continuación de Romper el círculo (It Ends with Us).
Lily y su exmarido, Ryle, acaban de pactar la custodia compartida de su niña cuando Lily se encuentra de nuevo con su primer amor, Atlas. Después de casi dos años separados, está entusiasmada porque, por una vez, el tiempo está de su lado, e inmediatamente dice que sí cuando Atlas le pide una cita.
Pero su alegría se desvanece cuando piensa que, aunque ya no están casados, Ryle sigue teniendo un papel en la familia, y no consentirá que Atlas Corrigan esté presente en su vida y en la de su hija.
Volver a empezar alterna entre las perspectivas de Lily y Atlas y continúa justo donde nos dejó Romper el círculo. Descubriremos más sobre el pasado de Atlas y seguiremos a Lily en busca de una segunda oportunidad de encontrar el amor verdadero mientras tiene que lidiar con un exmarido celoso.
', N'../Images/6.jpg', CAST(16800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (7, N'9789585118027', N'Alguien Tiene un Secreto', N'Karen M McMacnus', CAST(N'2019-01-04' AS Date), N'Ellery es nueva en Echo Ridges, pero ya lo sabe todo sobre el pueblo. Aquí, a veces, las chicas desaparecen... y sus asesinatos siguen sin resolverse. Aunque las clases no han empezado aún, la futura reina del baile ha sido amenazada y una chica ha desaparecido... y todo apunta a que Ellery también está peligro.
Y es que en Echo Ridges, todo el mundo tiene un secreto, y algunos secretos son peligrosos...
Ellery tiene diecisiete años y una obsesión con el misterio. La hermana gemela de su madre desapareció cuando era adolescente en Echo Bridges, un pueblito de Nueva Inglaterra que ha vuelto a los titulares hace poco por el asesinato de otra chica, la reina del baile del instituto local.
Cuando Ellery y su propio hermano gemelo Ezra se tienen que mudar con su abuela al pueblo, la obsesión de Ellery se topa con la realidad. Otra chica ha desaparecido, alguien ha amenazado públicamente a la siguiente reina del baile, y el chico que le gusta a Ellery es el principal sospechoso de la policía.
Ellery sabe bastante de secretos. Su madre los tiene; su abuela también. Y cuanto más tiempo pasa en Echo Ridge, más claro queda que allí todos esconden algo... pero no todos han sabido en quién confiar.

', N'../Images/7.jpg', CAST(14800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (8, N'9781501110368', N'It Ends With Us', N'Collen Hoover', CAST(N'2016-02-29' AS Date), N'A veces es el que te ama quien más te lastima. Lily no siempre lo ha tenido fácil, pero eso nunca le ha impedido trabajar duro por la vida que quiere. ¿Ha recorrido un largo camino desde la pequeña ciudad de Maine donde creció? Se graduó de la universidad, se mudó a Boston y comenzó su propio negocio. Entonces, cuando siente una chispa con un hermoso neurocirujano llamado Ryle Kincaid, todo en la vida de Lily de repente parece demasiado bueno para ser verdad. Ryle es asertivo, terco, tal vez incluso un poco arrogante. También es sensible, brillante y tiene una debilidad total por Lily. Y la forma en que se ve en bata ciertamente no duele. Lily no puede sacarlo de su cabeza. Pero la completa aversión de Ryle a las relaciones es inquietante. Incluso cuando Lily se convierte en la excepción a su regla de "no tener citas", no puede evitar preguntarse qué lo hizo así en primer lugar. A medida que las preguntas sobre su nueva relación la abruman, también lo hacen los pensamientos sobre Atlas Corrigan, su primer amor y un vínculo con el pasado que dejó atrás.
 
Él era su alma gemela, su protector. Cuando Atlas reaparece repentinamente, todo lo que Lily ha construido con Ryle se ve amenazado. Con esta novela audaz y profundamente personal, Colleen Hoover ofrece una historia desgarradora que abre nuevos caminos emocionantes para ella como escritora. Combinando un romance cautivador con un elenco de personajes demasiado humanos, termina con nosotros es una historia de amor inolvidable que tiene el precio máximo.

', N'../Images/8.jpg', CAST(15800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (9, N'9788408165804', N'Battle Royale', N'Koushun Takami', CAST(N'1999-04-27' AS Date), N'En la República del Gran Oriente Asiático está prohibido el rock, esa música decadente. Los  jóvenes crecen en un estado totalitario y controlador que promueve la competitividad. Como medida de control de rebeliones, la administración pone en marcha el Programa: cada año, 50 clases de distintos institutos son elegidas para luchar a muerte en la BATTLE ROYALE. Los alumnos elegidos son aislados en una isla. Las normas del juego son estrictas: no pueden escapar, no pueden contactar con el exterior, y solo puede quedar uno. Todo está permitido para sobrevivir. Empieza el juego. Empieza BATTLE ROYALE. Todos los alumnos de los institutos de la República del Gran Oriente Asiático sabían qué era aquello del Programa. Incluso se hablaba de todo aquello en los libros de texto a partir de cuarto. En la Enciclopedia Manual de la República del Gran Oriente Asiático había una entrada detallada en la que se explicaba todo. Programa. n. m. 1. Un listado con el orden de actividades y otras informaciones relativas [...] 4. Un programa de simulación bélica establecido y dirigido por nuestras fuerzas armadas, instituido por razones de seguridad. Oficialmente tiene el nombre de Programa de  experimentación Bélica núm. 68. El primer programa se desarrolló en 1947. Cincuenta clases de tercer año de instituto son seleccionadas anualmente (antes de 1950 se seleccionaba a cuarenta y siete) para desarrollar el Programa con propósitos científi cos. Los alumnos de cada promoción están obligados a luchar unos contra otros hasta que solo quede un superviviente. Los resultados de este experimento, incluido el tiempo invertido, se consignan debidamente. Al superviviente final de cada promoción  (el ganador) se le concede una pensión vitalicia y una tarjeta autografiada por el Gran Dictador. Como respuesta a las protestas y algaradas causadas por los extremistas durante el primer año de esta institución, el 317.º Gran Dictador pronunció su famoso «discurso de Abril».  ', N'../Images/9.jpg', CAST(9900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (10, N'9789588763736', N'Lo Último Que Me Dijo', N'Laura Dave', CAST(N'2022-04-07' AS Date), N'LO ÚLTIMO QUE ME DIJO FUE: «PROTÉGELA».
Antes de que Owen Michaels desapareciera, consiguió pasar a escondidas una nota a su nueva esposa, Hannah: «Protégela». Hannah sabe exactamente a quién se refiere la nota: Bailey, la hija adolescente de Owen, quien perdió trágicamente a su madre cuando era niña y que no quiere tener absolutamente nada que ver con su nueva madrastra.
Mientras las llamadas desesperadas de Hannah a su esposo quedan sin respuesta, el jefe de Owen es arrestado por fraude y la policía comienza a interrogarla; entonces se da cuenta de que su esposo no es quien decía ser y que Bailey podría tener la clave para descubrir la verdadera identidad de Owen y el porqué de su misteriosa desaparición. Juntas se han propuesto descubrir la verdad. Pero a medida que comienzan a reunir las piezas del pasado de Owen, enseguida se dan cuenta de que sus vidas nunca volverán a ser las mismas.
', N'../Images/10.jpg', CAST(10800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (11, N'9788466672474', N'Todo Arde (TD)', N'Juan Gomez Jurado', CAST(N'2022-10-17' AS Date), N'«Después de todo lo que ha pasado con la trilogía Reina Roja, sólo había una forma de dar las gracias a mis lectores: intentar escribir una novela todavía mejor.»
Juan Gómez-Jurado
Esta es la historia de tres mujeres que lo han perdido todo.
Incluso el miedo.
Por eso son tan peligrosas.
Esta es la historia de una venganza imposible, sin ninguna posibilidad de éxito.
Esta es la historia de tres mujeres que se atreven a hacer lo que los demás sólo nos atrevemos a imaginar.
Algo muy poderoso está a punto de ocurrir.
Y nada volverá a ser igual.
SIEMPRE GANAN LOS MISMOS.
ES HORA DE CAMBIAR LAS REGLAS.

', N'../Images/11.jpg', CAST(19800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (12, N'9786287525573', N'Caso de Alaska Sanders', N'Joël Dicker', CAST(N'2022-06-23' AS Date), N'Vuelve la mayor adicción literaria: la apasionante nueva investigación de Marcus Goldman y el sargento Perry Gahalowood, con el regreso de Harry Quebert.
«Sé lo que has hecho». Este mensaje, encontrado en el bolsillo del pantalón de Alaska Sanders, cuyo cadáver apareció el 3 de abril de 1999 en la playa de una pequeña localidad de New Hampshire, es la clave del nuevo caso que, once años después de poner entre rejas a sus presuntos culpables, vuelve a reunir al escritor Marcus Goldman y al sargento Perry Gahalowood. A medida que vayan descubriendo quién era realmente Alaska Sanders, resurgirán los fantasmas del pasado, y entre ellos, especialmente,el de Harry Quebert.
', N'../Images/12.jpg', CAST(19800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (13, N'9788427215023', N'100 Mujeres que Cambiaron el Mundo (TD)', N'Sandra Elmert', CAST(N'2018-10-08' AS Date), N'Descubre las biografías de 100 mujeres que cambiaron la historia.
¿Sabes quién es la escritora más leída de todos los tiempos? ¿Y quién fue la primera hacker de la historia? ¿O quién inventó la tecnología que permitió la creación de Internet?
100 mujeres que cambiaron el mundo te descubrirá las historias de científicas, como Marie Curie, filósofas, como María Zambrano, políticas, como Clara Campoamor, o escritoras, como Agatha Christie y Rosalía de Castro.
Mujeres brillantes, inteligentes y valientes que contribuyeron a mejorar nuestro mundo y rompieron las barreras que, por la época en la que les tocó vivir, les fueron impuestas.
¿Te apuntas a conocer sus vidas?


', N'../Images/13.jpg', CAST(18800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (14, N'9786073198813', N'10 Reglas para Comprender el Mundo', N'Tim Harford', CAST(N'2021-04-20' AS Date), N'Se trata de los números y los datos que manejan las estadísticas, indispensables en el relato con el que se construye hoy en día la actualidad política, económica y social. Y para comprender la realidad cambiante y compleja en la que vivimos no se necesita un doctorado en matemáticas. Basta un poco paciencia y sentido común, pero sobre todo, se requiere la curiosidad que Tim Harford, autor de El economista camuflado, sabe contagiar a sus lectores para observar el mundo con otros ojos.
Reseña:
«Tim Harford consigue que disfrutemos de las estadísticas de la vida cotidiana y que incluso lleguen a resultarnos fascinantes.»
Bill Bryson, autor de Una breve historia de casi todo

', N'../Images/14.jpg', CAST(16800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (15, N'9780544273443', N'La Comunidad del Anillo', N'J.R.R. Tolkien', CAST(N'1954-07-29' AS Date), N'En la adormecida e idílica Comarca, un joven hobbit recibe un encargo: custodiar el Anillo Único y emprender el viaje para su destrucción en la Grieta del Destino. Acompañado por magos, hombres, elfos y enanos, atravesará la Tierra Media y se internará en las sombras de Mordor, perseguido siempre por las huestes de Sauron, el Señor Oscuro, dispuesto a recuperar su creación para establecer el dominio definitivo del Mal.', N'../Images/15.jpg', CAST(11900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (16, N'978-0544273450', N'El Señor de los Anillos: Las Dos Torres', N'J.R.R. Tolkien', CAST(N'1954-11-11' AS Date), N'Continuación de la historia de Frodo y sus compañeros mientras buscan destruir el anillo mágico.', N'../Images/16.jpg', CAST(11900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (17, N'978-0544273467', N'El Señor de los Anillos: El Retorno del Rey', N'J.R.R. Tolkien', CAST(N'1955-10-20' AS Date), N'La conclusión épica de la trilogía mientras los personajes luchan por el destino de la Tierra Media.', N'../Images/17.jpg', CAST(11900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (21, N'978-6070745033', N'Nosotros en la Luna', N'Alice Kellen', CAST(N'2019-10-10' AS Date), N'Cuando Rhys y Ginger se conocen en las calles de la ciudad de la luz, no imaginan que sus vidas se unirán para siempre, a pesar de la distancia y de que no puedan ser más diferentes. Ella vive en Londres y a veces se siente tan perdida que se ha olvidado hasta de sus propios sueños.', N'../Images/21.jpg', CAST(10800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (18, N'978-0593116348', N'Alice y la Mosca', N'James Rice', CAST(N'2021-08-03' AS Date), N'Greg es un adolescente retraído y solitario. Su padre es un cirujano plástico que nunca está en casa, su madre está obsesionada con el estatus y la decoración y su hermana menor solo se preocupa por sus ensayos de baile. Pero el principal problema de Greg son Ellas: Ellas, que imaginariamente lo persiguen por todas partes; Ellas, que aparecen en los lugares menos pensados; Ellas, que bajan del techo o caminan por la pared y la regadera; Ellas, que lo paralizan; Ellas… Las arañas. Pero una tarde cualquiera, durante un breve segundo, encuentra la sonrisa de Alice y eso le basta para llenar el vacío de su vida. Sin saberlo, ella se convertirá en su interlocutora, en el motor de todas sus acciones, en su obsesión. Alice y la mosca es una novela sobre las fobias, el aislamiento y el lado oscuro de las personas. Es sobre los secretos que la familia y los amigos esconden con tanto cuidado. Pero más que eso, es un libro sobre el amor, sobre encontrarlo y protegerlo de cualquier peligro.', N'../Images/18.jpg', CAST(10800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (19, N'978-8499183695', N'Un paseo para recordar', N'Nicholas Sparks', CAST(N'1999-10-01' AS Date), N'El joven Landon es considerado el chico más guapo y popular del instituto. Un día, a raíz de un castigo, conoce a Jamie, la hija del predicador. Cuando se conocen no pueden soportarse, pues ambos son lo contrario del otro. Sin embargo, eso no previene a los dos jóvenes de enamorarse. La relación entre el popular Landon y la conservadora Jamie no es bien vista por los demás estudiantes. Además, la joven esconde un secreto para Landon.', N'../Images/19.jpg', CAST(10800 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (20, N'978-8408145472', N'Un monstruo viene a verme', N'Patrick Ness', CAST(N'2011-05-21' AS Date), N'Tras la separación de sus padres, Connor tiene que llevar las riendas de su casa ya que su madre está enferma de cáncer. El pequeño intentará superar sus miedos y fobias con la ayuda de un monstruo con el que se encuentra todas las noches. Sus fantasías tendrán que enfrentarse con la realidad y con su fría y calculadora abuela.', N'../Images/20.jpg', CAST(9900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (22, N'978-1250095251', N'Caraval 1 Caraval', N'	Stephanie Garber', CAST(N'2017-01-31' AS Date), N'Scarlett Dragna nunca ha abandonado la pequeña isla donde ella y su hermana Tella viven bajo la vigilancia de su estricto y cruel padre. Desde hace años Tella organiza una serie de juegos anuales en los que participa Scarlett, y a pesar de que nunca ha ganado, este año está dispuesta a hacer cualquier cosa para asistir a la celebración. Pero poco después de llegar a la ciudad donde se celebra Caraval, Tella es secuestrada por el responsable del juego, el misterioso y peligroso Legend. Scarlett, decidida a encontrar a su hermana, se verá envuelta en una peligrosa aventura de amor, sueños, pesadillas y magia, que sólo terminará cuando la partida llegue a su fin.	¢17,900
978-1250170992	Legendary	Stephanie Garber	29-05-2018	Tella Dragna pensó que había desafiado todas las probabilidades al ganar Caraval, el juego de aventuras de una vida. Pero ganar fue una cosa, sobrevivir a Caraval fue otra. En lugar de escapar a una vida sin su hermana, Tella está ahora bajo el control de Legend, el misterioso Maestro de Caraval. Legend tiene sus propios planes y enlaces, y Tella no es más que una pieza en uno de sus juegos retorcidos.', N'../Images/22.jpg', CAST(17900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (23, N'978-1250170992', N'Caraval 2 Legendary', N'Stephanie Garber', CAST(N'2018-05-29' AS Date), N'Tella Dragna pensó que había desafiado todas las probabilidades al ganar Caraval, el juego de aventuras de una vida. Pero ganar fue una cosa, sobrevivir a Caraval fue otra. En lugar de escapar a una vida sin su hermana, Tella está ahora bajo el control de Legend, el misterioso Maestro de Caraval. Legend tiene sus propios planes y enlaces, y Tella no es más que una pieza en uno de sus juegos retorcidos.', N'../Images/23.jpg', CAST(17900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (24, N'978-1250157665', N'Caraval 3 Finale', N'Stephanie Garber', CAST(N'2019-05-07' AS Date), N'Ha pasado mucho tiempo desde que Scarlett y Tella Dragna llegaron a la Isla de los Sueños para jugar en Caraval y mucho ha cambiado desde entonces. Tella se ha convertido en una de las reclusas más conocidas de Valenda y Scarlett se ha enamorado perdidamente de Nicholas, el guardián de Caraval que se suponía que nunca debía enamorarse de nadie. Pero cuando Tella es secuestrada por alguien que creen que no debería existir, Scarlett se ve obligada a embarcarse en un peligroso juego de amor, sueños, pesadillas y magia, y no hay garantía de que alguna vez regrese.', N'../Images/24.jpg', CAST(17900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (25, N'978-9584202785', N'Paula', N'Isabel Allende', CAST(N'1995-01-01' AS Date), N'Una historia de amor que trasciende el tiempo y la muerte, una novela emocionante e intensamente conmovedora que cuenta la historia de una familia marcada por el dolor. Después de la muerte de su hija Paula, Isabel Allende comenzó a escribir la historia de su vida. El resultado es una obra que tiene el tono y la emoción de una carta escrita a alguien', N'../Images/25.jpg', CAST(8900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (26, N'978-8497598915', N'La casa', N'Danielle Steel', CAST(N'2002-02-01' AS Date), N'Una historia familiar emotiva y dramática, que narra el cambio profundo en la vida de una mujer que de pronto se ve sola y sin un hogar al que pertenecer. La casa de la calle 66 es un testigo mudo del devenir de varias generaciones. Pero cuando su última propietaria, Nancy, muere, todos se quedan sorprendidos por la cláusula del testamento: la casa pasa a manos de una desconocida, una joven que dice ser la nieta de Nancy, lo que desata el caos y los conflictos en una familia que debe enfrentar un futuro incierto. Con un estilo emotivo y directo, Danielle Steel nos lleva a conocer la historia de una mujer que se encuentra sola en el mundo y que, con la ayuda de un amigo y un luchador incansable, consigue convertir una casa en ruinas en un hogar lleno de vida y amor.', N'../Images/26.jpg', CAST(8900 AS Decimal(18, 0)))
GO
INSERT [dbo].[Books] ([Id], [ISBN], [Title], [Author], [ReleaseDate], [Description], [Photo], [Price]) VALUES (27, N'978-8426418920', N'La chica del tren', N'Paula Hawkins', CAST(N'2015-05-13' AS Date), N'Rachel toma el tren todos los días, y siempre ve lo mismo: una casa hermosa, habitada por una pareja que parece tenerlo todo. Pero un día, Rachel ve algo que no debería haber visto y se ve arrastrada a un mundo oscuro y peligroso que cambiará su vida para siempre. Una novela emocionante y tensa que sigue los destinos entrelazados de tres mujeres: Rachel, la mujer en el tren; Megan, la mujer que Rachel ve desde el tren; y Anna, la ex esposa de Tom, el hombre de Rachel. A medida que la verdad se va desvelando, la vida de estas mujeres cambiará para siempre.', N'../Images/27.jpg', CAST(8500 AS Decimal(18, 0)))
GO
INSERT [dbo].[FavoriteBooks] ([bookId], [Email]) VALUES (18, N'prisiaguilar@gmail.com')
GO
INSERT [dbo].[FavoriteBooks] ([bookId], [Email]) VALUES (5, N'prmudez@gmail.com')
GO
INSERT [dbo].[FavoriteBooks] ([bookId], [Email]) VALUES (3, N'prmudez@gmail.com')
GO
INSERT [dbo].[FavoriteBooks] ([bookId], [Email]) VALUES (8, N'prisiaguilar@gmail.com')
GO
INSERT [dbo].[FavoriteBooks] ([bookId], [Email]) VALUES (10, N'prisiaguilar@gmail.com')
GO
INSERT [dbo].[ShoppingCart] ([bookId], [Email]) VALUES (6, N'prisiaguilar@gmail.com')
GO
INSERT [dbo].[ShoppingCart] ([bookId], [Email]) VALUES (11, N'prisiaguilar@gmail.com')
GO
INSERT [dbo].[ShoppingCart] ([bookId], [Email]) VALUES (10, N'prisiaguilar@gmail.com')
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCartBook]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteCartBook]

	@Email VARCHAR(50),
	@bookId INT
AS
BEGIN	
	DELETE FROM ShoppingCart WHERE bookId = @bookId AND Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFavoriteBook]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteFavoriteBook]

	@Email VARCHAR(50),
	@bookId INT
AS
BEGIN	
	DELETE FROM FavoriteBooks WHERE bookId = @bookId AND Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBooks]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBooks]
	
AS
BEGIN
	
	SELECT 
		Id,
		ISBN, 
		Title,
		Author,
		ReleaseDate,
		Description,
		Photo,
		Price
	FROM Books

END
GO
/****** Object:  StoredProcedure [dbo].[spGetFavoriteBooks]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetFavoriteBooks]
	
	@Email VARCHAR(50)
AS
BEGIN
	SELECT * 
	FROM FavoriteBooks fb
		INNER JOIN Books b
		ON fb.bookId = b.Id
	WHERE Email = @Email

END
GO
/****** Object:  StoredProcedure [dbo].[spGetInfoBook]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetInfoBook]

	@Id int
AS
BEGIN
	
	SELECT 
		Id,
		ISBN, 
		Title,
		Author,
		ReleaseDate,
		Description,
		Photo,
		Price
	FROM Books
	WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetSearchedBook]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetSearchedBook] 

	@search varchar(MAX)
AS
BEGIN
	
	SELECT 
		Id,
		ISBN, 
		Title,
		Author,
		ReleaseDate,
		Description,
		Photo,
		Price
	FROM Books
	WHERE Title LIKE '%' + @search + '%'
	OR ISBN  LIKE '%' + @search + '%'
	OR Author LIKE '%' + @search + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spGetShoppingCart]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetShoppingCart]

@Email varchar(100)

AS
BEGIN
	SELECT * 
	FROM ShoppingCart sc
		INNER JOIN Books b
		ON sc.bookId = b.Id
	WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveFavoriteBook]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveFavoriteBook] 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.FavoriteBooks VALUES(@bookId, @Email)
  
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveShoppingCart]    Script Date: 26/04/2023 03:58:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSaveShoppingCart] 
	
	@bookId int,
	@Email varchar(100)

AS
BEGIN

	INSERT INTO dbo.ShoppingCart VALUES(@bookId, @Email)
  
END
GO
USE [master]
GO
ALTER DATABASE [BookstoreWeb] SET  READ_WRITE 
GO
