# 📊 Análisis de Ventas — Superstore Dataset

![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql)
![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-yellow?logo=powerbi)
![Status](https://img.shields.io/badge/Status-En%20desarrollo-green)

Proyecto de analítica de datos end-to-end que cubre desde la exploración del dataset hasta la visualización en un dashboard interactivo. Incluye EDA, ETL, modelo estrella en PostgreSQL y dashboard en Power BI Desktop.

---

## 📁 Estructura del repositorio

```
analisis-ventas-colombia/
│
├── data/
│   ├── raw/
│   │   └── superstore.csv          # Dataset original sin modificar
│   └── clean/
│       └── superstore_clean.csv    # Dataset limpio después del ETL
│
├── notebooks/
│   ├── 01_EDA.ipynb                # Análisis exploratorio de datos
│   └── 02_ETL.ipynb                # Limpieza, transformación y carga a PostgreSQL
│
├── sql/
│   ├── 01_create_tables.sql        # Creación del modelo estrella
│   └── 02_queries_negocio.sql      # Queries de validación y análisis
│
├── powerbi/
│   └── dashboard_ventas.pbix       # Dashboard Power BI
│
├── assets/
│   └── modelo_estrella.png         # Diagrama del modelo de datos
│
├── requirements.txt                # Librerías necesarias
└── README.md                       # Este archivo
```

---

## 🎯 Objetivo del proyecto

Construir un pipeline de datos completo que permita responder preguntas de negocio clave sobre las ventas de una empresa retail, utilizando buenas prácticas de ingeniería de datos y analítica.

### Preguntas de negocio a responder

1. ¿Cuál es el ingreso total y el margen de ganancia del negocio?
2. ¿Qué categoría de productos genera más ingresos y cuál más pérdidas?
3. ¿En qué región se vende más y dónde es más rentable operar?
4. ¿Cuál es la evolución mensual de las ventas?
5. ¿Qué segmento de cliente genera más valor?

---

## 🗂️ Dataset

| Campo | Detalle |
|---|---|
| **Nombre** | Superstore Sales Dataset |
| **Fuente** | Kaggle — Vivek468 |
| **Filas** | 9,994 transacciones |
| **Columnas** | 21 columnas |
| **Período** | 2015 – 2018 |
| **Formato** | `.csv` |

**Link de descarga:**
[https://www.kaggle.com/datasets/vivek468/superstore-dataset-final](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

### Descripción de columnas

| Columna | Tipo | Descripción |
|---|---|---|
| `Row ID` | Integer | Identificador único de fila |
| `Order ID` | String | Número de orden |
| `Order Date` | Date | Fecha de la orden |
| `Ship Date` | Date | Fecha de envío |
| `Ship Mode` | String | Modo de envío |
| `Customer ID` | String | ID único del cliente |
| `Customer Name` | String | Nombre del cliente |
| `Segment` | String | Segmento del cliente (Consumer, Corporate, Home Office) |
| `Country` | String | País |
| `City` | String | Ciudad |
| `State` | String | Estado |
| `Postal Code` | Integer | Código postal |
| `Region` | String | Región geográfica |
| `Product ID` | String | ID único del producto |
| `Category` | String | Categoría del producto |
| `Sub-Category` | String | Subcategoría del producto |
| `Product Name` | String | Nombre del producto |
| `Sales` | Float | Valor de la venta en USD |
| `Quantity` | Integer | Cantidad vendida |
| `Discount` | Float | Descuento aplicado (0 a 1) |
| `Profit` | Float | Ganancia en USD |

---

## 🏗️ Arquitectura del proyecto

```
[CSV Raw]
    │
    ▼
[Python — EDA]          ← Exploración, detección de problemas
    │
    ▼
[Python — ETL]          ← Limpieza, transformación, nuevas columnas
    │
    ▼
[PostgreSQL]            ← Modelo estrella (1 fact + 4 dims)
    │
    ▼
[Power BI Desktop]      ← Dashboard interactivo
```

---

## ⭐ Modelo estrella

El modelo de datos sigue una arquitectura estrella con una tabla de hechos central y cuatro dimensiones.

```
                  dim_cliente
                 (id_cliente)
                      │
                      │
dim_producto ── fact_ventas ── dim_fecha
(id_producto)  (tabla central)  (id_fecha)
                      │
                      │
                 dim_ubicacion
                (id_ubicacion)
```

### Tabla de hechos — `fact_ventas`

| Columna | Tipo | Descripción |
|---|---|---|
| `id_venta` | SERIAL PK | Identificador único |
| `id_cliente` | INT FK | Referencia a dim_cliente |
| `id_producto` | INT FK | Referencia a dim_producto |
| `id_fecha` | INT FK | Referencia a dim_fecha |
| `id_ubicacion` | INT FK | Referencia a dim_ubicacion |
| `quantity` | INT | Cantidad vendida |
| `sales` | FLOAT | Valor de la venta |
| `discount` | FLOAT | Descuento aplicado |
| `profit` | FLOAT | Ganancia |
| `profit_margin` | FLOAT | Margen de ganancia (%) |

### Dimensiones

**dim_cliente**
| Columna | Tipo | Descripción |
|---|---|---|
| `id_cliente` | SERIAL PK | Identificador único |
| `customer_id` | VARCHAR | ID original del cliente |
| `customer_name` | VARCHAR | Nombre del cliente |
| `segment` | VARCHAR | Segmento (Consumer, Corporate, Home Office) |

**dim_producto**
| Columna | Tipo | Descripción |
|---|---|---|
| `id_producto` | SERIAL PK | Identificador único |
| `product_id` | VARCHAR | ID original del producto |
| `product_name` | VARCHAR | Nombre del producto |
| `category` | VARCHAR | Categoría |
| `sub_category` | VARCHAR | Subcategoría |

**dim_fecha**
| Columna | Tipo | Descripción |
|---|---|---|
| `id_fecha` | SERIAL PK | Identificador único |
| `fecha` | DATE | Fecha completa |
| `year` | INT | Año |
| `month` | INT | Mes (número) |
| `month_name` | VARCHAR | Mes (nombre) |
| `quarter` | INT | Trimestre |
| `day_of_week` | VARCHAR | Día de la semana |

**dim_ubicacion**
| Columna | Tipo | Descripción |
|---|---|---|
| `id_ubicacion` | SERIAL PK | Identificador único |
| `city` | VARCHAR | Ciudad |
| `state` | VARCHAR | Estado |
| `region` | VARCHAR | Región |
| `postal_code` | VARCHAR | Código postal |

---

## 🔧 Instalación y configuración

### 1. Clonar el repositorio

```bash
[git clone https://github.com/tu-usuario/analisis-ventas-colombia.git](https://github.com/r0bins0nurreg07/analisis-ventas-colombia.git)
cd analisis-ventas-colombia
```

### 2. Crear entorno virtual

uv venv
.venv\Scripts\activate           # Windows
```

### 3. Instalar dependencias
uv sync

### 4. Configurar PostgreSQL

Crear la base de datos antes de ejecutar el ETL:

```sql
CREATE DATABASE ventas_db;
```

Configurar las credenciales en el notebook `02_ETL.ipynb`:

```python
DB_USER     = "tu_usuario"
DB_PASSWORD = "tu_contraseña"
DB_HOST     = "localhost"
DB_PORT     = "5432"
DB_NAME     = "ventas_db"
```

### 5. Ejecutar los notebooks en orden

```
1. notebooks/01_EDA.ipynb
2. notebooks/02_ETL.ipynb
```

### 6. Conectar Power BI a PostgreSQL

```
Inicio → Obtener datos → Base de datos PostgreSQL
Servidor: localhost
Base de datos: ventas_db
```

---

## 📦 Librerías utilizadas

```txt
pandas==2.2.0
numpy==1.26.4
matplotlib==3.8.0
seaborn==0.13.0
sqlalchemy==2.0.25
psycopg2-binary==2.9.9
openpyxl==3.1.2
```

---

## 📈 Parte 1 — EDA (Análisis Exploratorio)

### Checklist

- [x] Estructura del dataset — filas, columnas y tipos de datos
- [x] Análisis de valores nulos por columna
- [x] Detección de filas duplicadas
- [x] Estadísticas descriptivas e interpretación de outliers
- [x] Distribución de ventas y ganancias
- [x] Top 10 productos por ventas e ingresos
- [x] Análisis por región y categoría
- [x] Evolución temporal de ventas

### Hallazgos principales del EDA

> Se completarán al terminar el análisis.

---

## 🧹 Parte 2 — ETL (Limpieza y Transformación)

### Pasos realizados

| Paso | Descripción | Filas afectadas |
|---|---|---|
| Eliminar duplicados | `df.drop_duplicates()` | — |
| Corregir tipos de fecha | `pd.to_datetime()` | — |
| Crear `profit_margin` | `profit / sales * 100` | — |
| Crear dimensiones | Separar columnas por entidad | — |
| Cargar a PostgreSQL | `sqlalchemy + psycopg2` | — |

> Los valores se completarán al ejecutar el ETL.

---

## 📊 Parte 3 — Dashboard Power BI

### Visualizaciones incluidas

| Visualización | Tipo | Métrica |
|---|---|---|
| Ingresos totales | Tarjeta | Sales total |
| Ganancia total | Tarjeta | Profit total |
| Ventas por mes | Gráfico de línea | Sales por fecha |
| Top categorías | Gráfico de barras | Sales por category |
| Ventas por región | Mapa | Sales por state |
| Margen por segmento | Gráfico de barras | Profit_margin por segment |

---

## 🧠 Conclusiones

> Se completarán al finalizar el proyecto.

---

## 👤 Autor

**Tu nombre**
- LinkedIn: [linkedin.com/in/tu-perfil](https://linkedin.com/in/tu-perfil)
- GitHub: [github.com/tu-usuario](https://github.com/tu-usuario)

---

## 📄 Licencia

Este proyecto es de uso educativo y libre distribución.

---

*Dataset original: Superstore Sales — Kaggle. Proyecto desarrollado como parte del portafolio de analítica de datos.*
