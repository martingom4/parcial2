# Parcial #2 - Adquisición y Visualización de Datos

## 🎯 Objetivo General

Aplicar técnicas de adquisición de datos desde distintas fuentes (JSON, XML, Excel, scraping web y base de datos relacional), para procesarlos, transformarlos y diseñar un **modelo estrella**, culminando con la visualización de los datos en un **dashboard interactivo**.

---

## 📌 Tema Seleccionado

**Accidewntes en transporte público**

---

## ✅ Estado del Proyecto

- [x] Fuentes de datos seleccionadas
- [x] Extracción de datos
- [x] Transformación y limpieza
- [ ] Modelo estrella en base de datos
- [ ] Dashboard interactivo

---

## 🔧 Herramientas y Tecnologías Propuestas

- Lenguaje: Python / SQL
- Librerías: `pandas`, `requests`, `json`, `openpyxl`, `BeautifulSoup`
- Base de datos: PostgreSQL / MySQL
- Visualización: Power BI / Tableau / Dash / Streamlit

---

## 📁 Estructura del Proyecto

```
/parcial2/
│
├── data/
│   ├── raw/                  # Archivos originales (JSON, Excel, XML, HTML)
│   └── clean/                # Datos transformados para el modelo estrella
│
├── notebooks/                # Análisis exploratorio, limpieza y transformaciones
│
├── database/
│   └── star_schema.sql       # Script para crear modelo estrella
│
├── dashboard/                # Archivos del dashboard final (Power BI, Tableau, etc.)
│
├── src/
│   └── data_acquisition.py   # Scripts para cargar y transformar los datos
│
└── README.md
```

---

## 🔁 Resumen del Flujo

### 1. Recolección de Datos

- Obtener **4 datasets públicos**:
  - ✅ 1 XML (ej: clima, tráfico)
  - ✅ 1 JSON (ej: API de transporte)
  - ✅ 1 Excel (ej: planillas de transporte)
  - ✅ 1 vía scraping (ej: horarios o rutas)
- Guardar en `data/raw/`

### 2. Transformación y Limpieza

- Usar `pandas` o `PySpark` para:
  - Eliminar valores nulos
  - Normalizar formatos de fecha
  - Realizar uniones y fusiones
- Guardar el dataset limpio en `data/clean/`

### 3. Modelo Estrella

- Diseñar con:
  - 1 tabla de hechos (ej: viajes)
  - 3+ dimensiones (tiempo, ruta, estación, transporte, etc.)
- Mostrar el diagrama del modelo (con `dbdiagram.io`, Lucidchart, etc.)
- Crear la estructura en SQL o con ORM

### 4. Dashboard Interactivo

- Crear visualizaciones con:
  - Power BI / Tableau / Dash / Streamlit
- Mostrar:
  - Volumen de viajes por zona y fecha
  - Comparaciones por tipo de transporte
  - Tendencias temporales

---

## 🧠 Modelo Estrella

Se diseñará un esquema con:

- **Tabla de hechos**: viajes, registros de transporte
- **Dimensiones**: fecha, ubicación, tipo de transporte, compañía, etc.

---

## 📊 Dashboard Interactivo

El dashboard mostrará indicadores clave sobre transporte público:

- Volumen de viajes por zona y fecha
- Comparaciones por tipo de transporte
- Tendencias temporales

## 📂 Fuentes y Estructura de Datos

Este proyecto utiliza datos públicos relacionados con accidentes de tráfico en Londres. Las fuentes abarcan archivos XML/Excel descargables y una API JSON pública provista por TfL (Transport for London).

---

### 📄 1. Datos desde archivos XML/Excel

#### 🔹 `2019-gla-data-extract-casualty.csv`

Contiene información detallada sobre las personas involucradas en los accidentes.

| Campo                                   | Descripción                                    |
| --------------------------------------- | ---------------------------------------------- |
| `AREFNO`                                | ID del accidente                               |
| `Borough`                               | Nombre del distrito                            |
| `Easting`, `Northing`                   | Coordenadas cartesianas                        |
| `Casualty Class`                        | Rol del afectado (conductor, pasajero, peatón) |
| `Casualty Sex`                          | Sexo de la persona                             |
| `Casualty Age`, `Casualty Age (Banded)` | Edad y grupo de edad                           |
| `Casualty Severity`                     | Gravedad (Fatal, Grave, Leve)                  |
| `Mode of Travel`                        | Medio de transporte                            |

#### 🔹 `2019-gla-data-extract-vehicle.csv`

Contiene información sobre los vehículos implicados en cada accidente.

| Campo                                             | Descripción                          |
| ------------------------------------------------- | ------------------------------------ |
| `AREFNO`                                          | ID del accidente                     |
| `Vehicle Type`                                    | Tipo de vehículo (carro, moto, etc.) |
| `Vehicle Manoeuvres`                              | Maniobra al momento del accidente    |
| `Driver Age`, `Driver Sex`, `Driver Age (Banded)` | Edad y sexo del conductor            |

---

### 🌐 2. Datos desde API JSON de TfL

https://data.london.gov.uk/dataset/travel-patterns-and-trends-london

https://roads.data.tfl.gov.uk/#!LCAPJourneyTime%2FWeekly%2F

https://content.tfl.gov.uk/travel-in-london-2024-consolidated-estimates-of-total-travel-and-mode-shares-acc.pdf

https://roads.data.tfl.gov.uk/#!trafficstatus%2F
