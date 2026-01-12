# Corporate Financial Audit & Risk Dashboard

### 📊 Project Overview
**Role:** Data Analyst | **Tools:** SQL (MySQL), Power BI, DAX

This project is an end-to-end business intelligence solution designed to monitor financial health across 5 key departments. It analyzes over 50,000 budget records to detect variance anomalies and flag critical "risk" areas (Over budget > 15%).

### 📸 Dashboard Preview
![Dashboard Main View](dashboard_main.png)
*(Note: Upload your screenshot and ensure the filename matches exactly)*

### 🔍 Key Features
* **Risk Flagging System:** Engineered SQL logic to categorize variances into "Healthy" (Green), "Watchlist" (Yellow), and "Critical" (Red).
* **Interactive Heatmap:** A custom variance matrix allowing auditors to spot specific months of failure instantly.
* **Dynamic Filtering:** Users can slice data by Quarter (Q1-Q4) and Department using the custom app-style navigation bar.
* **Trend Analysis:** Tracking budget vs. actuals over time to identify seasonal spending spikes.

### 🛠️ Technical Workflow
1.  **Data Extraction:** Connected Power BI to a local **MySQL** database.
2.  **Data Modeling:** Established relationships between Budget and Audit tables (Star Schema).
3.  **DAX Calculations:** Created measures for `Variance %`, `YTD Spend`, and `Risk Status`.
4.  **UI/UX Design:** Built a custom "Glassmorphism" background layout for a modern, app-like feel.

### 📂 Files Included
* `Financial_Audit_Dashboard.pbix`: The complete Power BI file.
* `audit_data.sql`: The SQL script used to generate the database schema and dummy data.

---
*Created by [Your Name] - [Link to your LinkedIn]*
