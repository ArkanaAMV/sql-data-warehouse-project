CREATE OR ALTER PROCEDURE bronze.load_bronze AS



BEGIN
    DECLARE @start_time DATETIME;
    DECLARE @end_time DATETIME;
    DECLARE @elapsed_time INT;
    DECLARE @row_count INT;
    BEGIN TRY
        PRINT 'INICIO DE CARGA - CAPA BRONZE';
        PRINT '========================================';

        PRINT 'CRM';
        PRINT '----------------------------------------';

        -- CRM: clientes
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.crm_cust_info;
        PRINT 'crm_cust_info = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo crm_cust_info: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        -- CRM: productos
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.crm_prd_info;
        PRINT 'crm_prd_info = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo crm_prd_info: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        -- CRM: ventas
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.crm_sales_details;
        PRINT 'crm_sales_details = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo crm_sales_details: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        PRINT '========================================';
        PRINT 'ERP';
        PRINT '----------------------------------------';

        -- ERP: clientes
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.erp_cust_az12;
        PRINT 'erp_cust_az12 = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo erp_cust_az12: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        -- ERP: ubicaciones
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.erp_loc_a101;
        PRINT 'erp_loc_a101 = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo erp_loc_a101: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        -- ERP: categorias
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\Angel\Desktop\DE\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
        );
        SET @end_time = GETDATE();
        SET @elapsed_time = DATEDIFF(SECOND, @start_time, @end_time);
        SELECT @row_count = COUNT(*)
        FROM bronze.erp_px_cat_g1v2;
        PRINT 'erp_px_cat_g1v2 = ' + CAST(@row_count AS VARCHAR(20));
        PRINT 'Tiempo erp_px_cat_g1v2: ' + CAST(@elapsed_time AS VARCHAR(10)) + ' segundos';

        PRINT '========================================';
        PRINT 'FIN DE CARGA - CAPA BRONZE';
    END TRY
    BEGIN CATCH
        PRINT 'ERROR OCCURRED DURING BRONZE LOAD: ' + CAST(ERROR_NUMBER() AS NVARCHAR(100));
    END CATCH
END