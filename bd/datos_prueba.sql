-- bd/datos_prueba.sql  🔒  Datos FALSOS para practicar (ningún dato es real).
-- Se carga DESPUÉS de schema.sql. Contraseña de TODAS las cuentas de prueba: Prueba123
-- Asistencias de la semana del 26 al 30 de octubre de 2026, con los 5 estatus.
SET NAMES utf8mb4;

INSERT INTO carrera (carrera_id, nombre, clave) VALUES
 (1,'Programación','PROG'),
 (2,'Animación Digital','ANIM'),
 (3,'Desarrollo Organizacional','DESO');

INSERT INTO grupo (grupo_id, clave, carrera_id, turno, semestre, ciclo_escolar) VALUES
 (1,'501',1,'Matutino',5,'2026-2027'),
 (2,'502',2,'Vespertino',5,'2026-2027'),
 (3,'301',3,'Matutino',3,'2026-2027');

INSERT INTO horario (horario_id, grupo_id, dia_semana, hora_entrada, hora_salida, tolerancia_min) VALUES
 (1,1,1,'07:00:00','14:00:00',10),
 (2,1,2,'07:00:00','14:00:00',10),
 (3,1,3,'07:00:00','14:00:00',10),
 (4,1,4,'07:00:00','14:00:00',10),
 (5,1,5,'07:00:00','14:00:00',10),
 (6,2,1,'13:00:00','20:00:00',10),
 (7,2,2,'13:00:00','20:00:00',10),
 (8,2,3,'13:00:00','20:00:00',10),
 (9,2,4,'13:00:00','20:00:00',10),
 (10,2,5,'13:00:00','20:00:00',10),
 (11,3,1,'07:00:00','14:00:00',10),
 (12,3,2,'07:00:00','14:00:00',10),
 (13,3,3,'07:00:00','14:00:00',10),
 (14,3,4,'07:00:00','14:00:00',10),
 (15,3,5,'07:00:00','14:00:00',10);

INSERT INTO rol (rol_id, nombre) VALUES
 (1,'Administrador'),
 (2,'Orientadora'),
 (3,'Alumno'),
 (4,'Padre de familia');

-- Usuarios: 1 admin, 1 orientadora, 2 alumnos, 2 padres (alumno_id se asigna más abajo)
INSERT INTO usuario (usuario_id, nombre, correo, contrasena_hash, rol_id) VALUES
 (1,'Administrador de prueba','admin@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',1),
 (2,'Orientadora de prueba','orientadora@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',2),
 (3,'Luis Hernández Cruz','alumno1@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',3),
 (4,'María González Pérez','alumno2@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',3),
 (5,'Rosa Cruz Mejía','padre1@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',4),
 (6,'Pedro González Ríos','padre2@prueba.mx','scrypt:32768:8:1$xQuh6m3BoL9R501U$fe300e6884d68326db401291954b090dacdccf11e1c509bfa08bf6fb870d923e997a83b438f9b4a5982d58c14aa202678dd1811ba1101074e5cc0505f8bb135e',4);

INSERT INTO tutor (tutor_id, nombre, telefono_whatsapp, usuario_id) VALUES
 (1,'Rosa Cruz Mejía','5210000000001',5),
 (2,'Pedro González Ríos','5210000000002',6),
 (3,'Ana Ruiz Salas','5210000000003',NULL),
 (4,'Laura Sánchez Vega','5210000000004',NULL),
 (5,'Mario Torres León','5210000000005',NULL),
 (6,'Elena Gómez Paz','5210000000006',NULL),
 (7,'Raúl Díaz Mora','5210000000007',NULL),
 (8,'Patricia Reyes Luna','5210000000008',NULL),
 (9,'Jesús Mendoza Ochoa','5210000000009',NULL),
 (10,'Gabriela Jiménez Rivas','5210000000010',NULL),
 (11,'Hugo Aguilar Campos','5210000000011',NULL),
 (12,'Teresa Silva Rangel','5210000000012',NULL);

