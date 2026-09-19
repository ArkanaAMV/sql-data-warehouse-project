-- CRM: clientes
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.crm_cust_info;

-- CRM: productos
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.crm_prd_info;

-- CRM: ventas
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.crm_sales_details;

-- ERP: clientes
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.erp_cust_az12;

-- ERP: ubicaciones
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.erp_loc_a101;

-- ERP: categorias
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK
);

SELECT COUNT(*) AS TotalRows FROM bronze.erp_px_cat_g1v2;