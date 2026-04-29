# 📊 HR Analytics: Workforce Performance & Business Outcomes

## 🧩 Project Overview

This project is an end-to-end **HR Analytics case study** that analyzes workforce performance, employee attrition, satisfaction, productivity, promotion potential, and store-level business outcomes.

The project simulates a real-world Data Analyst workflow by combining:

- **SQL** for data validation, querying, joining, and aggregation
- **Python** for exploratory data analysis, correlation analysis, and visualization
- **Power BI** for interactive dashboard reporting
- **Markdown report** for business insights and recommendations

The goal is to transform raw HR and business data into actionable insights that support employee retention, workforce planning, performance improvement, and business decision-making.

---

## 🏢 Business Problem

Modern organizations need data-driven insights to manage employees effectively and improve business outcomes. Without proper analytics, companies may struggle to identify:

- Which departments have high employee attrition
- Whether training improves employee performance
- Which managers lead high-performing teams
- Which stores generate the highest sales
- Which employees have strong promotion potential

This project addresses these questions by analyzing HR and business data from **2022 to 2024**.

---

## 🎯 Project Objectives

The project aims to answer the following business questions:

1. How many employees have left the company, and which departments have the highest attrition rates?
2. What is the average salary distribution across job levels and departments?
3. Which months show peak employee performance?
4. Who are the top-performing managers based on team performance?
5. Does employee training correlate with better performance?
6. Which stores generate the highest revenue, and what differentiates them from lower-performing stores?
7. Which departments report the highest employee satisfaction?
8. Which job roles achieve the highest productivity index?
9. Who are the top candidates for promotion?
10. What is the relationship between employee age and performance?

---

## 🛠️ Tools & Technologies

### Data Processing & Analysis

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook

### Database & Querying

- SQL
- SQLite

### Data Visualization

- Power BI

### Version Control

- Git
- GitHub

---

## 🗂️ Dataset Overview

The dataset simulates an enterprise HR system covering the period from **2022 to 2024**. It includes employee information, monthly performance records, role-based KPIs, store metadata, and store-level business outcomes.

### Main Tables

| Table | Description |
|---|---|
| `employees` | Employee demographics, department, job role, salary, hire date, exit date, and manager information |
| `stores` | Store metadata including store ID, location, store type, and opening date |
| `monthly_performance` | Monthly employee performance, training hours, overtime, satisfaction, engagement, and manager evaluation |
| `role_kpis` | Productivity index and role-level KPI metrics |
| `business_outcomes` | Store sales target, actual sales, customer satisfaction, NPS, waste percentage, and on-time delivery |

---

## 📁 Project Structure

```bash
HR-ANALYTICS-WORKFORCE-PERFORMANCE/
│
├── data/
│   ├── raw/                         # Original raw datasets
│   └── processed/                   # Cleaned or processed datasets
│
├── images/                          # Dashboard screenshots used in README and report
│
├── notebooks/
│   └── exploratory_data_analysis.ipynb
│
├── powerbi/
│   └── HR_dashboard.pdf               # Power BI dashboard file
│   
│
├── reports/
│   └── hr_analytics_insight_report.md
│
├── sql/
│   ├── 01_data_quality_checks.sql
│   ├── 02_hr_analysis_queries.sql
│   ├── create_database.py
│   └── hr_analytics.db
│
├── README.md
└── requirements.txt
```

---

## 🧮 SQL Analysis

SQL was used to validate and analyze the data before dashboard development. The SQL workflow includes:

- Checking row counts and unique IDs across tables
- Validating active and exited employees
- Calculating attrition rates by department
- Aggregating salary by job level and department
- Ranking managers by team performance
- Comparing top and bottom stores by sales
- Identifying high-potential employees using a weighted promotion score

SQL helps ensure that the analysis is transparent, reproducible, and aligned with the Python EDA and Power BI dashboard.

---

## 🐍 Python EDA

Python was used for exploratory data analysis and deeper investigation. The notebook includes:

- Data loading and preparation
- Data quality checks
- Attrition analysis
- Salary analysis
- Monthly performance trends
- Manager performance ranking
- Training and performance relationship
- Store sales comparison
- Employee satisfaction analysis
- Productivity by job role
- Promotion potential scoring
- Age and performance analysis

The Python analysis also supports visual exploration and validation of results used in Power BI.

---

## 📊 Power BI Dashboard

The Power BI dashboard includes five main pages:

1. **Executive Overview**
2. **Attrition Analysis**
3. **Performance Analysis**
4. **Business Impact**
5. **Talent & Promotion**

### Dashboard Preview

![Executive Overview](images/executive_overview.png)

The dashboard provides an interactive view of key workforce and business metrics, including total sales, sales achievement, attrition rate, average performance, satisfaction, productivity, and promotion potential.

---

## 🔍 Key Insights

Key findings from the analysis include:

- Total sales reached approximately **1,979.5M**, slightly above the target of **1,978.4M**, with a sales achievement rate of around **100.1%**.
- The overall attrition rate is approximately **19.9%**, indicating a workforce retention challenge.
- Attrition is concentrated in specific departments, especially **HR** and **Logistics/Warehousing**.
- Early-tenure employees and lower salary groups show higher attrition risk.
- Employee performance tends to peak toward the end of the year, especially around December.
- Training hours have a positive but limited relationship with performance.
- Top-performing stores are mainly Superstores located in large cities.
- Logistics/Warehousing has both high attrition and lower satisfaction, making it a priority area for HR intervention.
- High-potential employees can be identified using performance, satisfaction, engagement, and manager evaluation.

---

## 📄 Insight Report

A detailed business insight report is available in the `reports/` folder. The report summarizes findings from SQL, Python EDA, and Power BI, and provides business recommendations.

[View HR Analytics Insight Report](reports/hr_analytics_insight_report.md)

---

## 💡 Business Recommendations

Based on the analysis, the following actions are recommended:

1. **Reduce attrition in high-risk groups**  
   Focus on HR, Logistics/Warehousing, lower salary groups, and early-tenure employees.

2. **Improve onboarding and early employee engagement**  
   Since early-tenure employees show higher attrition, onboarding quality should be strengthened.

3. **Improve training effectiveness**  
   Training should be role-specific, practical, and linked to measurable performance outcomes.

4. **Learn from high-performing stores**  
   Top Superstores should be studied to identify repeatable practices in sales execution, staffing, and operations.

5. **Use data-driven talent development**  
   Promotion potential scores can support succession planning, but final decisions should combine data with manager and HR evaluation.

---

## 🚀 How to Run This Project

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Run Python EDA

Open the notebook:

```bash
notebooks/exploratory_data_analysis.ipynb
```

### 4. Create SQLite database

Run:

```bash
python sql/create_database.py
```

### 5. Run SQL queries

Open the SQL files in the `sql/` folder:

```bash
sql/01_data_quality_checks.sql
sql/02_hr_analysis_queries.sql
```

### 6. Open Power BI dashboard

Open:

```bash
powerbi/dashboard.pbix
```

---

## ✅ Project Outcome

This project demonstrates a complete Data Analyst workflow from raw data to business insights. By combining SQL, Python, Power BI, and business reporting, the project provides a structured approach to understanding workforce performance and supporting HR decision-making.
