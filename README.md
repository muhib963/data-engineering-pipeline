# Data Engineering Pipeline for Retail Analytics

## Overview

This project demonstrates a complete **data engineering and analytics pipeline** built using Python, PostgreSQL, and SQL.

The pipeline extracts raw retail transaction data, performs data cleaning and transformations, loads the processed data into a database, and generates analytical insights including revenue trends, product performance, and customer segmentation using RFM analysis.

The goal of the project is to simulate a real-world workflow used by **data engineers and data analysts**.

---

## Tech Stack

* Python
* Pandas
* PostgreSQL
* SQL
* Metabase (dashboard visualization)
* Git / GitHub

---

## Project Architecture

```
Raw CSV Data
      ↓
Extract (Python)
      ↓
Transform (Data Cleaning)
      ↓
Load into PostgreSQL
      ↓
SQL Analytics
      ↓
Business Dashboard
```

---

## Project Structure

```
DATA_ENGINEERING_PIPELINE
│
├── data
│   └── data.csv
│
├── pipeline
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   ├── scripts_spyder.py
│   └── requirements.txt
│
├── sql
│   ├── analytics_queries.sql
│   ├── product_analysis.sql
│   ├── revenue_analysis.sql
│   ├── rfm_analysis_1.sql
│   ├── rfm_analysis_2.sql
│   └── rfm_view.sql
│
└── run_pipeline.py
```

---

## Pipeline Components

### Extract

The extraction step loads the raw dataset from CSV format.

```
pipeline/extract.py
```

This script reads the retail dataset and prepares it for transformation.

---

### Transform

The transformation step cleans and prepares the data.

```
pipeline/transform.py
```

Cleaning tasks include:

* Removing cancelled invoices
* Removing negative quantities
* Removing invalid prices
* Formatting timestamps
* Creating revenue calculations

---

### Load

The load stage inserts the cleaned dataset into PostgreSQL.

```
pipeline/load.py
```

The database table used for analysis is typically:

```
cleaned_sales
```

---

### Pipeline Execution

The entire pipeline can be executed using:

```
python run_pipeline.py
```

This runs the extract, transform, and load steps sequentially.

---

## SQL Analytics

After loading the data into PostgreSQL, several analytical queries are performed.

### Revenue Analysis

```
sql/revenue_analysis.sql
```

Insights include:

* Total revenue
* Monthly revenue trends
* Revenue by country

---

### Product Analysis

```
sql/product_analysis.sql
```

Insights include:

* Top selling products
* Product revenue contribution
* Product demand patterns

---

### Customer Segmentation (RFM)

```
sql/rfm_analysis_1.sql
sql/rfm_analysis_2.sql
sql/rfm_view.sql
```

Customers are segmented based on:

* Recency (how recently they purchased)
* Frequency (how often they purchase)
* Monetary value (how much they spend)

This analysis helps identify:

* High-value customers
* Loyal customers
* At-risk customers

---

## Example Business Insights

Using the analytical queries, the following insights can be derived:

* A small percentage of customers generate a large portion of total revenue.
* Certain products consistently drive the highest sales.
* Customer purchase behavior can be grouped into meaningful segments.
* Sales activity varies by time and location.

---

## How to Run the Project

Install dependencies:

```
pip install -r pipeline/requirements.txt
```

Run the pipeline:

```
python run_pipeline.py
```

Then execute SQL scripts in the `sql` folder using PostgreSQL.

---

## Skills Demonstrated

This project demonstrates:

* Data engineering pipeline design
* Data extraction, transformation, and loading (ETL)
* SQL analytics and business intelligence
* Customer segmentation techniques
* Data workflow automation

---

## Author

Md Muhibur Rahman
Calgary, Alberta, Canada
