📊 Telecom Customer Churn Analytics

End-to-End Data Analysis using Python, SQL & Power BI

📖 Business Problem

Customer churn is one of the biggest challenges faced by telecom companies, directly affecting revenue and customer lifetime value.
This project aims to analyze customer churn behavior, identify key churn drivers, and measure the business impact of churn using customer demographics, service details, contract types, and churn reasons.

The analysis helps stakeholders:

Identify high-risk customer segments

Understand why customers are leaving

Reduce churn and revenue loss through data-driven strategies

📂 Dataset Information

Dataset Name: Telco Customer Churn (11.1.3+)

Source: IBM Sample Dataset (via Kaggle)

Total Records: 7,043 customers

Region & Period: California, Q3

Description:
The dataset contains customer demographics, service subscriptions, contract details, churn status, churn reasons, satisfaction scores, churn scores, and Customer Lifetime Value (CLTV).

🛠 Tools & Technologies Used

Python(Pandas) – Data cleaning, validation, normalization

MySQL – Data integration, joins, and analytical queries

Power BI – Data modeling, DAX measures, and interactive dashboards

🔄 Data Preparation & Processing
🔹 Python – Data Cleaning & Normalization

Loaded raw CSV data downloaded from Kaggle

Handled missing values and validated data types

Logically normalized the raw dataset into five subject-oriented tables:

Demographics

Location

Population

Services

Customer Status

Exported cleaned datasets as CSV files

🔹 SQL – Data Integration & Analysis

Imported cleaned tables into MySQL

Performed LEFT JOINs using CustomerID as the primary key to integrate data

Executed analytical queries to derive business insights, including:

Total customer count

Churned customer count

High-risk cities with maximum churn

Revenue lost due to churn

Churn analysis by contract and service type

📸 SQL query execution screenshots included

🔹 Power BI – Data Modeling

Imported processed data into Power BI

Designed a fact and dimension-based data model:

Fact Table: Fact_Churn

Dimension Tables: Dim_Customer, Dim_Location

Established one-to-many relationships using CustomerID

Created optimized DAX measures for churn KPIs

📸 Model View screenshot included

📐 Key Metrics & Measures

Total Customers

Churned Customers

Churn Rate (%)

Average Monthly Charges

Customer Lifetime Value (CLTV)

📈 Dashboard Overview

Dashboard Name: Telecom Customer Churn Analytics

The Power BI dashboard provides:

Overall churn rate and customer distribution

Churn comparison by internet service type

Contract-wise churn analysis

Top churn reasons and CLTV impact

Interactive slicers for gender and senior citizen analysis

📸 Customer Churn Overview dashboard included

🔍 Key Insights

26.5% churn rate, indicating a significant retention challenge

Month-to-month contracts have the highest churn compared to long-term contracts

Fiber Optic customers show higher churn than DSL and Cable users

Competitor offers and service dissatisfaction are the leading churn reasons

Churn among high-CLTV customers results in notable revenue loss

💡 Recommendations

Encourage customers to move from month-to-month plans to long-term contracts

Launch targeted retention campaigns for Fiber Optic users

Proactively engage high-CLTV customers with personalized offers

Improve pricing competitiveness and service quality

Use churn score and tenure to build early churn prediction models

✅ Conclusion

This project demonstrates a complete analytics pipeline — from raw data cleaning in Python, analytical querying in SQL, to business-ready dashboards in Power BI.
The insights generated can help telecom companies reduce churn, improve customer retention, and minimize revenue loss.

📁 Project Deliverables

Cleaned and normalized CSV datasets

SQL queries for churn analysis

Power BI dashboard (.pbix file)

Data model, SQL, and dashboard screenshots
