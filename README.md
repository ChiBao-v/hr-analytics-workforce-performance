# 📊 HR Analytics: Workforce Performance & Business Outcomes

## 🧩 Project Overview

This project is an **end-to-end HR Analytics case study** designed to demonstrate how data can be transformed into actionable workforce insights. The analysis focuses on understanding employee behavior, performance, satisfaction, and productivity, and how these factors influence overall business outcomes across multiple retail stores from **2022 to 2024**.

The project simulates a real-world enterprise analytics workflow, covering the full data lifecycle — from raw data processing to business intelligence reporting.

### Key Workflow

* Data understanding and relational modeling
* SQL-based data querying and transformation
* Exploratory Data Analysis (EDA) using Python
* Interactive dashboard development using Power BI
* Business insights generation and strategic recommendations

---

## 🏢 Business Problem

Modern organizations rely heavily on data-driven decision-making to manage their workforce efficiently. Without proper analytics, companies may struggle to identify performance issues, predict employee attrition, or optimize training investments.

This project aims to address critical workforce and business questions, such as:

* Which departments experience the highest employee attrition?
* Does employee training lead to measurable performance improvement?
* How does overtime affect productivity and employee satisfaction?
* Which managers lead the most effective teams?
* Do stores with higher employee satisfaction achieve better business performance?

---

## 🎯 Project Objectives

The primary objective of this project is to analyze workforce data and uncover insights that support operational and strategic decision-making.

Key analytical questions include:

1. How many employees have left the company, and which departments have the highest attrition rates?
2. What is the average salary distribution across job levels and departments?
3. Which months show peak employee performance trends?
4. Who are the top-performing managers based on team performance metrics?
5. Does increased training correlate with improved employee performance?
6. Which stores generate the highest revenue, and what differentiates them from lower-performing stores?
7. Which departments report the highest employee satisfaction levels?
8. Which job roles achieve the highest productivity index?
9. Who are the top candidates for promotion based on performance and engagement metrics?
10. What is the relationship between employee age and performance outcomes?

---

## 🛠️ Tools & Technologies
### Data Processing & Analysis

* Python
* Pandas
* NumPy
* Matplotlib

### Database & Querying
* SQL
### Data Visualization & Business Intelligence
* Power BI
### Development & Collaboration
* Git
* GitHub
* Jupyter Notebook

---
## 🗂️ Dataset Overview

The dataset simulates a large-scale enterprise HR system spanning the period from **2022 to 2024**. It represents the full employee lifecycle — from hiring and performance tracking to resignation or termination — while linking workforce behavior to store-level business outcomes.

This structure enables comprehensive workforce analytics and business performance evaluation.

## 📑 Data Tables

### employees
Contains employee demographic and organizational information.
Key attributes include:
* Employee ID
* Age
* Department
* Job Role
* Salary
* Hiring Date
* Exit Date
* Reporting Manager

### stores
Provides metadata about each retail store.
Key attributes include:
* Store ID
* Location
* Store Type
* Opening Date

### monthly_performance
Tracks employee performance metrics on a monthly basis.
Key attributes include:
* Performance Rating
* Training Hours
* Overtime Hours
* Absenteeism
* Satisfaction Score
* Engagement Index

### role_kpis
Stores KPI and productivity metrics for each employee.
Key attributes include:
* Productivity Index
* Performance KPI
* Monthly Evaluation Metrics

### business_outcomes
Contains store-level business performance indicators.
Key attributes include:
* Sales Target
* Actual Sales
* Customer Satisfaction Score
* Net Promoter Score (NPS)
* Operational Performance Metrics


## 📁 Project Structure

```bash
hr-analytics-workforce-performance/
│
├── data/          # Raw and processed datasets
├── notebooks/     # Python EDA and analysis
├── sql/           # SQL queries and transformations
├── powerbi/       # Power BI dashboard files
├── reports/       # Business insights and documentation
├── images/        # Dashboard screenshots
├── README.md
└── requirements.txt
```

