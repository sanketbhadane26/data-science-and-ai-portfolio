-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 01_data_validation.sql
-- OBJECTIVE: Validate data quality and explore
--            customer ordering behaviour.
-- =====================================================


-- =====================================================
-- DATA VALIDATION 01: DUPLICATE ORDER ID CHECK
-- TABLE: olist_orders
-- OBJECTIVE: Identify duplicate order IDs.
-- =====================================================

SELECT
    order_id,
    COUNT(order_id) AS order_count
FROM olist_orders
GROUP BY order_id
HAVING COUNT(order_id) > 1;


-- RESULT:
-- No duplicate order IDs were found.


-- =====================================================
-- DATA VALIDATION 02: NULL VALUE CHECK
-- TABLE: olist_orders
-- OBJECTIVE: Check missing values in important columns.
-- =====================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS non_null_order_ids,
    COUNT(customer_id) AS non_null_customer_ids,
    COUNT(order_status) AS non_null_order_status
FROM olist_orders;


-- RESULT:
-- Total rows: 99,441
-- Non-NULL order IDs: 99,441
-- Non-NULL customer IDs: 99,441
-- Non-NULL order statuses: 99,441
-- No NULL values found in these three columns.


-- =====================================================
-- CUSTOMER EXPLORATION 01:
-- ORDERS PER CUSTOMER ID
-- OBJECTIVE: Check whether customer_id appears
--            in multiple orders.
-- =====================================================

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM olist_orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


-- RESULT:
-- No repeated customer_id values were found.
-- This is expected because customer_id identifies
-- the customer record associated with an order.


-- =====================================================
-- CUSTOMER EXPLORATION 02:
-- REPEAT PURCHASE ANALYSIS
-- OBJECTIVE: Identify customers who placed multiple
--            orders using customer_unique_id.
-- =====================================================

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM olist_customers AS c
JOIN olist_orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;


-- RESULT:
-- The highest number of orders placed by one
-- customer was 17.


-- BUSINESS FINDING:
-- customer_unique_id identifies the same actual
-- customer across multiple customer records.
-- Repeat purchases were identified using this column.