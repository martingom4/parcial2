CREATE DATABASE modelo_estrella_madrid;
USE modelo_estrella_madrid;

CREATE TABLE hechos_eventos (
    id_evento VARCHAR(50) PRIMARY KEY,
    fecha DATE,
    hora TIME,
    tipo_evento VARCHAR(50),           -- Ej: 'Accidente', 'Remolque', 'Estacion'
    tipo_vehiculo VARCHAR(50),
    cod_distrito INT,
    coordenada_x FLOAT,
    coordenada_y FLOAT,
    alcohol CHAR(1),                   -- 'S' o 'N'
    droga CHAR(1),                     -- 'S' o 'N'
    fuente VARCHAR(50)                -- De dónde proviene: 'accidentes', 'remolques', 'bicicletas'
);

CREATE TABLE dim_fecha (
    fecha DATE PRIMARY KEY,
    anio INT,
    mes INT,
    dia INT,
    dia_semana VARCHAR(20)
);

CREATE TABLE dim_ubicacion (
    cod_distrito INT,
    distrito VARCHAR(50),
    localizacion VARCHAR(255),
    tipo_via VARCHAR(50),
    via VARCHAR(100),
    numero INT,
    cp VARCHAR(10),
    PRIMARY KEY (cod_distrito, localizacion)
);

CREATE TABLE dim_vehiculo (
    tipo_vehiculo VARCHAR(50),
    tipo_persona VARCHAR(50),
    rango_edad VARCHAR(50),
    sexo VARCHAR(10),
    PRIMARY KEY (tipo_vehiculo, tipo_persona, rango_edad, sexo)
);

CREATE TABLE dim_remolque (
    idVehiculo VARCHAR(50) PRIMARY KEY,
    deposito VARCHAR(50),
    motivo VARCHAR(50),
    turno INT,
    grua VARCHAR(10)
);

CREATE TABLE dim_ruta_bus (
    linea_id VARCHAR(10),
    linea_nombre VARCHAR(255),
    orden INT,
    parada VARCHAR(100),
    PRIMARY KEY (linea_id, orden)
);

ALTER TABLE hechos_eventos
ADD CONSTRAINT fk_fecha FOREIGN KEY (fecha) REFERENCES dim_fecha(fecha);

-- Solo si se usan códigos válidos y coincidentes
-- ALTER TABLE hechos_eventos
-- ADD CONSTRAINT fk_distrito FOREIGN KEY (cod_distrito, localizacion)
-- REFERENCES dim_ubicacion(cod_distrito, localizacion);
