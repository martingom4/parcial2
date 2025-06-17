
Table DimFecha {
  date_key integer [pk]
  date date
  year integer
  month integer
  day integer
  weekday varchar
  hour integer [note: 'Opcional, granularidad horaria']
}

Table DimUbicacion {
  ubicacion_key integer [pk]
  cod_distrito integer
  distrito varchar
  tipo_via varchar
  via varchar
  numero integer
  cp varchar
}

Table DimTipoRegistro {
  tipo_registro_key integer [pk]
  tipo_registro varchar [note: 'Accidente / Entrada / Evento']
}

Table DimVehiculo {
  vehicle_type_key integer [pk]
  vehicle_type varchar
}

Table DimPersona {
  person_key integer [pk]
  person_type varchar [note: 'Conductor, pasajero…']
  age_range varchar [note: 'Ej. “18–25”, “65+”']
  gender varchar
}

Table DimRuta {
  route_key integer [pk]
  linea_id integer
  linea_nombre varchar
}

Table DimTipoAccidente {
  accident_type_key integer [pk]
  accident_type varchar [note: 'Choque, atropello…']
}

Table DimTipoEvento {
  event_type_key integer [pk]
  event_type varchar [note: 'Concierto, manifestación…']
}

Table DimSeveridad {
  severity_key integer [pk]
  severity_code integer
  description varchar [note: 'Leve, Grave, Fatal…']
}

Table DimMotivo {
  motive_key integer [pk]
  motive_desc varchar [note: 'Motivo de la entrada de grúa']
}


Table HechosIncidentes {
  incidente_id integer [pk]
  date_key integer [not null]
  ubicacion_key integer [not null]
  tipo_registro_key integer [not null]
  vehicle_type_key integer
  person_key integer
  route_key integer
  accident_type_key integer
  event_type_key integer
  severity_key integer
  motive_key integer
  positive_alcohol boolean
  positive_drug boolean
  duration_minutes integer [note: 'Sólo para eventos']
}

// Relaciones  desde dimensiones a tabla de hechos
Ref: DimFecha.date_key < HechosIncidentes.date_key
Ref: DimUbicacion.ubicacion_key < HechosIncidentes.ubicacion_key
Ref: DimTipoRegistro.tipo_registro_key < HechosIncidentes.tipo_registro_key
Ref: DimVehiculo.vehicle_type_key < HechosIncidentes.vehicle_type_key
Ref: DimPersona.person_key < HechosIncidentes.person_key
Ref: DimRuta.route_key < HechosIncidentes.route_key
Ref: DimTipoAccidente.accident_type_key < HechosIncidentes.accident_type_key
Ref: DimTipoEvento.event_type_key < HechosIncidentes.event_type_key
Ref: DimSeveridad.severity_key < HechosIncidentes.severity_key
Ref: DimMotivo.motive_key < HechosIncidentes.motive_key
