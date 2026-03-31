 Zepto SQL Data Analysis
** Project Overview

This project analyzes product data from Zepto, a quick-commerce grocery delivery platform.
Using SQL in PostgreSQL, the dataset was explored, cleaned, and analyzed to extract meaningful business insights related to pricing, discounts, stock availability, and product categories.

This project demonstrates practical SQL skills used by Data Analysts.

** Objectives of the Analysis

The main goals of this project were:

Explore the dataset and understand product information
Clean the data by removing incorrect values
Analyze discount trends across products
Identify high-value and out-of-stock products
Estimate potential revenue by category
Evaluate product value using price-per-gram analysis
 Dataset Information

The dataset contains product-level information including:

SKU ID – Unique product identifier
Category – Product category
Name – Product name
MRP – Maximum retail price
Discount Percent – Discount offered
Available Quantity – Stock quantity available
Discount Selling Price – Price after discount
Weight in Grams – Product weight
Out of Stock – Product availability status
 **Key SQL Analysis Performed
 
1️⃣ Top 10 Products with Highest Discount

Identified products offering the highest discount percentage.

2️⃣ Expensive Products That Are Out of Stock

Found products with high MRP but currently unavailable.

3️⃣ Estimated Revenue by Category

Calculated potential revenue using:

Discount Price × Available Quantity

4️⃣ High MRP but Low Discount Products

Identified products where MRP > 500 but discount < 10%.

5️⃣ Categories with Highest Average Discount

Analyzed which product categories provide maximum discounts on average.

6️⃣ Best Value Products (Price per Gram)

Calculated price per gram to identify products offering the best value.

7️⃣ Product Segmentation by Weight

Products were categorized into:

Low Weight
Medium Weight
Bulk Products

8️⃣ Total Inventory Weight by Category

Calculated total inventory weight available in each category.

**Data Cleaning Steps
Removed products where MRP = 0
Converted price values from paise to rupees
Checked for NULL values in key columns

** Tools Used
SQL
PostgreSQL
pgAdmin4
GitHub
**Project Files

zepto-sql-data-analysis
│
├── zepto_analysis.sql
└── README.md

***Author

Raj Kumar Srivastva
Aspiring Data Analyst

