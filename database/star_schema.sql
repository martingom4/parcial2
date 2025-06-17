CREATE DATABASE modelo_estrella_madrid;
USE modelo_estrella_madrid;

CREATE TABLE `DimFecha` (
  `date_key` integer PRIMARY KEY,
  `date` date,
  `year` integer,
  `month` integer,
  `day` integer,
  `weekday` varchar(255),
  `hour` integer COMMENT 'Opcional, granularidad horaria'
);

CREATE TABLE `DimUbicacion` (
  `ubicacion_key` integer PRIMARY KEY,
  `cod_distrito` integer,
  `distrito` varchar(255),
  `tipo_via` varchar(255),
  `via` varchar(255),
  `numero` integer,
  `cp` varchar(255)
);

CREATE TABLE `DimTipoRegistro` (
  `tipo_registro_key` integer PRIMARY KEY,
  `tipo_registro` varchar(255) COMMENT 'Accidente / Entrada / Evento'
);

CREATE TABLE `DimVehiculo` (
  `vehicle_type_key` integer PRIMARY KEY,
  `vehicle_type` varchar(255)
);

CREATE TABLE `DimPersona` (
  `person_key` integer PRIMARY KEY,
  `person_type` varchar(255) COMMENT 'Conductor, pasajero…',
  `age_range` varchar(255) COMMENT 'Ej. “18–25”, “65+”',
  `gender` varchar(255)
);

CREATE TABLE `DimRuta` (
  `route_key` integer PRIMARY KEY,
  `linea_id` integer,
  `linea_nombre` varchar(255)
);

CREATE TABLE `DimTipoAccidente` (
  `accident_type_key` integer PRIMARY KEY,
  `accident_type` varchar(255) COMMENT 'Choque, atropello…'
);

CREATE TABLE `DimTipoEvento` (
  `event_type_key` integer PRIMARY KEY,
  `event_type` varchar(255) COMMENT 'Concierto, manifestación…'
);

CREATE TABLE `DimSeveridad` (
  `severity_key` integer PRIMARY KEY,
  `severity_code` integer,
  `description` varchar(255) COMMENT 'Leve, Grave, Fatal…'
);

CREATE TABLE `DimMotivo` (
  `motive_key` integer PRIMARY KEY,
  `motive_desc` varchar(255) COMMENT 'Motivo de la entrada de grúa'
);

CREATE TABLE `HechosIncidentes` (
  `incidente_id` integer PRIMARY KEY,
  `date_key` integer NOT NULL,
  `ubicacion_key` integer NOT NULL,
  `tipo_registro_key` integer NOT NULL,
  `vehicle_type_key` integer,
  `person_key` integer,
  `route_key` integer,
  `accident_type_key` integer,
  `event_type_key` integer,
  `severity_key` integer,
  `motive_key` integer,
  `positive_alcohol` boolean,
  `positive_drug` boolean,
  `duration_minutes` integer COMMENT 'Sólo para eventos'
);

ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`date_key`) REFERENCES `DimFecha` (`date_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`ubicacion_key`) REFERENCES `DimUbicacion` (`ubicacion_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`tipo_registro_key`) REFERENCES `DimTipoRegistro` (`tipo_registro_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`vehicle_type_key`) REFERENCES `DimVehiculo` (`vehicle_type_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`person_key`) REFERENCES `DimPersona` (`person_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`route_key`) REFERENCES `DimRuta` (`route_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`accident_type_key`) REFERENCES `DimTipoAccidente` (`accident_type_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`event_type_key`) REFERENCES `DimTipoEvento` (`event_type_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`severity_key`) REFERENCES `DimSeveridad` (`severity_key`);
ALTER TABLE `HechosIncidentes` ADD FOREIGN KEY (`motive_key`) REFERENCES `DimMotivo` (`motive_key`);
