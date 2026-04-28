-- ============================================================
-- File: 02_hr_analysis_queries.sql
-- Purpose:
-- This file contains the main SQL queries used to answer the
-- key HR analytics business questions in this project.
--
-- The analysis focuses on:
-- 1. Employee attrition
-- 2. Salary distribution
-- 3. Monthly performance trends
-- 4. Manager performance
-- 5. Training and performance relationship
-- 6. Store sales performance
-- 7. Employee satisfaction by department
-- 8. Productivity by job role
-- 9. Promotion potential
-- 10. Age and performance relationship
--
-- These queries help generate analytical outputs that can be
-- compared with Python EDA results and used for reporting.
-- ============================================================

-- 1. Employee Attrition by Department
SELECT 
    Department,
    COUNT(Employee_Id) AS Total_Employees,
    SUM(CASE WHEN Exit_Date IS NOT NULL THEN 1 ELSE 0 END) AS Exited_Employees,
    SUM(CASE WHEN Exit_Date IS NULL THEN 1 ELSE 0 END ) AS Active_Employees,
    ROUND(
         SUM(CASE WHEN Exit_Date IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_Id), 2
    ) AS Attrition_Rate
FROM employees
GROUP BY Department
ORDER BY  Attrition_Rate DESC

-- 2. Average Salary by Job Level
SELECT 
    Job_Level,
    COUNT(Employee_Id) AS Count_Employees,
    ROUND(AVG(Base_Salary_Annual), 2) as Avg_Salary,
    ROUND(MIN(Base_Salary_Annual), 2) as Min_Salary,
    ROUND(MAX(Base_Salary_Annual), 2) as Max_Salary
FROM employees
GROUP BY Job_Level
ORDER BY Avg_Salary DESC

-- 3. Monthly Performance Trend
SELECT 
    ROUND(AVG(Performance_Rating), 2) AS Avg_Performance,
    COUNT(Employee_Id) AS Record_Count,
    Year_Month
FROM monthly_performance
GROUP BY Year_Month
ORDER BY Avg_Performance DESC
LIMIT 10

-- 4. Top 10 Manager by Performance
SELECT 
    e.Manager_Id,
    e.Manager_Name,
    ROUND(AVG(mp.Performance_Rating), 2) AS Team_Avg_Performance,
    COUNT(DISTINCT e.Employee_Id) AS Team_Size,
    COUNT(*) AS Record_Count
FROM employees e 
JOIN monthly_performance mp ON e.Employee_Id = mp.Employee_Id 
WHERE 
    e.Manager_Id IS NOT NULL
GROUP BY e.Manager_Id, e.Manager_Name
ORDER BY Team_Avg_Performance DESC
LIMIT 10

-- 5. Training Hours and Employee Performance
SELECT 
    CASE 
        WHEN Training_Hours BETWEEN 0 AND 2 THEN '0-2'
        WHEN Training_Hours BETWEEN 3 AND 5 THEN '3-5'
        WHEN Training_Hours BETWEEN 6 AND 10 THEN '6-10'
        WHEN Training_Hours BETWEEN 11 AND 20 THEN '11-20'
        ELSE '20+'
    END AS Training_Band,
    ROUND(AVG(Performance_Rating), 2) AS Avg_Performance,
    ROUND(AVG(Engagement_Index), 2) AS Avg_Engagement,
    COUNT(*) AS Record_Count    
FROM monthly_performance
GROUP BY Training_Band
ORDER BY
    CASE Training_Band
        WHEN '0-2' THEN 1
        WHEN '3-5' THEN 2
        WHEN '6-10' THEN 3
        WHEN '11-20' THEN 4
        ELSE 5
    END    

-- 6. Top 5 Stores by Total Sales
SELECT
    s.Store_Id,
    s.Store_Name,
    s.Store_Type,
    s.City,
    ROUND(SUM(bo.Sales_Target), 2) AS Total_Target,
    ROUND(SUM(bo.Sales_Actual), 2) AS Total_Sales,
    ROUND(AVG(bo.Customer_Satisfaction), 2) AS Avg_Customer_Satisfaction,
    ROUND(AVG(bo.Nps_Score), 2) AS Avg_Nps_Score,
    ROUND(AVG(bo.Waste_Percentage), 2) AS Avg_Waste_Percentage,
    ROUND(AVG(bo.On_Time_Delivery), 2) As Avg_On_Time_Delivery,
    ROUND(SUM(bo.Sales_Actual) * 100 / SUM(bo.Sales_Target)) AS Sales_Achievement      
FROM stores s 
JOIN business_outcomes bo ON s.Store_Id = bo.Store_Id
WHERE s.Store_Id IS NOT NULL
GROUP BY 
    s.Store_Id,
    s.Store_Name,
    s.Store_Type
ORDER BY Total_Sales DESC
LIMIT 5 

-- Compare Top 5 and Bottom 5 Stores
WITH store_sales AS (
    SELECT 
        s.Store_Id,
        s.Store_Name,
        s.Store_Type,
        s.City,
        SUM(bo.Sales_Actual) AS Total_Sales,
        SUM(bo.Sales_Target) AS Total_Target,
        AVG(bo.Customer_Satisfaction) AS Avg_Customer_Satisfaction,
        AVG(bo.Nps_Score) AS Avg_Nps_Score,
        AVG(bo.Waste_Percentage) AS Avg_Waste_Percentage,
        AVG(bo.On_Time_Delivery) AS Avg_On_Time_Delivery,
        SUM(bo.Sales_Actual) * 100 / SUM(bo.Sales_Target) AS Sale_Achievement
    FROM stores s 
    JOIN business_outcomes bo ON s.Store_Id = bo.Store_Id
    GROUP BY 
        s.Store_Id,
        s.Store_Name,
        s.Store_Type,
        s.City
),

