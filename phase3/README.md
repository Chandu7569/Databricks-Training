# SQL to PySpark – Phase 3: Final ETL & Pipeline Practice Pack

## 📌 Overview

This repository contains the **SQL to PySpark Phase 3 – Final ETL & Pipeline Practice Pack**. The goal of this phase is to transition from writing individual SQL queries to building complete ETL (Extract, Transform, Load) pipelines using PySpark.

The exercises simulate real-world data engineering workflows by focusing on data ingestion, cleaning, transformation, aggregation, and reporting using Apache Spark. :contentReference[oaicite:0]{index=0}

---

## 🎯 Objective

The primary objectives of this project are to:

- Understand the ETL (Extract, Transform, Load) process.
- Read data from multiple file formats.
- Perform data cleaning and validation.
- Apply transformations and aggregations.
- Build reusable PySpark ETL pipelines.
- Convert SQL logic into PySpark DataFrame operations.

---

## 📚 Prerequisites

Before starting this project, it is recommended to understand:

- PySpark Basics
- Reading and Writing Files
- Working with CSV Files
- Handling Missing Data
- Data Filtering

These concepts provide the foundation required to complete the exercises successfully. :contentReference[oaicite:1]{index=1}

---

## 🛠 Technologies Used

- Python
- Apache Spark
- PySpark
- SQL
- CSV
- JSON
- Parquet

---

## 📂 Project Structure

```
SQL-to-PySpark-Phase3/
│
├── README.md
├── notebooks/
│   ├── ETL_Pipeline.ipynb
│   └── Business_Exercises.ipynb
│
├── sql/
│   ├── exercise1.sql
│   ├── exercise2.sql
│   └── ...
│
├── pyspark/
│   ├── ingestion.py
│   ├── cleaning.py
│   ├── transformation.py
│   ├── aggregation.py
│   └── pipeline.py
│
├── samples/
│   ├── customers.csv
│   ├── sales.csv
│   ├── orders.csv
│   ├── customers.json
│   └── customers.parquet
│
└── output/
```

---

## 🚀 ETL Workflow

Every exercise follows the standard ETL process:

### 1️⃣ Extract

- Read CSV files
- Read JSON files
- Read Parquet files

Example:

```python
df = spark.read.format("csv") \
    .option("header", "true") \
    .load("/samples/customers.csv")
```

---

### 2️⃣ Transform

Perform data cleaning and transformations:

- Inspect schema
- Display records
- Remove null values
- Replace missing values
- Filter invalid records
- Join datasets
- Perform aggregations

Example:

```python
df.show()
df.printSchema()

clean_df = df.dropna()

filtered_df = clean_df.filter(clean_df.age > 0)
```

---

### 3️⃣ Load

- Display final reports
- Save processed data
- Create reusable reporting datasets

---

## 📋 Hands-on Ingestion Tasks

Complete the following tasks:

1. Read a CSV file from the sample directory.
2. Inspect the schema using `show()` and `printSchema()`.
3. Identify missing values.
4. Clean data using `dropna()` or `fillna()`.
5. Filter invalid records.
6. Read JSON and Parquet sample files. :contentReference[oaicite:2]{index=2}

---

## 💼 Business Pipeline Exercises

Implement the following real-world scenarios:

1. Read sales data and calculate daily sales after cleaning null values.
2. Read customer data and calculate city-wise revenue.
3. Find repeat customers with more than two orders.
4. Find the highest spending customer in each city.
5. Build a final reporting table containing:
   - Customer Name
   - City
   - Total Spend
   - Order Count :contentReference[oaicite:3]{index=3}

---

## 🏆 Final Challenge

For every exercise:

- Write the SQL query.
- Convert the SQL query into PySpark.
- Compare the outputs.
- Combine all steps into a reusable ETL pipeline notebook. :contentReference[oaicite:4]{index=4}

---

## 🎓 Learning Outcomes

After completing this project, you will be able to:

- Build complete ETL pipelines using PySpark.
- Read data from multiple sources.
- Clean and validate datasets.
- Perform joins, filters, and aggregations.
- Translate SQL queries into PySpark transformations.
- Develop reusable data engineering workflows.

---

## 📖 Best Practice

For each exercise:

- ✅ Write the SQL solution first.
- ✅ Implement the equivalent PySpark solution.
- ✅ Validate both outputs.
- ✅ Optimize your PySpark transformations.
- ✅ Integrate the solution into a reusable ETL pipeline.

---

## 📌 Reference

This project is based on the **SQL to PySpark Phase 3 – Final ETL & Pipeline Practice Pack**, which focuses on practical ETL pipeline development using PySpark and Spark Playground sample datasets. :contentReference[oaicite:5]{index=5}

---

## 🤝 Contributing

Contributions and improvements are welcome. Feel free to fork the repository, create feature branches, and submit pull requests.

---

## 📜 License

This project is intended for educational and learning purposes.