INSERT INTO alumno (alumno_id, matricula, nombre, apellidos, grupo_id, curp, estado, tutor_id) VALUES
 (1,'24261001','Luis','Hernández Cruz',1,'XEXX800101HMCXXX00','Activo',1),
 (2,'24261002','María','González Pérez',1,'XEXX810101HMCXXX01','Activo',2),
 (3,'24261003','Jorge','Martínez Ruiz',1,'XEXX820101HMCXXX02','Activo',3),
 (4,'24261004','Fernanda','López Sánchez',1,'XEXX830101HMCXXX03','Activo',4),
 (5,'24262005','Diego','Ramírez Torres',2,'XEXX840101HMCXXX04','Activo',5),
 (6,'24262006','Valeria','Flores Gómez',2,'XEXX850101HMCXXX05','Activo',6),
 (7,'24262007','Iván','Morales Díaz',2,'XEXX860101HMCXXX06','Activo',7),
 (8,'24262008','Camila','Vargas Reyes',2,'XEXX870101HMCXXX07','Activo',8),
 (9,'24263009','Andrés','Castillo Mendoza',3,'XEXX880101HMCXXX08','Activo',9),
 (10,'24263010','Sofía','Ortiz Jiménez',3,'XEXX890101HMCXXX09','Activo',10),
 (11,'24263011','Emiliano','Rojas Aguilar',3,'XEXX900101HMCXXX10','Activo',11),
 (12,'24263012','Regina','Navarro Silva',3,'XEXX910101HMCXXX11','Activo',12);

UPDATE usuario SET alumno_id = 1 WHERE usuario_id = 3;
UPDATE usuario SET alumno_id = 2 WHERE usuario_id = 4;

-- Credenciales: la del alumno 12 está 'Extraviada' (sirve para probar ese caso)
INSERT INTO credencial (credencial_id, alumno_id, uid_rfid, fecha_asignacion, estatus) VALUES
 (1,1,'A1B2C300','2026-10-19','Activa'),
 (2,2,'A1B2C311','2026-10-19','Activa'),
 (3,3,'A1B2C322','2026-10-19','Activa'),
 (4,4,'A1B2C333','2026-10-19','Activa'),
 (5,5,'A1B2C344','2026-10-19','Activa'),
 (6,6,'A1B2C355','2026-10-19','Activa'),
 (7,7,'A1B2C366','2026-10-19','Activa'),
 (8,8,'A1B2C377','2026-10-19','Activa'),
 (9,9,'A1B2C388','2026-10-19','Activa'),
 (10,10,'A1B2C399','2026-10-19','Activa'),
 (11,11,'A1B2C3AA','2026-10-19','Activa'),
 (12,12,'A1B2C3BB','2026-10-19','Extraviada');

