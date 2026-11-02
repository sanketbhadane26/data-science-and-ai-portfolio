-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 07_average_order_value.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Calculate the Average Order Value (AOV).
--
-- BUSINESS QUESTION:
-- What is the average product value of an order?
--
-- TABLE USED:
-- olist_order_items
--
-- SOURCE COLUMN:
-- price
--
-- SQL CONCEPTS:
-- SUM()
-- AVG()
-- GROUP BY
-- SUBQUERY


-- =====================================================
-- ANALYSIS 01:
-- AVERAGE ORDER VALUE (AOV)
-- =====================================================

-- METHODOLOGY:
-- 1. Calculate the total product price for each order.
-- 2. Group the records using order_id.
-- 3. Calculate the average of all order values.
--
-- NOTE:
-- Freight charges are excluded from this calculation.

SELECT
    ROUND(AVG(order_value), 2) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price) AS order_value
    FROM olist_order_items
    GROUP BY order_id
) AS order_totals;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- INNER QUERY:
-- SUM(price) calculates the total product value
-- for each individual order.
--
-- GROUP BY order_id:
-- Combines all items belonging to the same order.
--
-- OUTER QUERY:
-- AVG(order_value) calculates the average of
-- the individual order totals.
--
-- SUBQUERY:
-- The inner query produces one total value per order.
-- The outer query calculates the average of those values.


-- =====================================================
-- RESULT AND BUSINESS FINDING:
-- =====================================================

-- Average Order Value:
-- R$ 137.75
--
-- BUSINESS INSIGHT:
-- The average order generated approximately
-- R$ 137.75 in product revenue.
--
-- DATA CONSIDERATION:
-- This is product-only Average Order Value.
-- Freight charges are excluded.


-- =====================================================
-- END OF AVERAGE ORDER VALUE ANALYSIS
-- =====================================================