top_stores AS(
    SELECT *, 'Top 5' AS Store_Group
    FROM store_sales
    ORDER BY Total_Sales DESC
    LIMIT 5
),

bottom_stores AS(
    SELECT*, 'Bottom 5' AS Store_Group
    FROM store_sales
    ORDER BY Total_Sales ASC
    LIMIT 5
),

combine AS(
    SELECT * FROM top_stores
    UNION ALL
    SELECT * FROM bottom_stores
)

SELECT 
    Store_Group,
    ROUND(AVG(Total_Sales), 2) AS Avg_Total_Sales,
    ROUND(AVG(Avg_Customer_Satisfaction), 2) AS Avg_Customer_Satisfaction,
    ROUND(AVG(Avg_Nps_Score), 2) AS Avg_Nps_Score,
    ROUND(AVG(Avg_Waste_Percentage), 2) AS Avg_Waste_Percentage,
    ROUND(AVG(Avg_On_Time_Delivery), 2) AS Avg_On_Time_Delivery,
    ROUND(AVG(Sale_Achievement), 2) AS Avg_Sale_Achievement
FROM combine
GROUP BY Store_Group   

-- 7. Employee Satisfaction by Department
SELECT 
    e.Department,
    ROUND(AVG(mp.Employee_Satisfaction), 2) AS Avg_Employee_Satisfaction,
    COUNT(DISTINCT e.Employee_Id) AS Employee_Count,
    COUNT(*) AS Record_Count   
FROM employees e 
JOIN monthly_performance mp ON e.Employee_Id = mp.Employee_Id
GROUP BY e.Department
ORDER BY Avg_Employee_Satisfaction DESC

-- 8.Productivity Index by Job Role
SELECT 
    e.Job_Role,
    ROUND(AVG(r.Productivity_Index), 2) AS Avg_Productivity_Index,
    COUNT( DISTINCT e.Employee_Id) AS Employee_Count,
    COUNT(e.Employee_Id) AS Record_Count   
FROM employees e 
JOIN role_kpis r ON e.Employee_Id = r.Employee_Id
GROUP BY e.Job_Level
ORDER BY Avg_Productivity_Index DESC

-- 9. Promotion Potential Candidate
WITH employee_scores AS(
    SELECT 
        e.Employee_Id,
        e.Full_Name,
        e.Department,
        e.Job_Role,
        e.Job_Level,
        e.Store_Location,
        ROUND(AVG(mp.Performance_Rating), 3) AS Avg_Performance_Rating,
        ROUND(AVG(mp.Employee_Satisfaction), 3) AS Avg_Employee_Satisfaction,
        ROUND(AVG(mp.Engagement_Index), 3) AS Avg_Engagement,
        ROUND(AVG(mp.Manager_Evaluation), 3) AS Avg_Manager_Evaluation,
        CASE 
            WHEN e.Exit_Date IS NOT NULL THEN 1
            ELSE 0
        END AS Is_Exited    
    FROM employees e 
    JOIN monthly_performance mp ON e.Employee_Id = mp.Employee_Id
    GROUP BY
        e.Employee_Id,
        e.Full_Name,
        e.Department,
        e.Job_Role,
        e.Job_Level,
        e.Store_Location,
        e.Exit_Date
)

SELECT
    Employee_Id,
    Full_Name,
    Department,
    Job_Role,
    Job_Level,
    Store_Location,
    Avg_Performance_Rating,
    Avg_Employee_Satisfaction,
    Avg_Engagement,
    Avg_Manager_Evaluation,
    ROUND((
        0.45 * Avg_Performance_Rating / 5 +
        0.25 * Avg_Employee_Satisfaction / 10 +
        0.20 * Avg_Engagement / 10 +
        0.10 * Avg_Manager_Evaluation / 5
    )* 100, 2) AS Promotion_Potential_Score
FROM employee_scores
WHERE Is_Exited = 0
ORDER BY 
    Promotion_Potential_Score DESC,
    Avg_Performance_Rating DESC,
    Avg_Employee_Satisfaction DESC
LIMIT 10

-- 10. Average Performance by Age Group
WITH employee_performance AS(
    SELECT
        e.Employee_Id,
        e.Age,
        AVG(mp.Performance_Rating) AS Avg_Performance_Rating
    FROM employees e 
    JOIN monthly_performance mp ON e.Employee_Id = mp.Employee_Id
    GROUP BY
        e.Employee_Id,
        e.Age       
)

SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25  THEN '18-25'
        WHEN Age BETWEEN 26 AND 35  THEN '26-35'
        WHEN Age BETWEEN 36 AND 45  THEN '36-45'
        WHEN Age BETWEEN 46 AND 55  THEN '46-55'
        ELSE '56+'
    END AS Age_Group,
    ROUND(AVG(Avg_Performance_Rating), 3) AS Avg_Performance_Rating,
    COUNT(Employee_Id) AS Employee_Count
FROM employee_performance
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN '18-25' THEN 1
        WHEN '26-35' THEN 2
        WHEN '36-45' THEN 3
        WHEN '46-55' THEN 4 
        ELSE  5      
    END    