INSERT INTO registro_asistencia (registro_id, alumno_id, horario_id, fecha, hora_entrada, hora_salida, estatus, origen) VALUES
 (1,1,1,'2026-10-26','06:49:00','14:06:00','Puntual','RFID'),
 (2,2,1,'2026-10-26','07:12:00','14:01:00','Retardo','RFID'),
 (3,3,1,'2026-10-26',NULL,NULL,'Falta','Sistema'),
 (4,4,1,'2026-10-26',NULL,NULL,'Falta justificada','Manual'),
 (5,5,6,'2026-10-26','13:03:00','20:00:00','Puntual','RFID'),
 (6,6,6,'2026-10-26','13:17:00','20:00:00','Retardo','RFID'),
 (7,7,6,'2026-10-26','12:58:00','20:06:00','Puntual','RFID'),
 (8,8,6,'2026-10-26','12:52:00','20:01:00','Puntual','RFID'),
 (9,9,11,'2026-10-26','07:24:00','14:00:00','Retardo','RFID'),
 (10,10,11,'2026-10-26','07:14:00','14:03:00','Retardo','RFID'),
 (11,11,11,'2026-10-26',NULL,NULL,'Falta','Sistema'),
 (12,12,11,'2026-10-26',NULL,NULL,'Falta','Sistema'),
 (13,1,2,'2026-10-27','06:51:00','11:47:00','Salida anticipada','RFID'),
 (14,2,2,'2026-10-27','07:23:00','14:00:00','Retardo','RFID'),
 (15,3,2,'2026-10-27','06:46:00','14:08:00','Puntual','RFID'),
 (16,4,2,'2026-10-27','06:54:00','14:06:00','Puntual','QR'),
 (17,5,7,'2026-10-27','13:02:00','20:01:00','Puntual','RFID'),
 (18,6,7,'2026-10-27','13:20:00','20:08:00','Retardo','RFID'),
 (19,7,7,'2026-10-27',NULL,NULL,'Falta justificada','Manual'),
 (20,8,7,'2026-10-27','12:48:00','20:09:00','Puntual','RFID'),
 (21,9,12,'2026-10-27','07:31:00','14:03:00','Retardo','RFID'),
 (22,10,12,'2026-10-27','06:48:00','14:08:00','Puntual','RFID'),
 (23,11,12,'2026-10-27',NULL,NULL,'Falta justificada','Manual'),
 (24,12,12,'2026-10-27','07:03:00','14:00:00','Puntual','RFID'),
 (25,1,3,'2026-10-28',NULL,NULL,'Falta','Sistema'),
 (26,2,3,'2026-10-28','07:00:00','14:10:00','Puntual','RFID'),
 (27,3,3,'2026-10-28','07:24:00','14:05:00','Retardo','RFID'),
 (28,4,3,'2026-10-28','07:03:00','14:07:00','Puntual','QR'),
 (29,5,8,'2026-10-28','12:54:00','20:03:00','Puntual','RFID'),
 (30,6,8,'2026-10-28','13:07:00','20:03:00','Puntual','RFID'),
 (31,7,8,'2026-10-28','13:03:00','20:04:00','Puntual','RFID'),
 (32,8,8,'2026-10-28','13:26:00','20:05:00','Retardo','RFID'),
 (33,9,13,'2026-10-28','07:04:00','12:24:00','Salida anticipada','RFID'),
 (34,10,13,'2026-10-28',NULL,NULL,'Falta','Sistema'),
 (35,11,13,'2026-10-28','06:48:00','14:08:00','Puntual','RFID'),
 (36,12,13,'2026-10-28','06:50:00','14:05:00','Puntual','RFID'),
 (37,1,4,'2026-10-29','07:00:00','14:06:00','Puntual','RFID'),
 (38,2,4,'2026-10-29','07:06:00','14:01:00','Puntual','RFID'),
 (39,3,4,'2026-10-29','07:00:00','12:17:00','Salida anticipada','RFID'),
 (40,4,4,'2026-10-29',NULL,NULL,'Falta justificada','Manual'),
 (41,5,9,'2026-10-29','13:04:00','20:07:00','Puntual','RFID'),
 (42,6,9,'2026-10-29','13:36:00','20:07:00','Retardo','RFID'),
 (43,7,9,'2026-10-29','12:47:00','20:04:00','Puntual','RFID'),
 (44,8,9,'2026-10-29','13:33:00','20:10:00','Retardo','RFID'),
 (45,9,14,'2026-10-29','06:46:00','14:04:00','Puntual','RFID'),
 (46,10,14,'2026-10-29',NULL,NULL,'Falta','Sistema'),
 (47,11,14,'2026-10-29','07:32:00','14:07:00','Retardo','RFID'),
 (48,12,14,'2026-10-29','07:07:00','14:06:00','Puntual','RFID'),
 (49,1,5,'2026-10-30',NULL,NULL,'Falta justificada','Manual'),
 (50,2,5,'2026-10-30','06:45:00','14:07:00','Puntual','RFID'),
 (51,3,5,'2026-10-30','06:50:00','14:09:00','Puntual','RFID'),
 (52,4,5,'2026-10-30','07:00:00','14:00:00','Puntual','QR'),
 (53,5,10,'2026-10-30','13:09:00','20:04:00','Puntual','RFID'),
 (54,6,10,'2026-10-30','13:08:00','20:03:00','Puntual','RFID'),
 (55,7,10,'2026-10-30','12:57:00','20:07:00','Puntual','RFID'),
 (56,8,10,'2026-10-30','12:50:00','20:07:00','Puntual','RFID'),
 (57,9,15,'2026-10-30','07:02:00','14:04:00','Puntual','RFID'),
 (58,10,15,'2026-10-30','06:58:00','14:08:00','Puntual','RFID'),
 (59,11,15,'2026-10-30','07:07:00','14:06:00','Puntual','RFID'),
 (60,12,15,'2026-10-30','07:06:00','14:06:00','Puntual','RFID');

