# SQL to PySpark – Phase 2 (Revised Bridge Pack)

## 📌 Overview

This project is designed to bridge the gap between basic SQL concepts and real-world PySpark DataFrame operations. It focuses on translating SQL queries into PySpark transformations while working with sample datasets.

The exercises cover filtering, joins, aggregations, sorting, and basic data cleaning using Apache Spark.

---

## 🎯 Objective

- Learn how SQL queries map to PySpark DataFrame APIs.
- Practice working with multiple datasets.
- Perform data cleaning before analysis.
- Solve real-world data engineering problems using PySpark.

---

## 📂 Dataset

The project uses two sample CSV files:

- `customers.csv`
- `orders.csv`

Load the datasets using:

```python
customers = spark.read.option("header", "true").csv("/samples/customers.csv")
orders = spark.read.option("header", "true").csv("/samples/orders.csv")
```

Display the data:

```python
customers.show()
orders.show()

customers.printSchema()
orders.printSchema()
```

---

## 🧹 Data Cleaning

Before solving the exercises, remove records with missing `customer_id`.

```python
customers = customers.dropna(subset=["customer_id"])
orders = orders.dropna(subset=["customer_id"])
```

---

## 📚 Learning Resources

Before starting the exercises, complete the following tutorials:

- Introduction to PySpark
- Filtering Data in PySpark

These tutorials provide the fundamentals required for this project.

---

## 📝 Exercises

For each exercise:

1. Write the SQL query.
2. Convert the SQL query into PySpark.
3. Execute both versions.
4. Compare the outputs.

### Exercise List

1. Total order amount for each customer
2. Top 3 customers by total spend
3. Customers with no orders
4. City-wise total revenue
5. Average order amount per customer
6. Customers with more than one order
7. Sort customers by total spend in descending order

---

## 🛠 Technologies Used

- Python
- Apache Spark
- PySpark
- SQL
- CSV Files

---

## 📁 Suggested Project Structure

```
SQL-to-PySpark-Phase2/
│
├── README.md
├── sql/
│   ├── exercise1.sql
│   ├── exercise2.sql
│   └── ...
│
├── pyspark/
│   ├── exercise1.py
│   ├── exercise2.py
│   └── ...
│
├── samples/
│   ├── customers.csv
│   └── orders.csv
│
└── output/
```

---

## 🚀 Expected Learning Outcomes

After completing this project, you will be able to:

- Read CSV files into Spark DataFrames.
- Clean datasets using PySpark.
- Perform joins between DataFrames.
- Apply filtering and aggregation operations.
- Translate SQL queries into PySpark transformations.
- Build confidence with real-world Spark data processing tasks.

---

## 📖 Practice Strategy

For every problem:

- ✅ Write the SQL solution.
- ✅ Convert it into PySpark.
- ✅ Execute both.
- ✅ Verify that the results match.

This approach helps strengthen the understanding of SQL-to-PySpark conversion.

---

## 📄 Reference

This project is based on the **SQL to PySpark – Phase 2 Revised Bridge Pack**, which focuses on practical SQL-to-PySpark transition exercises using Spark Playground sample datasets. :contentReference[oaicite:0]{index=0}
