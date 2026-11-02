-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 05_monthly_sales.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Analyse monthly product sales revenue to identify:
-- 1. Highest revenue-generating months.
-- 2. Lowest revenue-generating months.
-- 3. Monthly sales trends.
--
-- TABLES USED:
-- olist_orders
-- olist_order_items
--
-- JOIN CONDITION:
-- olist_orders.order_id = olist_order_items.order_id


-- =====================================================
-- ANALYSIS 01:
-- MONTHLY PRODUCT SALES REVENUE
-- =====================================================

-- BUSINESS QUESTION:
-- Which months generated the highest product sales revenue?
--
-- METHODOLOGY:
-- 1. Join orders with order items using order_id.
-- 2. Extract the purchase month using DATE_TRUNC().
-- 3. Calculate monthly product revenue using SUM(price).
-- 4. Group the results by purchase month.
--
-- NOTE:
-- Revenue is calculated using product prices only.
-- Freight charges are excluded.

SELECT
    DATE_TRUNC('month', oo.order_purchase_timestamp) AS sales_month,
    SUM(oi.price) AS monthly_sales
FROM olist_order_items AS oi
INNER JOIN olist_orders AS oo
    ON oi.order_id = oo.order_id
GROUP BY DATE_TRUNC('month', oo.order_purchase_timestamp)
ORDER BY sales_month;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- DATE_TRUNC('month', order_purchase_timestamp):
-- Extracts the month and year from the purchase timestamp.
--
-- SUM(oi.price):
-- Calculates the total product revenue for each month.
--
-- GROUP BY:
-- Combines records belonging to the same month.
--
-- ORDER BY:
-- Displays the monthly results in chronological order.


-- =====================================================
-- RESULTS AND BUSINESS FINDINGS:
-- =====================================================

-- Highest revenue month:
-- November 2017
--
-- Highest monthly revenue:
-- R$ 1,010,271.37
--
-- Lowest revenue month:
-- December 2016
--
-- Lowest monthly revenue:
-- R$ 10.90
--
-- September 2018 recorded only R$ 145.00.
--
-- BUSINESS INSIGHTS:
-- Monthly product revenue generally increased throughout
-- 2017 and 2018.
--
-- November 2017 recorded the highest monthly revenue.
--
-- December 2016 and September 2018 recorded unusually
-- low revenue values, potentially due to incomplete
-- periods in the dataset.
--
-- DATA CONSIDERATION:
-- This analysis includes all order statuses.
-- Cancelled and unavailable orders may affect the
-- revenue interpretation.
--
-- The beginning and ending months may also be incomplete.
-- Further validation is required before treating these
-- figures as final recognised revenue.


-- =====================================================
-- END OF MONTHLY SALES ANALYSIS
-- =====================================================