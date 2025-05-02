/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
	id INT
	,cst_key VARCHAR(50)
	,firstname VARCHAR(50)
	,lastname VARCHAR(50)
	,marital_status VARCHAR(50)
	,gndr VARCHAR(50)
	,create_date DATE
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
	id INT
	,prd_key VARCHAR(50)
	,prd_nm VARCHAR(50)
	,cost INT
	,line VARCHAR(50)
	,start_dt DATE
	,end_dt DATE
);

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
	ord_num VARCHAR(50)
	,prd_key VARCHAR(50)
	,cust_id INT
	,order_dt INT
	,ship_dt INT
	,due_dt INT
	,sales INT
	,quantity INT
	,price INT
);

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
	cid VARCHAR(50)
	,bdate DATE
	,gen VARCHAR(50)
)

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
	cid VARCHAR(50)
	,cntry VARCHAR(50)
)

IF OBJECT_ID('bronze.erp_px_catg1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_catg1v2;
CREATE TABLE bronze.erp_px_catg1v2 (
	id VARCHAR(50)
	,cat VARCHAR(50)
	,subcat VARCHAR(50)
	,maintenance VARCHAR(50)
)
