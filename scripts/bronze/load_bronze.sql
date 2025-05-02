/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME, @start_batch DATETIME, @end_batch DATETIME;
		PRINT '=====================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=====================================';

		PRINT '=====================================';
		PRINT 'Loading CRM Tables';
		PRINT '=====================================';

		SET @start_batch = GETDATE();
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.crm_cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.crm_prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.crm_sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';

		PRINT '=====================================';
		PRINT 'Loading ERP Tables';
		PRINT '=====================================';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.erp_cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.erp_loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_px_catg1v2;

		BULK INSERT bronze.erp_px_catg1v2
		FROM 'C:\Users\User\Desktop\sql-data-analytics-project\datasets\csv-files\bronze.erp_px_catg1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		SET @end_batch = GETDATE();
		PRINT '>> Load duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '>> Load duration of bronze layer: ' + CAST (DATEDIFF(second, @start_batch, @end_batch) AS VARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
		PRINT '=====================================';
		PRINT 'Error occured during loading bronze layer.';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS VARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS VARCHAR);
		PRINT '=====================================';
	END CATCH
END
