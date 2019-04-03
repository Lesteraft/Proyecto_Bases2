
/* CREACI�N DE TABLA PLACES */
USE [NORTHWND]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Places] (
	[Place_ID] [int] NOT NULL,
	[Place_Name] [varchar](30) NOT NULL,
	[Place_Father_ID] [int] NULL,
	FOREIGN KEY ([Place_Father_ID]) REFERENCES [dbo].[Places] ([Place_ID]),
	CONSTRAINT [PK_Place_ID] PRIMARY KEY CLUSTERED 
	(
		[Place_ID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO


/* SCRIP DE LA CREACI�N DE LOS REGISTROS DE LA TABLA */
INSERT INTO Places values (1 ,'Argentina', NULL ); 
INSERT INTO Places values (25 ,'Buenos Aires', 1 ); 
INSERT INTO Places values (2 ,'Belize', NULL ); 
INSERT INTO Places values (26 ,'Belmopan', 2 ); 
INSERT INTO Places values (3 ,'Bolivia', NULL ); 
INSERT INTO Places values (27 ,'Sucre', 3 ); 
INSERT INTO Places values (4 ,'Chile', NULL ); 
INSERT INTO Places values (28 ,'Santiago', 4 ); 
INSERT INTO Places values (5 ,'Colombia', NULL ); 
INSERT INTO Places values (29 ,'Bogota', 5 ); 
INSERT INTO Places values (6 ,'Costa Rica', NULL ); 
INSERT INTO Places values (30 ,'San Jose', 6 ); 
INSERT INTO Places values (7 ,'Cuba', NULL ); 
INSERT INTO Places values (31 ,'Havana', 7 ); 
INSERT INTO Places values (8 ,'Dominican Republic', NULL ); 
INSERT INTO Places values (32 ,'Santo Domingo', 8 ); 
INSERT INTO Places values (9 ,'Ecuador', NULL ); 
INSERT INTO Places values (33 ,'Quito', 9 ); 
INSERT INTO Places values (10 ,'El Salvador', NULL ); 
INSERT INTO Places values (34 ,'San Salvador', 10 ); 
INSERT INTO Places values (11 ,'Equatorial Guinea', NULL ); 
INSERT INTO Places values (35 ,'Malabo', 11 ); 
INSERT INTO Places values (12 ,'Guam', NULL ); 
INSERT INTO Places values (36 ,'Hagania', 12 ); 
INSERT INTO Places values (13 ,'Guatemala', NULL ); 
INSERT INTO Places values (37 ,'Guatemala City', 13 ); 
INSERT INTO Places values (14 ,'Honduras', NULL ); 
INSERT INTO Places values (38 ,'Tegucigalpa', 14 ); 
INSERT INTO Places values (15 ,'Mexico', NULL ); 
INSERT INTO Places values (39 ,'Mexico City', 15 ); 
INSERT INTO Places values (16 ,'Nicaragua', NULL ); 
INSERT INTO Places values (40 ,'Managua', 16 ); 
INSERT INTO Places values (17 ,'Panama', NULL ); 
INSERT INTO Places values (41 ,'Panama City', 17 ); 
INSERT INTO Places values (18 ,'Paraguay', NULL ); 
INSERT INTO Places values (42 ,'Asuncion', 18 ); 
INSERT INTO Places values (19 ,'Peru', NULL ); 
INSERT INTO Places values (43 ,'Lima', 19 ); 
INSERT INTO Places values (20 ,'Puerto Rico', NULL ); 
INSERT INTO Places values (44 ,'San Juan', 20 ); 
INSERT INTO Places values (21 ,'Spain', NULL ); 
INSERT INTO Places values (45 ,'Madrid', 21 ); 
INSERT INTO Places values (22 ,'Uruguay', NULL ); 
INSERT INTO Places values (46 ,'Montevideo', 22 ); 
INSERT INTO Places values (23 ,'Venezuela', NULL ); 
INSERT INTO Places values (47 ,'Caracas', 23 ); 
INSERT INTO Places values (24 ,'Western Sahara', NULL ); 
INSERT INTO Places values (48 ,'El Aaion', 24 ); 
INSERT INTO Places values (49 ,'Italia', null ); 
INSERT INTO Places values (50 ,'Roma', 49 ); 
INSERT INTO Places values (51 ,'Francia', null ); 
INSERT INTO Places values (52 ,'Paris', 51 ); 
INSERT INTO Places values (53 ,'Inglaterra', null ); 
INSERT INTO Places values (54 ,'Londres', 53 ); 
INSERT INTO Places values (55 ,'Canada', null ); 
INSERT INTO Places values (56 ,'Ottawa', 55 ); 

/**/