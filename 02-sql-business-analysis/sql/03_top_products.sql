-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 03_top_products.sql
-- OBJECTIVE: Identify the top 10 best-selling products
--            based on the number of units sold.
-- =====================================================


-- =====================================================
-- BUSINESS QUESTION:
-- Which 10 products have the highest sales volume?
--
-- SOURCE TABLE: olist_order_items
-- METRIC: Number of units sold
-- =====================================================

SELECT
    product_id,
    COUNT(product_id) AS total_units_sold
FROM olist_order_items
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 10;


-- =====================================================
-- KEY FINDINGS
-- =====================================================

-- Highest-selling product: 527 units
-- Second-highest-selling product: 488 units
-- Difference: 39 units


-- BUSINESS INSIGHT:
-- The leading product sold 39 more units than
-- the second-ranked product.
--
-- This analysis identifies the most frequently
-- purchased individual products.
--
-- NOTE:
-- product_id identifies individual products.
-- Each row in olist_order_items represents an
-- ordered product unit.