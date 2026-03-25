# 📊 Job Market Integrity & Stagnancy Audit (2026)

### **Project Overview**
In a highly competitive entry-level market, "Ghost Jobs" (listings that remain open indefinitely without being filled) create significant friction for applicants. This project is a **7-day longitudinal audit** of the Data Analyst job market. By tracking over **170 daily snapshots**, I engineered a **'Market Stagnancy Index'** to quantify the prevalence of inactive listings across major job boards.

---

## 🛠️ Technical Stack
* **Data Engineering:** Python (Pandas, Glob, NumPy)
* **Analysis & Logic:** Power BI (DAX - Data Analysis Expressions)
* **Visualization:** Power BI Desktop (Interactive Dashboards, Treemap Heatmaps)
* **Environment:** Jupyter Notebook, VS Code

---

## 🏗️ Project Architecture

### **1. Data Extraction & Consolidation**
* **Source:** 7 daily snapshots (March 15 - March 22, 2026) in CSV format.
* **Process:** Automated the merging of multiple CSV files using Python `glob` and performed keyword-based filtering to isolate core **Data Analyst** and **Business Analyst** roles.

### **2. Analytical Logic (DAX)**
Developed custom measures to define market health:
* **Total Unique Roles:** `DISTINCTCOUNT(Job_ID)` - Identifies actual unique opportunities.
* **Zombie Count:** Filters for roles appearing in every single daily snapshot without status change.
* **Stagnancy Rate %:** `DIVIDE([Zombie Count], [Total Unique Roles])` - The primary KPI for market health.

### **3. Interactive BI Dashboard**
Designed a "Modern Enterprise" dark-mode dashboard featuring:
* **Market Composition:** A donut chart showing the split between Fresh, Active, and Stagnant roles.
* **Employer Heatmap:** A Treemap visual identifying "High-Stagnancy" companies.
* **Dynamic UX:** A DAX-powered dynamic title and tile-based slicers for real-time role filtering.

---

## 📈 Key Insights
* **1 in 3 Listings are 'Zombies':** The audit identified a **33.33% Stagnancy Rate**.
* **Lead Velocity:** Only **25% (9 roles)** showed 'High-Velocity' movement (filled/closed quickly).
* **Source Reliability:** Comparative analysis showed varying levels of listing "freshness" between platforms.

---

## 🚀 How to Run
1.  **Clone** this repository.
2.  Review `market_audit_cleaner.py` for the data processing logic.
3.  Open the `.pbix` file in **Power BI Desktop** to interact with the live dashboard.

---

### **Contact**
**BTech Graduate | Aspiring Data Analyst**
* **LinkedIn:** http://www.linkedin.com/in/jyothi-valluru-b1980a3ab
