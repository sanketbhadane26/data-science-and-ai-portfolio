-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 00_database_setup.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Document database setup and table structures.
-- Dataset: Brazilian E-Commerce Public Dataset by Olist.
-- Source: Kaggle
-- https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce


-- -----------------------------------------------------
-- STEP 1: CREATE DATABASE
-- -----------------------------------------------------

-- Run this separately while connected to another database
-- if the database does not already exist.

-- CREATE DATABASE olist_ecommerce;


-- -----------------------------------------------------
-- STEP 2: VERIFY CURRENT DATABASE
-- -----------------------------------------------------

SELECT current_database();


-- -----------------------------------------------------
-- STEP 3: CREATE TABLE STRUCTURES
-- -----------------------------------------------------

-- Table 1: Customers

CREATE TABLE IF NOT EXISTS olist_customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state VARCHAR(2)
);


-- Table 2: Orders

CREATE TABLE IF NOT EXISTS olist_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);


-- Table 3: Order Items

CREATE TABLE IF NOT EXISTS olist_order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);


-- Table 4: Products

CREATE TABLE IF NOT EXISTS olist_products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);


-- Table 5: Order Payments

CREATE TABLE IF NOT EXISTS olist_order_payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type VARCHAR(50),
    payment_installments INTEGER,
    payment_value NUMERIC(10,2)
);


-- -----------------------------------------------------
-- STEP 4: VERIFY TABLE RECORD COUNTS
-- -----------------------------------------------------

SELECT 'olist_customers' AS table_name,
       COUNT(*) AS total_records
FROM olist_customers

UNION ALL

SELECT 'olist_orders', COUNT(*)
FROM olist_orders

UNION ALL

SELECT 'olist_order_items', COUNT(*)
FROM olist_order_items

UNION ALL

SELECT 'olist_products', COUNT(*)
FROM olist_products

UNION ALL

SELECT 'olist_order_payments', COUNT(*)
FROM olist_order_payments;


-- -----------------------------------------------------
-- EXPECTED RECORD COUNTS
-- -----------------------------------------------------

-- olist_customers       : 99,441
-- olist_orders          : 99,441
-- olist_order_items     : 112,650
-- olist_products        : 32,951
-- olist_order_payments  : 103,886

-- TOTAL RECORDS         : 449,369

-- NOTE:
-- CREATE TABLE IF NOT EXISTS does not overwrite existing
-- tables. CSV data was imported separately using pgAdmin.