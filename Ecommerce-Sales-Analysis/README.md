📦 Olist E-Commerce Delivery Performance & Customer Reviews Analysis

Data Analytics Project | Python • Power BI

📖 Business Problem

In e-commerce, late deliveries directly impact customer satisfaction, reviews, and repeat purchases.
This project analyzes order delivery performance and customer review behavior to identify:

How often orders are delayed

Which regions experience frequent delays

The relationship between delivery delays and customer review scores

Revenue impact linked to delivery performance

The objective is to help business teams improve logistics efficiency and customer satisfaction.

📊 Dataset Information

Dataset Name: Brazilian E-Commerce Public Dataset by Olist

Source: Kaggle

Description:
Real commercial data from Olist, a Brazilian e-commerce marketplace, covering orders, customers, reviews, and delivery timelines.

Total Tables Available: 9

Tables Used in This Project (4):

orders

order_items

customers

order_reviews

🛠 Tools & Technologies

Python(Pandas) – Data quality checks, cleaning, feature engineering

Power BI – Data modeling, DAX measures, dashboard visualization

🔄 Data Preparation & Feature Engineering (Python)
🔹 Data Quality Checks

Identified 160 null values in order_approved_at

Business justification:

Some orders were not approved or cancelled

These are valid business scenarios, not data errors

Column not used in delivery calculations → nulls intentionally retained

🔹 Data Cleaning

Converted all date columns to datetime

Filled missing review comments with blanks

Verified consistency of order and customer identifiers

🔹 Feature Engineering

Created new business-focused columns:

Delivery Days → Actual delivery duration

Delivery Status → On-time vs Delayed

Revenue → price + freight_value (from order_items)

Review Category → Good / Neutral / Poor

🔹 Data Integration

Used orders as the base table

Merged:

order_items

customers

order_reviews

Join key: order_id

Final dataset saved as CSV and loaded into Power BI

📐 Power BI Measures

Total Orders

Total Revenue

% Delayed Orders

Average Delivery Days

Average Review Score

📈 Dashboard Overview

Dashboard Title: Olist E-Commerce: Delivery Delays & Reviews

The dashboard provides:

Order trends over time (year & month)

On-time vs delayed delivery comparison

Review score distribution

Relationship between delivery status and review categories

State-wise delivery performance

Identification of problem states with high delay percentages

📸 Executive Overview Dashboard Screenshot included

🔍 Key Insights

Majority of orders are delivered on time, but delayed orders receive significantly lower reviews

States with higher average delivery days show reduced customer satisfaction

Poor reviews are strongly associated with delayed deliveries

A small percentage of delayed orders contributes disproportionately to negative reviews

Revenue concentration highlights the importance of logistics reliability

💡 Business Recommendations

Prioritize logistics optimization in high-delay states

Introduce early-warning systems for orders likely to be delayed

Proactively communicate delays to customers to reduce poor reviews

Monitor delivery KPIs alongside customer feedback metrics

Use delivery performance as a key input for vendor and courier evaluation

✅ Conclusion

This project demonstrates an end-to-end e-commerce analytics workflow, from raw data cleaning and feature engineering in Python to business-ready insights in Power BI.
The analysis clearly shows how delivery performance directly influences customer reviews and business outcomes.
