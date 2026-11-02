-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 04_category_analysis.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Analyse product category performance based on:
-- 1. Number of units sold.
-- 2. Revenue generated.
--
-- TABLES USED:
-- olist_order_items
-- olist_products
--
-- JOIN CONDITION:
-- olist_order_items.product_id = olist_products.product_id


-- =====================================================
-- ANALYSIS 01:
-- TOP 10 PRODUCT CATEGORIES BY UNITS SOLD
-- =====================================================

-- BUSINESS QUESTION:
-- Which product categories have the highest
-- number of units sold?

SELECT
    p.product_category_name,
    COUNT(o.product_id) AS total_units_sold
FROM olist_order_items AS o
INNER JOIN olist_products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_units_sold DESC
LIMIT 10;


-- INTERPRETATION:
-- Counts ordered product units belonging to each category.
-- A product can be sold multiple times.
--
-- RESULT:
-- Record the top 10 category names and their
-- respective unit counts after executing the query.


-- =====================================================
-- ANALYSIS 02:
-- TOP 10 PRODUCT CATEGORIES BY REVENUE
-- =====================================================

-- BUSINESS QUESTION:
-- Which product categories generate the highest revenue?

SELECT
    p.product_category_name,
    SUM(o.price) AS total_revenue
FROM olist_order_items AS o
INNER JOIN olist_products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- INTERPRETATION:
-- Calculates total product sales revenue for each category.
-- Revenue is calculated using the product price column.
-- Freight charges are excluded from this calculation.
--
-- RESULT:
-- Record the top 10 category names and their
-- respective revenue after executing the query.


-- =====================================================
-- END OF CATEGORY ANALYSIS
-- =====================================================

-- BUSINESS ANALYSIS NOTE:
-- Units sold and revenue are different metrics.
--
-- A category may sell a large number of units
-- but generate comparatively lower revenue.
--
-- Comparing both analyses helps identify categories
-- that perform well in sales volume and revenue.