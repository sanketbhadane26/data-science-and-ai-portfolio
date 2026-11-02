-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 09_state_revenue.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Analyse product revenue across Brazilian states
-- to identify the highest and lowest revenue-generating
-- states.
--
-- TABLES USED:
-- olist_customers
-- olist_orders
-- olist_order_items
--
-- JOIN CONDITIONS:
-- olist_customers.customer_id = olist_orders.customer_id
-- olist_orders.order_id = olist_order_items.order_id
--
-- SOURCE COLUMNS:
-- customer_state
-- price


-- =====================================================
-- ANALYSIS 01:
-- STATE-WISE PRODUCT REVENUE
-- =====================================================

-- BUSINESS QUESTION:
-- Which Brazilian states generate the highest
-- product sales revenue?
--
-- METHODOLOGY:
-- 1. Join customers with orders using customer_id.
-- 2. Join orders with order items using order_id.
-- 3. Group the results by customer_state.
-- 4. Calculate total product revenue using SUM(price).
-- 5. Sort the results in descending order.
--
-- NOTE:
-- Freight charges are excluded from this calculation.

SELECT
    oc.customer_state,
    SUM(ooi.price) AS state_revenue
FROM olist_customers AS oc
INNER JOIN olist_orders AS oo
    ON oc.customer_id = oo.customer_id
INNER JOIN olist_order_items AS ooi
    ON oo.order_id = ooi.order_id
GROUP BY oc.customer_state
ORDER BY state_revenue DESC;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- INNER JOIN:
-- Connects customer, order and order item information.
--
-- SUM(ooi.price):
-- Calculates the total product revenue for each state.
--
-- GROUP BY customer_state:
-- Groups orders according to the customer's state.
--
-- ORDER BY state_revenue DESC:
-- Displays the highest revenue-generating state first.


-- =====================================================
-- RESULTS AND BUSINESS FINDINGS:
-- =====================================================

-- TOP 3 REVENUE-GENERATING STATES:
--
-- 1. SP (São Paulo):
--    R$ 5,202,955.05
--
-- 2. RJ (Rio de Janeiro):
--    R$ 1,824,092.67
--
-- 3. MG (Minas Gerais):
--    R$ 1,585,308.03
--
-- LOWEST REVENUE-GENERATING STATE:
--
-- RR (Roraima):
-- R$ 7,829.43
--
-- BUSINESS INSIGHTS:
-- São Paulo generated the highest product revenue
-- among all Brazilian states.
--
-- Rio de Janeiro and Minas Gerais ranked second
-- and third respectively.
--
-- The top three states contributed approximately
-- 63.3% of total product revenue.
--
-- Revenue is concentrated in these three states.
--
-- DATA CONSIDERATION:
-- Revenue is calculated using product prices only.
-- Freight charges are excluded.
--
-- State revenue represents the state associated
-- with the customer record.


-- =====================================================
-- END OF STATE REVENUE ANALYSIS
-- =====================================================