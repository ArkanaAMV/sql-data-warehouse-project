# Data Warehouse local con SQL Server

Proyecto de ingeniería de datos para construir un data warehouse local sobre SQL Server. El desarrollo sigue la arquitectura Medallion y se irá ampliando de forma incremental a medida que se incorporen las transformaciones y reglas de negocio.

## Estado actual

Actualmente el proyecto cubre la configuración inicial y la carga de datos en la capa Bronze:

- Creación de la base de datos `data_warehouse`.
- Creación de los esquemas `bronze`, `silver` y `gold`.
- Definición de tablas Bronze para las fuentes CRM y ERP.
- Carga completa de los archivos CSV mediante el procedimiento `bronze.load_bronze`.
- Registro básico de filas cargadas y tiempo de ejecución por tabla.

Las capas Silver y Gold ya tienen sus esquemas creados, pero todavía no contienen transformaciones ni modelos analíticos.

## Arquitectura

El flujo sigue tres capas:

1. **Bronze:** conserva los datos recibidos desde las fuentes en tablas.
2. **Silver:** estará destinada a la limpieza, estandarización y validación de los datos.
3. **Gold:** estará destinada a los modelos orientados al análisis y al consumo de información.

## Fuentes de datos

Los datos de entrada son archivos CSV organizados por sistema de origen:

- `datasets/source_crm/`
	- `cust_info.csv`
	- `prd_info.csv`
	- `sales_details.csv`
- `datasets/source_erp/`
	- `CUST_AZ12.csv`
	- `LOC_A101.csv`
	- `PX_CAT_G1V2.csv`

## Estructura del proyecto

```text
datasets/    Archivos CSV de origen
docs/        Documentación del proyecto
scripts/     Scripts SQL de creación y carga
test/        Espacio para pruebas y validaciones
```

## Ejecución

Ejecutar los scripts en el siguiente orden desde una instancia local de SQL Server:

1. `scripts/00_init.sql`
2. `scripts/01_bronze_create_tables.sql`
3. `scripts/02_bronze_bulk_insert.sql`

El script de carga utiliza `BULK INSERT` y actualmente contiene rutas locales de Windows hacia la carpeta `datasets`. Antes de ejecutarlo, revisar esas rutas y confirmar que la cuenta del servicio de SQL Server tenga acceso de lectura a los archivos CSV.

## Alcance

Este repositorio documenta el desarrollo progresivo de un data warehouse local. El alcance se actualizará junto con la incorporación de las transformaciones y las validaciones correspondientes.
