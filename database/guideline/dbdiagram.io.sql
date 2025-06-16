Table HechosEventosMadrid {
  id_evento varchar [pk]
  fecha date
  hora time
  tipo_evento varchar
  tipo_vehiculo varchar
  cod_distrito int
  coordenada_x float
  coordenada_y float
  alcohol boolean
  droga boolean
  fuente varchar
  id_remolque varchar [ref: > DimRemolque. id_remolque]
  linea_bus int [ref: > DimRutaBus.linea_id]
}

Table DimFecha {
  fecha date [pk]
  anio int
  mes int
  dia int
  dia_semana varchar
}

Table DimUbicacion {
  cod_distrito int
  distrito varchar
  localizacion varchar
  tipoVia varchar
  via varchar
  numero int
  cp varchar
  Note: 'PK por cod_distrito y localizacion si se requiere más granularidad'
}

Table DimVehiculo {
  tipo_vehiculo varchar
  tipo_persona varchar
  rango_edad varchar
  sexo varchar
  Note: 'Puede definirse como PK compuesta si se normaliza'
}

Table DimRemolque {
  id_remolque varchar [pk]
  deposito varchar
  motivo varchar
  turno int
  grua varchar
}

Table DimRutaBus {
  linea_id int
  linea_nombre varchar
  orden int
  parada varchar
  Note: 'PK compuesta si se requiere orden único por parada'
}

Ref: HechosEventosMadrid.fecha > DimFecha.fecha
Ref: HechosEventosMadrid.cod_distrito > DimUbicacion.cod_distrito
Ref: HechosEventosMadrid.tipo_vehiculo > DimVehiculo.tipo_vehiculo
