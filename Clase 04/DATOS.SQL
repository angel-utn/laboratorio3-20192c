USE [Club]
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (1000, N'Angelelli', N'Javier', CAST(N'1990-01-01' AS Date), N'M')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (2000, N'Baires', N'Belén', CAST(N'1998-02-02' AS Date), N'F')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (3000, N'Corrionero', N'Juan', CAST(N'2004-03-03' AS Date), N'M')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (5000, N'Garcia', N'Oriana', CAST(N'1986-04-04' AS Date), N'F')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (6000, N'Kusters', N'Kevin', CAST(N'2000-05-05' AS Date), N'M')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (7000, N'Lacioppa', N'Ignacio', CAST(N'2000-06-06' AS Date), N'M')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (8000, N'Rocca', N'Federico', CAST(N'1960-07-07' AS Date), N'M')
GO
INSERT [dbo].[Socios] ([Legajo], [Apellidos], [Nombres], [FechaNacimiento], [Genero]) VALUES (9000, N'Albornoz', N'Magalí', CAST(N'1990-08-08' AS Date), N'F')
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 
GO
INSERT [dbo].[Provincias] ([ID], [Nombre]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[Provincias] ([ID], [Nombre]) VALUES (2, N'Santa Fe')
GO
INSERT [dbo].[Provincias] ([ID], [Nombre]) VALUES (3, N'Corrientes')
GO
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
INSERT [dbo].[Localidades] ([ID], [IDProvincia], [Nombre]) VALUES (1111, 1, N'San Fernando')
GO
INSERT [dbo].[Localidades] ([ID], [IDProvincia], [Nombre]) VALUES (2222, 1, N'Lanús')
GO
INSERT [dbo].[Localidades] ([ID], [IDProvincia], [Nombre]) VALUES (3333, 1, N'Tigre')
GO
INSERT [dbo].[Localidades] ([ID], [IDProvincia], [Nombre]) VALUES (4444, 1, N'Pilar')
GO
INSERT [dbo].[Localidades] ([ID], [IDProvincia], [Nombre]) VALUES (5555, 2, N'Venado Tuerto')
GO
SET IDENTITY_INSERT [dbo].[Sedes] ON 
GO
INSERT [dbo].[Sedes] ([ID], [Nombre], [Direccion], [IDLocalidad], [Telefono], [Mail]) VALUES (1, N'Norte', N'Presidente Simón 4400', 1111, N'14141414', N'norte@lab3.com.ar')
GO
INSERT [dbo].[Sedes] ([ID], [Nombre], [Direccion], [IDLocalidad], [Telefono], [Mail]) VALUES (2, N'Sur', N'Dr Kloster 1080', 2222, N'15151515', N'sur@lab3.com.ar')
GO
INSERT [dbo].[Sedes] ([ID], [Nombre], [Direccion], [IDLocalidad], [Telefono], [Mail]) VALUES (3, N'Microestadio', N'Virrey Calabuig 1350', 3333, NULL, N'micro@lab3.com.ar')
GO
INSERT [dbo].[Sedes] ([ID], [Nombre], [Direccion], [IDLocalidad], [Telefono], [Mail]) VALUES (4, N'Microestadio II', N'Almirante De Amos 3200', 4444, N'13131313', NULL)
GO
INSERT [dbo].[Sedes] ([ID], [Nombre], [Direccion], [IDLocalidad], [Telefono], [Mail]) VALUES (5, N'Norte II', N'Av. CodeBlocks 1712', 1111, N'90909090', NULL)
GO
SET IDENTITY_INSERT [dbo].[Sedes] OFF
GO
SET IDENTITY_INSERT [dbo].[Actividades] ON 
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (1, N'Ajedrez', 250.0000, 0, 1)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (2, N'Voley', 450.0000, 1, 3)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (3, N'Handball', 450.0000, 1, 3)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (4, N'Fútbol', 500.0000, 1, 4)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (5, N'Natación', 1850.0000, 1, 4)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (6, N'Yoga', 500.0000, 1, 2)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (7, N'Taller literario', 100.0000, 0, 1)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (8, N'Fortnite', 1850.0000, 0, 1)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (9, N'Programación', 1400.0000, 0, 1)
GO
INSERT [dbo].[Actividades] ([ID], [Nombre], [Costo], [AptoMedico], [IDSede]) VALUES (10, N'Doom', 500.0000, 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripciones] ON 
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (1, 1000, 1, 0, CAST(N'2019-01-10' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (2, 1000, 3, 0, CAST(N'2019-01-10' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (3, 1000, 2, 0, CAST(N'2019-01-10' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (4, 2000, 1, 0, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (5, 3000, 3, 0, CAST(N'2018-03-21' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (6, 3000, 2, 1, CAST(N'2017-05-05' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (7, 5000, 4, 1, CAST(N'2019-06-06' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (8, 6000, 1, 0, CAST(N'2019-08-02' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (9, 6000, 3, 1, CAST(N'2019-08-02' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (10, 6000, 2, 0, CAST(N'2019-08-02' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (11, 7000, 4, 0, CAST(N'2018-04-15' AS Date))
GO
INSERT [dbo].[Inscripciones] ([IDInscripcion], [Legajo], [IDActividad], [Becado], [FechaInscripcion]) VALUES (12, 8000, 10, 1, CAST(N'2016-06-06' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Inscripciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (1, 1000, 6, 2018, CAST(N'2018-06-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (2, 1000, 7, 2018, CAST(N'2018-07-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (3, 1000, 8, 2018, CAST(N'2018-08-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (4, 1000, 9, 2018, CAST(N'2018-09-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (5, 1000, 10, 2018, CAST(N'2018-10-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (6, 1000, 11, 2018, CAST(N'2018-11-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (7, 1000, 12, 2018, CAST(N'2018-12-01' AS Date), N'2', 600.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (8, 1000, 1, 2019, CAST(N'2019-01-01' AS Date), N'2', 800.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (9, 1000, 2, 2019, CAST(N'2019-01-02' AS Date), N'2', 800.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (10, 1000, 3, 2019, CAST(N'2019-01-02' AS Date), N'1', 800.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (11, 2000, 1, 2019, CAST(N'2019-02-02' AS Date), N'3', 950.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (12, 2000, 2, 2019, CAST(N'2019-02-02' AS Date), N'2', 950.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (13, 2000, 3, 2019, CAST(N'2019-06-06' AS Date), N'3', 950.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (14, 3000, 1, 2019, CAST(N'2019-01-01' AS Date), N'2', 1500.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (15, 5000, 2, 2019, CAST(N'2019-04-01' AS Date), N'3', 2000.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (16, 6000, 1, 2019, CAST(N'2019-08-01' AS Date), N'3', 1000.0000)
GO
INSERT [dbo].[Pagos] ([IDPago], [Legajo], [Mes], [Anio], [Fecha], [Estado], [Importe]) VALUES (17, 6000, 2, 2019, CAST(N'2019-08-01' AS Date), N'3', 1000.0000)
GO
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Horarios] ON 
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (1, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (2, 2, 2, CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (3, 3, 3, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (4, 4, 4, CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (5, 5, 5, CAST(N'20:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (6, 6, 6, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (7, 7, 7, CAST(N'10:00:00' AS Time), CAST(N'10:45:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (8, 8, 1, CAST(N'21:00:00' AS Time), CAST(N'22:30:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (9, 9, 2, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (10, 10, 3, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (11, 1, 4, CAST(N'21:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios] ([IDHorario], [IDActividad], [Dia], [Inicio], [Fin]) VALUES (12, 2, 5, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Horarios] OFF
GO
