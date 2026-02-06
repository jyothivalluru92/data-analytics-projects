🚰 Urban Water Consumption & Leak Risk Optimization Dashboard
📌 Project Overview

Urban water utilities face growing challenges in managing consumption efficiently while detecting potential leaks early.
This project analyzes household-level urban water usage, integrates weather data, and identifies high-risk leak patterns to support smarter water management and conservation strategies.

The analysis simulates a real-world smart metering environment inspired by the Bengaluru Hybrid Smart Meter Dataset (2024) and demonstrates an end-to-end analytics workflow using Excel, SQL, Python, and Power BI.

🎯 Business Problem

Urban municipalities need to:

Monitor household water consumption patterns

Identify abnormal usage and potential leak risks

Optimize water distribution and reduce wastage

Support data-driven decisions for infrastructure planning

This project answers:

Which districts consume the most water?

How does consumption vary by household activity?

Which households show high leak probability?

Is higher usage correlated with increased leak risk?

📊 Dataset Description

Base Inspiration: Bengaluru Hybrid Smart Meter Dataset (2024)
Approach: Synthetic dataset created by logically combining multiple sources to simulate real-world conditions.

Data Sources Combined

Household details

Smart meter water readings

Weather data (temperature, rainfall)

Key Fields

Household ID, district, household size

Daily water usage (kitchen, bathroom, laundry)

Weather attributes (temperature, rainfall)

Leak probability indicator

🛠 Tools & Technologies Used

Excel – Initial validation, duplicate & null checks, feature creation

SQL – Aggregations, ranking, leak-risk identification

Python (Pandas, Matplotlib) – Data validation, transformation, exploratory analysis

Power BI – Data modeling, DAX measures, interactive dashboard

🔄 End-to-End Workflow
1️⃣ Excel – Data Preparation & Feature Engineering

Checked for duplicates and null values

Created derived columns:

Total daily water consumption

Per capita water consumption

Leak flag (Normal / Possible Leak)

Efficiency index

Exported cleaned dataset as CSV

2️⃣ SQL – Analytical Queries

Identified households with leak probability > 0.05

Ranked households by total water usage using RANK()

Calculated:

Average per capita usage

District-level consumption summaries

Exported results for downstream analysis

3️⃣ Python – Data Validation & Exploratory Analysis

Verified dataset shape and schema

Converted date columns to datetime

Converted leak probability percentages to decimals

Checked for nulls and negative values

Defined threshold for high leak risk

Created visualizations:

Average daily usage by district

Usage split by activity

Rainfall vs water usage scatter plot

Leak probability distribution histogram

Saved refined dataset for Power BI

4️⃣ Power BI – Dashboard & Insights

Verified data types and model integrity

Created KPIs and measures:

Total water usage

Average leak probability

High leak count

Built interactive dashboard with slicers:

District

Tariff slab

Leak flag

📈 Dashboard Highlights

District-wise Water Consumption

Usage vs Leak Probability Scatter Analysis

Activity-based Usage Split

Short-term Consumption Trend with Leak Risk Overlay

🔍 Key Insights

West district shows highest total water consumption

Higher water usage correlates with increased leak probability

Bathroom usage contributes the largest share of total consumption

A small subset of households accounts for disproportionately high leak risk

💡 Recommendations

Prioritize inspections for households exceeding the leak risk threshold

Promote water-efficient fixtures for high-consumption activities

Use leak probability alerts for proactive maintenance

Integrate real-time smart meter data for continuous monitoring
