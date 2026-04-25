-- ============================================================
-- File: 01_data_quality_checks.sql
-- Purpose:
-- This file is used to perform basic data quality checks before
-- conducting detailed HR analytics.
--
-- The goal is to understand:
-- 1. How many records are available in each table
-- 2. Whether employee and store IDs are unique
-- 3. The time range covered by the dataset
-- 4. How many employees are active or have exited
--
-- These checks help ensure that the data is ready for analysis.
-- ============================================================


-- 1. Count total records in each table
SELECT 'employees' AS table_name, COUNT(*) AS Total_Rows FROM employees
UNION ALL
SELECT 'stores', COUNT(*) FROM stores
UNION ALL
SELECT 'monthly_performance', COUNT(*) FROM monthly_performance
UNION ALL
SELECT 'role_kpis', COUNT(*) FROM role_kpis
UNION ALL
SELECT 'business_outcomes', COUNT(*) FROM business_outcomes;


-- 2. Check unique employees
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Employee_Id) AS Unique_Employees
FROM employees;


-- 3. Check unique stores
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Store_Id) AS Unique_Stores
FROM stores;


-- 4. Check date range of monthly performance data
SELECT 
    MIN(Year_Month) AS Start_Month,
    MAX(Year_Month) AS End_Month
FROM monthly_performance;


-- 5. Check active and exited employees
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Exit_Date IS NOT NULL THEN 1 ELSE 0 END) AS Exited_Employees,
    SUM(CASE WHEN Exit_Date IS NULL THEN 1 ELSE 0 END) AS Active_Employees
FROM employees;