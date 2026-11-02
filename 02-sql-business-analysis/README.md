# Olist E-Commerce Business Analysis

## Project Overview

This project analyses the **Brazilian E-Commerce Public Dataset by Olist** using PostgreSQL.

The objective is to explore e-commerce data, validate data quality, analyse revenue, understand customer purchasing behaviour, evaluate payment methods and identify business trends.

The project uses SQL queries to answer practical business questions and extract meaningful insights from relational data.

## Tools Used

- PostgreSQL
- pgAdmin 4
- Visual Studio Code
- Git
- GitHub

## Dataset

**Brazilian E-Commerce Public Dataset by Olist**

Source: [Kaggle Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The dataset contains information about customers, orders, products, sellers and payments.

## Database Overview

The PostgreSQL database is named `olist_ecommerce` and contains five tables.

| Table | Records | Description |
|---|---:|---|
| `olist_customers` | 99,441 | Customer information |
| `olist_orders` | 99,441 | Order details and timestamps |
| `olist_order_items` | 112,650 | Products, prices and freight charges |
| `olist_products` | 32,951 | Product details and categories |
| `olist_order_payments` | 103,886 | Payment methods, values and instalments |
| **Total** | **449,369** | |

## Database Schema

### 1. olist_customers

Contains customer information.

- `customer_id`
- `customer_unique_id`
- `customer_zip_code_prefix`
- `customer_city`
- `customer_state`

### 2. olist_products

Contains product information and dimensions.

- `product_id`
- `product_category_name`
- `product_name_length`
- `product_description_length`
- `product_photos_qty`
- `product_weight_g`
- `product_length_cm`
- `product_height_cm`
- `product_width_cm`

### 3. olist_order_items

Contains information about products included in orders, sellers, prices and freight charges.

- `order_id`
- `order_item_id`
- `product_id`
- `seller_id`
- `shipping_limit_date`
- `price`
- `freight_value`

### 4. olist_orders

Contains order information and important timestamps.

- `order_id`
- `customer_id`
- `order_status`
- `order_purchase_timestamp`
- `order_approved_at`
- `order_delivered_carrier_date`
- `order_delivered_customer_date`
- `order_estimated_delivery_date`

### 5. olist_order_payments

Contains payment information.

- `order_id`
- `payment_sequential`
- `payment_type`
- `payment_installments`
- `payment_value`

## Database Relationships

The tables are logically connected through common columns.

| Tables | Relationship column | Purpose |
|---|---|---|
| Customers → Orders | `customer_id` | Connect customers with their orders |
| Orders → Order Items | `order_id` | Identify products included in orders |
| Orders → Order Payments | `order_id` | Connect orders with payment records |
| Order Items → Products | `product_id` | Identify product details and categories |

### Why do we use JOINs?

**Customers and Orders:** Joining using `customer_id` helps identify which orders belong to each customer and analyse purchasing behaviour.

**Orders and Order Items:** Joining using `order_id` helps identify the products purchased in each order and calculate order-level sales.

**Orders and Payments:** Joining using `order_id` connects order information with payment records

**Order Items and Products:** Joining using `product_id` connects purchased items with their product categories and details.

These are logical relationships based on matching columns. Physical foreign-key constraints were not necessarily created in PostgreSQL.

## Project Structure

```text
02-sql-business-analysis/
│
├── README.md
│
├── sql/
│   ├── 00_database_setup.sql
│   ├── 01_data_validation.sql
│   ├── 02_revenue_analysis.sql
│   ├── 03_top_products.sql
│   ├── 04_category_analysis.sql
│   ├── 05_monthly_sales.sql
│   ├── 06_customer_analysis.sql
│   ├── 07_average_order_value.sql
│   ├── 08_payment_analysis.sql
│   ├── 09_state_revenue.sql
│   └── 10_delivery_analysis.sql
│
├── results/
│   └── business_insights.md
│
└── images/
    └── er_diagram.png
```

## SQL Analysis Performed

| File | Analysis |
|---|---|
| 00 | Database Setup |
| 01 | Data Validation |
| 02 | Revenue Analysis |
| 03 | Top 10 Best-Selling Products |
| 04 | Product Category Analysis |
| 05 | Monthly Sales Analysis |
| 06 | Customer Spending Analysis |
| 07 | Average Order Value |
| 08 | Payment Analysis |
| 09 | State-wise Revenue Analysis |
| 10 | Delivery Time Analysis |

## SQL Concepts Practised

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- COUNT(), SUM() and AVG()
- INNER JOIN
- Subqueries
- Date and timestamp operations
- DATE_TRUNC()
- EXTRACT()
- Data validation and aggregation

## Results and Business Insights

The detailed findings, query results and business interpretations are documented separately.

See **[Business Insights](Results/business_insights.md)**.

## Conclusion

This project demonstrates the practical application of PostgreSQL for analysing relational e-commerce data.

It strengthened SQL skills in data validation, joins, aggregation, subqueries, date calculations and business analysis.

The project also demonstrates how raw data can be transformed into meaningful information to support business decision-making.