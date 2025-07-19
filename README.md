# ETL & Retail Sales Analysis Project

This project demonstrates a complete ETL (Extract, Transform, Load) pipeline built using **Python**, **MySQL**, and **SQL** to analyze a retail sales dataset sourced from **Kaggle**.

## Objective

To extract, clean, transform, and load retail sales data and perform SQL-based analysis to uncover key business insights like top-performing products and region-wise sales performance.

---

## Dataset

- Source: [Kaggle Retail Dataset](https://www.kaggle.com/) *(Add actual link if applicable)*
- Format: CSV
- Contents: Sales transactions including product ID, region, sale price, and other details.

---

## Tech Stack

- **Python (Pandas)** – Data cleaning and transformation
- **MySQL Server** – Database storage and querying
- **SQL** – Business logic and analysis
- **Excel** – For initial inspection and output validation

---

## ETL Process

### Extract
- Imported dataset from Kaggle
- Loaded data using Pandas for initial inspection

### Transform
- Cleaned data by:
  - Handling null values
  - Removing duplicates
  - Converting and standardizing data types
  - Creating new metrics like `total_sales`

### Load
- Created database and tables in **MySQL Server**
- Inserted cleaned data into structured tables

---

## Analysis Performed

Used SQL queries to perform multiple business-level analyses:

• Identified the **top 10 highest revenue-generating products**  
• Found the **top 5 best-selling products by region** using CTEs  
• Calculated **overall sales performance** using SQL aggregation

## Outcomes

- End-to-end ETL pipeline implemented from raw data to actionable insights
- Cleaned and normalized real-world dataset
- SQL logic optimized for performance and business clarity
- Hands-on experience in combining Python and SQL for data workflows