-- Notificaciones: solo por INCIDENCIAS (no se avisa cuando es Puntual). Una quedó 'Fallido'.
INSERT INTO notificacion (alumno_id, registro_id, tipo, mensaje, fecha_hora_envio, estatus_envio) VALUES
 (2,2,'Retardo','María González Pérez llegó con retardo el 26/10/2026.','2026-10-26 07:45:00','Enviado'),
 (3,3,'Falta','Jorge Martínez Ruiz no registró asistencia el 26/10/2026.','2026-10-26 14:00:00','Enviado'),
 (4,4,'Falta justificada','La falta de Fernanda López Sánchez del 26/10/2026 quedó justificada.','2026-10-26 07:45:00','Fallido'),
 (6,6,'Retardo','Valeria Flores Gómez llegó con retardo el 26/10/2026.','2026-10-26 13:45:00','Enviado'),
 (9,9,'Retardo','Andrés Castillo Mendoza llegó con retardo el 26/10/2026.','2026-10-26 07:45:00','Enviado'),
 (10,10,'Retardo','Sofía Ortiz Jiménez llegó con retardo el 26/10/2026.','2026-10-26 07:45:00','Enviado'),
 (11,11,'Falta','Emiliano Rojas Aguilar no registró asistencia el 26/10/2026.','2026-10-26 14:00:00','Enviado'),
 (12,12,'Falta','Regina Navarro Silva no registró asistencia el 26/10/2026.','2026-10-26 14:00:00','Enviado'),
 (1,13,'Salida anticipada','Luis Hernández Cruz salió antes de su horario el 27/10/2026.','2026-10-27 07:45:00','Enviado'),
 (2,14,'Retardo','María González Pérez llegó con retardo el 27/10/2026.','2026-10-27 07:45:00','Enviado'),
 (6,18,'Retardo','Valeria Flores Gómez llegó con retardo el 27/10/2026.','2026-10-27 13:45:00','Enviado'),
 (7,19,'Falta justificada','La falta de Iván Morales Díaz del 27/10/2026 quedó justificada.','2026-10-27 13:45:00','Enviado'),
 (9,21,'Retardo','Andrés Castillo Mendoza llegó con retardo el 27/10/2026.','2026-10-27 07:45:00','Enviado'),
 (11,23,'Falta justificada','La falta de Emiliano Rojas Aguilar del 27/10/2026 quedó justificada.','2026-10-27 07:45:00','Enviado'),
 (1,25,'Falta','Luis Hernández Cruz no registró asistencia el 28/10/2026.','2026-10-28 14:00:00','Enviado'),
 (3,27,'Retardo','Jorge Martínez Ruiz llegó con retardo el 28/10/2026.','2026-10-28 07:45:00','Enviado'),
 (8,32,'Retardo','Camila Vargas Reyes llegó con retardo el 28/10/2026.','2026-10-28 13:45:00','Enviado'),
 (9,33,'Salida anticipada','Andrés Castillo Mendoza salió antes de su horario el 28/10/2026.','2026-10-28 07:45:00','Enviado'),
 (10,34,'Falta','Sofía Ortiz Jiménez no registró asistencia el 28/10/2026.','2026-10-28 14:00:00','Enviado'),
 (3,39,'Salida anticipada','Jorge Martínez Ruiz salió antes de su horario el 29/10/2026.','2026-10-29 07:45:00','Enviado'),
 (4,40,'Falta justificada','La falta de Fernanda López Sánchez del 29/10/2026 quedó justificada.','2026-10-29 07:45:00','Enviado'),
 (6,42,'Retardo','Valeria Flores Gómez llegó con retardo el 29/10/2026.','2026-10-29 13:45:00','Enviado'),
 (8,44,'Retardo','Camila Vargas Reyes llegó con retardo el 29/10/2026.','2026-10-29 13:45:00','Enviado'),
 (10,46,'Falta','Sofía Ortiz Jiménez no registró asistencia el 29/10/2026.','2026-10-29 14:00:00','Enviado'),
 (11,47,'Retardo','Emiliano Rojas Aguilar llegó con retardo el 29/10/2026.','2026-10-29 07:45:00','Enviado'),
 (1,49,'Falta justificada','La falta de Luis Hernández Cruz del 30/10/2026 quedó justificada.','2026-10-30 07:45:00','Enviado');
