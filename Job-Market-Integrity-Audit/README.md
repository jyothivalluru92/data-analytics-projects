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
### code here ###

# Edamam API credentials and country code
APP_ID = "----------------------------------" 
APP_KEY = "----------------------------------"
COUNTRY = "in" # 'in' for India, 'us' for USA, 'gb' for UK

import requests
import pandas as pd
from datetime import datetime

# --- FUNCTION 1: FETCH FROM ADZUNA (Uses your Keys) ---
def fetch_adzuna(app_id, app_key):
    url = f"https://api.adzuna.com/v1/api/jobs/in/search/1" 
    params = {"app_id": app_id, "app_key": app_key, "results_per_page": 20, "what": "data analyst"}
    try:
        response = requests.get(url, params=params)
        data = response.json()
        jobs = []
        for job in data.get("results", []):
            jobs.append({
                "Job_ID": f"adzuna_{job.get('id')}",
                "Title": job.get('title'),
                "Company": job.get('company', {}).get('display_name'),
                "Date": job.get('created'),
                "Source": "Adzuna"
            })
        return jobs
    except:
        return []

# --- FUNCTION 2: FETCH FROM THE MUSE (No Key Needed - Very Reliable) ---
def fetch_the_muse():
    # Searching for Data Analyst jobs on page 1
    url = "https://www.themuse.com/api/public/jobs?category=Data%20Science&category=Data%20and%20Analytics&page=1"
    try:
        response = requests.get(url)
        data = response.json()
        jobs = []
        for job in data.get("results", []):
            jobs.append({
                "Job_ID": f"muse_{job.get('id')}",
                "Title": job.get('name'),
                "Company": job.get('company', {}).get('name'),
                "Date": job.get('publication_date'),
                "Source": "The Muse"
            })
        return jobs
    except:
        return []

# --- THE EXECUTION ---
print("Fetching fresh data...")
list_adzuna = fetch_adzuna(APP_ID, APP_KEY)
list_muse = fetch_the_muse()

all_jobs = list_adzuna + list_muse
df = pd.DataFrame(all_jobs)

# Save the file
today = datetime.now().strftime("%Y-%m-%d")
filename = f"jobs_{today}.csv"
df.to_csv(filename, index=False)

print(f"Success! I found {len(df)} jobs total.")
print(df['Source'].value_counts()) # This will show you exactly how many from each
df.head()

# Check how many jobs came from each source
print(df['Source'].value_counts())

# Show the total number of unique jobs found
print(f"\nTotal unique Job IDs: {df['Job_ID'].nunique()}")

## 🚀 How to Run
1.  **Clone** this repository.
2.  Review `market_audit_cleaner.py` for the data processing logic.
3.  Open the `.pbix` file in **Power BI Desktop** to interact with the live dashboard.

---

### **Contact**
**BTech Graduate | Aspiring Data Analyst**
* **LinkedIn:** http://www.linkedin.com/in/jyothi-valluru-b1980a3ab
