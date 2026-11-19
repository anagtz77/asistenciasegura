-- bd/schema.sql  🔒  Esquema completo de AsistenciaSegura-CECyTEM (10 tablas)
-- Se carga DENTRO de la base de tu equipo (asist_e1 ... asist_e6).
-- Orden: primero las tablas sin llaves foráneas, al final las que dependen de otras.
-- Si necesitas cambiar algo, NO edites este archivo: pide una migración en bd/migraciones/.
 
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS notificacion, registro_asistencia, credencial, alumno, tutor,
                     usuario, rol, horario, grupo, carrera;
SET FOREIGN_KEY_CHECKS = 1;
 
-- 1. Catálogo de carreras
CREATE TABLE carrera (
  carrera_id   INT AUTO_INCREMENT PRIMARY KEY,
  nombre       VARCHAR(80)  NOT NULL,
  clave        VARCHAR(10)  NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 2. Grupos (cada uno pertenece a una carrera)
CREATE TABLE grupo (
  grupo_id      INT AUTO_INCREMENT PRIMARY KEY,
  clave         VARCHAR(10) NOT NULL,
  carrera_id    INT NOT NULL,
  turno         ENUM('Matutino','Vespertino') NOT NULL,
  semestre      TINYINT NOT NULL,
  ciclo_escolar VARCHAR(9) NOT NULL,                 -- ej. '2026-2027'
  UNIQUE KEY uq_grupo (clave, ciclo_escolar),
  CONSTRAINT fk_grupo_carrera FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 3. Horario: un registro por día de la semana por grupo
CREATE TABLE horario (
  horario_id     INT AUTO_INCREMENT PRIMARY KEY,
  grupo_id       INT NOT NULL,
  dia_semana     TINYINT NOT NULL,                   -- 1 = lunes ... 5 = viernes
  hora_entrada   TIME NOT NULL,
  hora_salida    TIME NOT NULL,
  tolerancia_min TINYINT NOT NULL DEFAULT 10,        -- minutos antes de contar Retardo
  UNIQUE KEY uq_horario (grupo_id, dia_semana),
  CONSTRAINT fk_horario_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(grupo_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 4. Roles del sistema (los nombres son el CONTRATO de session['rol'])
CREATE TABLE rol (
  rol_id  INT AUTO_INCREMENT PRIMARY KEY,
  nombre  VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 5. Cuentas de acceso (alumno_id solo se llena si el usuario es un alumno)
CREATE TABLE usuario (
  usuario_id      INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(120) NOT NULL,
  correo          VARCHAR(120) NOT NULL UNIQUE,
  contrasena_hash VARCHAR(255) NOT NULL,             -- NUNCA la contraseña en texto plano
  rol_id          INT NOT NULL,
  alumno_id       INT NULL,
  activo          TINYINT(1) NOT NULL DEFAULT 1,
  CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES rol(rol_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 6. Tutores (padre/madre) que reciben las alertas de WhatsApp
CREATE TABLE tutor (
  tutor_id          INT AUTO_INCREMENT PRIMARY KEY,
  nombre            VARCHAR(120) NOT NULL,
  telefono_whatsapp VARCHAR(15)  NOT NULL,           -- formato 521 + 10 dígitos
  usuario_id        INT NULL,
  CONSTRAINT fk_tutor_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 7. Alumnos
CREATE TABLE alumno (
  alumno_id  INT AUTO_INCREMENT PRIMARY KEY,
  matricula  VARCHAR(20)  NOT NULL UNIQUE,
  nombre     VARCHAR(60)  NOT NULL,
  apellidos  VARCHAR(80)  NOT NULL,
  grupo_id   INT NOT NULL,
  curp       CHAR(18)     NOT NULL UNIQUE,
  estado     ENUM('Activo','Baja') NOT NULL DEFAULT 'Activo',
  tutor_id   INT NULL,
  CONSTRAINT fk_alumno_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(grupo_id),
  CONSTRAINT fk_alumno_tutor FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- La FK usuario -> alumno se agrega al final porque alumno se crea después de usuario
ALTER TABLE usuario
  ADD CONSTRAINT fk_usuario_alumno FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id);
 
-- 8. Credencial RFID/NFC (una por alumno)
CREATE TABLE credencial (
  credencial_id    INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id        INT NOT NULL UNIQUE,              -- relación 1:1
  uid_rfid         VARCHAR(20) NOT NULL UNIQUE,      -- UID en hexadecimal, MAYÚSCULAS
  fecha_asignacion DATE NOT NULL,
  estatus          ENUM('Activa','Extraviada','Inactiva') NOT NULL DEFAULT 'Activa',
  CONSTRAINT fk_credencial_alumno FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 9. Registro de asistencia: UNO por alumno por día (el "idioma común" de E1-E5)
CREATE TABLE registro_asistencia (
  registro_id  INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id    INT NOT NULL,
  horario_id   INT NOT NULL,
  fecha        DATE NOT NULL,
  hora_entrada TIME NULL,                            -- NULL si es Falta
  hora_salida  TIME NULL,
  estatus      ENUM('Puntual','Retardo','Falta','Falta justificada','Salida anticipada') NOT NULL,
  origen       ENUM('RFID','QR','Manual','Sistema') NOT NULL DEFAULT 'RFID',
  UNIQUE KEY uq_alumno_fecha (alumno_id, fecha),
  CONSTRAINT fk_registro_alumno  FOREIGN KEY (alumno_id)  REFERENCES alumno(alumno_id),
  CONSTRAINT fk_registro_horario FOREIGN KEY (horario_id) REFERENCES horario(horario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- 10. Notificaciones enviadas por WhatsApp
CREATE TABLE notificacion (
  notificacion_id  INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id        INT NOT NULL,
  registro_id      INT NULL,
  tipo             ENUM('Puntual','Retardo','Falta','Falta justificada','Salida anticipada') NOT NULL,
  mensaje          VARCHAR(500) NOT NULL,
  fecha_hora_envio DATETIME NOT NULL,
  estatus_envio    ENUM('Pendiente','Enviado','Fallido') NOT NULL DEFAULT 'Pendiente',
  CONSTRAINT fk_notif_alumno   FOREIGN KEY (alumno_id)   REFERENCES alumno(alumno_id),
  CONSTRAINT fk_notif_registro FOREIGN KEY (registro_id) REFERENCES registro_asistencia(registro_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
