# 💰 Finance Risk Analytics Dashboard (AWS S3 → Snowflake → dbt → Tableau)
End-to-end Finance Risk Analytics Dashboard built using AWS S3, Snowflake , dbt, SQL and Tableau Public to analyze loan performance, regional revenue, default rates, and high-risk accounts.

This project presents a complete **finance risk analytics pipeline**, from raw loan data stored in **AWS S3**, loading and querying in **Snowflake**, transformation using **dbt**, and interactive visualization in **Tableau Public**.

---

## 📌 Pipeline Overview
--
[CSV Files]
      │
      ▼
[AWS S3]
      │
      ▼
[Snowflake External Stage]
      │
      ▼
[Snowflake Tables]
      │
      ▼
[dbt Models]
      │
      ▼
[Tableau Dashboard]
```

---

## 🧱 Tech Stack

| Layer | Tool | Purpose |
|--------|------|---------|
| Storage | AWS S3 | Store raw CSV datasets |
| Data Warehouse | Snowflake | Data loading, querying and analytics |
| Transformation | dbt | SQL-based data modeling |
| Visualization | Tableau Public | Interactive business dashboards |
| Version Control | Git & GitHub | Source code management |

---

# 🛠️ Step-by-Step Setup

## ✅ 1. Upload Data to AWS S3

- Create an AWS S3 bucket.
- Upload the finance CSV dataset.
- Configure bucket permissions for Snowflake access.

---

## ✅ 2. Connect Snowflake to AWS S3

Execute the following SQL in Snowflake.

```sql
CREATE OR REPLACE STORAGE INTEGRATION finance_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE;

CREATE OR REPLACE FILE FORMAT csv_format
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1;

CREATE OR REPLACE STAGE finance_stage
STORAGE_INTEGRATION = finance_int
FILE_FORMAT = csv_format;

COPY INTO LOANS_RAW
FROM @finance_stage;
```

---

## ✅ 3. Snowflake Data Modeling

The project creates analytical views including:

- Regional Revenue
- High Risk Accounts
- Loan Risk Summary
- Default Rate Summary

```sql
CREATE OR REPLACE VIEW REGIONAL_REVENUE AS
SELECT
    region,
    COUNT(*) AS active_loans,
    SUM(monthly_payment) AS total_monthly_revenue
FROM LOANS_RAW
GROUP BY region;
```
---

## ✅ 4. Setup dbt Project

### 📂 Project Structure

```
dbt/
├── analyses/
├── macros/
├── models/
│   ├── staging/
│   └── marts/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
└── packages.yml
```

### Run dbt

```bash
python -m venv dbt-venv

dbt-venv\Scripts\activate

pip install dbt-core dbt-snowflake

dbt debug

dbt run

dbt test

dbt docs generate

dbt docs serve
```

---

## ✅ 5. Connect Tableau to Snowflake

1. Open Tableau Desktop.
2. Select **Snowflake** connector.
3. Enter:
   - Server
   - Warehouse
   - Database
   - Schema
4. Connect to the analytical views created in Snowflake.
5. Build dashboards using the transformed data.

---

# 📊 Dashboard KPIs

The dashboard provides the following business metrics:

| KPI | Description |
|------|-------------|
| 💰 Total Revenue | Total revenue generated from loans |
| 📉 Average Default Rate | Average percentage of loan defaults |
| ⚠️ High Risk Accounts | Customers classified as high risk |
| 🏦 Total Loans | Total approved loans |

---

# 📈 Dashboard Insights

The dashboard contains multiple analytical views:

### 📉 Default Rate Summary

- Compare default rates across different regions
- Identify regions with higher lending risk

---

### 💳 Loan Risk Summary

- Total loans
- High-risk loans
- Compare healthy vs risky loan portfolio

---

### 📈 High Risk Account Analysis

Visualize

- Credit Score by Region
- Loan Amount by Region

to identify high-risk lending areas.

---

### 💰 Regional Monthly Revenue

Compare monthly revenue generated across different regions to understand business performance.

---
## 📈 Dashboard Layout

| Row | Visualization |
|-----|---------------|
| KPI Row | Total Revenue, Total Loans, Average Default Rate, High Risk Accounts|
| Row 1 | Regional Monthly Revenue |
| Row 2 | High Risk Accounts |
| Row 3 | Loan Risk Summary |
| Row 4 | Default Rate Analysis |
---

## 🔗 Tableau Public

```
View Tableau Dashboard: https://public.tableau.com/app/profile/harshitha.marasu8846/viz/FINANCIALCREDITRISKANALYTICS/FINANCIALCREDITRISKANALYTICS
```
---

## 📂 Repository Structure

```text
finance-risk-analytics-dashboard/
│
├── README.md
├── sql/
├── dbt/
├── data/
├── dashboard/
└── images/
```

---

## 🗃️ Git Workflow

```bash
git init

git add .

git commit -m "Initial commit"

git branch -M main

git remote add origin https://github.com/yourusername/finance-risk-analytics-dashboard.git

git push -u origin main
```

---

## 👤 Author

**Harshitha Marasu**

📧 Email: mharshitha1969@gmail.com

💼 LinkedIn: www.linkedin.com/in/harshitha-marasu
