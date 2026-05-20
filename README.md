# Análisis de Ventas — Superstore Dataset

Pipeline de datos end-to-end: EDA, ETL con Python, modelo estrella en PostgreSQL y dashboard en Power BI.

## 🌟 Descripción general
Proyecto de analítica de datos que cubre todo el flujo desde la exploración del dataset hasta la visualización interactiva. Incluye:

- Exploración de datos (EDA)
- Limpieza y transformación (ETL)
- Modelado en estrella en PostgreSQL
- Dashboard en Power BI

##  Estructura del repositorio

```
analisis-ventas-colombia/
├── assets/
│   └── modelo_estrella.png         # Diagrama del modelo de datos
├── data/
│   ├── raw/
│   │   └── Sample_Superstore.csv    # Dataset original
│   └── clean/                       # Datos preparados después del ETL
├── etl/
│   └── load.py                      # Script de carga y transformación
├── notebook/
│   ├── EDA.ipynb                    # Análisis exploratorio
│   └── ETL.ipynb                    # Limpieza, transformación y carga a PostgreSQL
├── powerbi/
│   └── dashboard_ventas.pbix        # Dashboard Power BI
├── sql/
│   ├── create_table.sql             # Creación del modelo estrella
│   └── query_bussines.sql           # Queries de validación y análisis
├── main.py
├── pyproject.toml
└── README.md
```

## 🎯 Objetivo del proyecto
Construir un pipeline de datos completo que permita responder preguntas clave del negocio sobre ventas, utilizando buenas prácticas de ingeniería de datos y analítica.

### Preguntas de negocio principales
- ¿Cuál es el ingreso total y el margen de ganancia?
- ¿Qué categoría de productos genera más ingresos y cuál más pérdidas?
- ¿En qué región se vende más y dónde es más rentable operar?
- ¿Cuál es la evolución mensual de las ventas?
- ¿Qué segmento de cliente genera más valor?

## 🗂️ Dataset

| Campo | Detalle |
|---|---|
| Nombre | Superstore Sales Dataset |
| Fuente | Kaggle — Vivek468 |
| Filas | 9.994 transacciones |
| Columnas | 21 columnas |
| Período | 2015 – 2018 |
| Formato | CSV |
| Link | https://www.kaggle.com/datasets/vivek468/superstore-dataset-final |

## 📊 Arquitectura del proyecto

```
[CSV raw] → [notebook/EDA.ipynb] → [notebook/ETL.ipynb] → [PostgreSQL] → [Power BI]
```

- EDA: exploración y detección de problemas.
- ETL: limpieza, transformación y carga.
- PostgreSQL: modelo estrella para análisis.
- Power BI: visualización e insights.

## ⭐ Modelo estrella

El modelo está diseñado con una tabla de hechos central y cuatro dimensiones.

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
| id_venta | SERIAL PK | Identificador único |
| id_cliente | INT FK | Referencia a `dim_cliente` |
| id_producto | INT FK | Referencia a `dim_producto` |
| id_fecha | INT FK | Referencia a `dim_fecha` |
| id_ubicacion | INT FK | Referencia a `dim_ubicacion` |
| quantity | INT | Cantidad vendida |
| sales | FLOAT | Valor de la venta |
| discount | FLOAT | Descuento aplicado |
| profit | FLOAT | Ganancia |
| profit_margin | FLOAT | Margen de ganancia (%) |

### Dimensiones principales

#### `dim_cliente`
- id_cliente
- customer_id
- customer_name
- segment

#### `dim_producto`
- id_producto
- product_id
- product_name
- category
- sub_category

#### `dim_fecha`
- id_fecha
- fecha
- year
- month
- month_name
- quarter
- day_of_week

#### `dim_ubicacion`
- id_ubicacion
- city
- state
- region
- postal_code

## 🔧 Instalación y configuración

1. Clonar el repositorio:

```bash
git clone https://github.com/tu-usuario/analisis-ventas-colombia.git
cd analisis-ventas-colombia
```

2. Crear y activar el entorno virtual (Windows):

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

3. Instalar dependencias:

```powershell
pip install -r requirements.txt
```

4. Configurar PostgreSQL:
- Crear la base de datos `ventas_db`.
- Ajustar credenciales dentro de `notebook/ETL.ipynb` o en el script de carga.

Ejemplo de configuración:

```python
DB_USER = "tu_usuario"
DB_PASSWORD = "tu_contraseña"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "ventas_db"
```

5. Ejecutar los notebooks en orden:
   1. `notebook/EDA.ipynb`
   2. `notebook/ETL.ipynb`

6. Conectar Power BI a PostgreSQL:
- Obtener datos → Base de datos PostgreSQL
- Servidor: `localhost`
- Base de datos: `ventas_db`

## 📌 Librerías principales utilizadas

- pandas
- numpy
- matplotlib
- seaborn
- sqlalchemy
- psycopg2-binary
- openpyxl

## 📈 Parte 1 — EDA (Análisis Exploratorio)

### Checklist de EDA
- Estructura del dataset: filas, columnas y tipos.
- Análisis de valores nulos.
- Detección de duplicados.
- Estadísticas descriptivas.
- Identificación de outliers.
- Distribución de ventas y ganancias.
- Top 10 productos por ventas.
- Análisis por región y categoría.
- Evolución temporal de ventas.

### Hallazgos principales del EDA
Se completarán al terminar el análisis.

🧹 Parte 2 — ETL (Limpieza y Transformación)
Pasos realizados
Paso	Descripción	Filas afectadas
Eliminar duplicados	df.drop_duplicates()	—
Corregir tipos de fecha	pd.to_datetime()	—
Crear profit_margin	profit / sales * 100	—
Crear dimensiones	Separar columnas por entidad	—
Guardar dataset limpio	save to `data/clean/`	—
Cargar a PostgreSQL	sqlalchemy + psycopg2	—
Los valores se completarán al ejecutar el ETL.

📊 Parte 3 — Dashboard Power BI
Visualizaciones incluidas
Visualización	Tipo	Métrica
Ingresos totales	Tarjeta	Sales total
Ganancia total	Tarjeta	Profit total
Ventas por mes	Gráfico de línea	Sales por fecha
Top categorías	Gráfico de barras	Sales por category
Ventas por región	Mapa	Sales por state
Margen por segmento	Gráfico de barras	Profit_margin por segment
🧠 Conclusiones
Se completarán al finalizar el proyecto.

👤 Autor
Tu nombre

LinkedIn: linkedin.com/in/tu-perfil
GitHub: github.com/tu-usuario
📄 Licencia
Este proyecto es de uso educativo y libre distribución.

Dataset original: Superstore Sales — Kaggle. Proyecto desarrollado como parte del portafolio de analítica de datos.


# Análisis Exploratorio de Datos (EDA)

## Hallazgos principales

- Dataset limpio: no se detectaron valores nulos, duplicados ni cadenas vacías.
- La mayoría de las ventas son menores a $1,000 USD.
- Existen ventas con pérdidas de hasta -$6,599 USD.
- El producto estrella es el Canon imageCLASS, con aproximadamente $60,000 USD en ventas.
- La categoría Technology es la más rentable.
- Furniture tiene un volumen de ventas alto, pero márgenes de ganancia bajos.
- Las regiones West y East muestran el mejor desempeño en ventas.
- Central vende mucho, pero su eficiencia es menor en comparación con otras regiones.
- El negocio presenta crecimiento año tras año, con picos de ventas al final del año.

## 📌 Estado actual del proyecto

- Cargamos el dataset original `data/raw/Sample_Superstore.csv`.
- Realizamos exploración inicial en `notebook/EDA.ipynb`.
- Identificamos valores faltantes, duplicados y posibles inconsistencias.
- Generamos el archivo limpio en `data/clean/Sample_Superstore_clean.csv`.
- Estamos configurando las variables de entorno para la conexión a PostgreSQL.
- La carga final a PostgreSQL está pendiente.

- El segmento Consumer genera más ingresos totales, mientras que Home Office muestra un mejor margen de rentabilidad.
