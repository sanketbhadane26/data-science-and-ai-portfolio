-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 06_customer_analysis.sql
-- OBJECTIVE: Identify the top 10 customers by
--            total product spending.
-- =====================================================


-- BUSINESS QUESTION:
-- Who are the top 10 customers by total spending?


-- TABLES USED:
-- olist_customers
-- olist_orders
-- olist_order_items


-- JOIN CONDITIONS:
-- customers.customer_id = orders.customer_id
-- orders.order_id = order_items.order_id


-- ANALYSIS 01: TOP 10 CUSTOMERS BY SPENDING

SELECT
    oc.customer_unique_id,
    SUM(ooi.price) AS total_spending
FROM olist_customers AS oc
JOIN olist_orders AS oo
    ON oc.customer_id = oo.customer_id
JOIN olist_order_items AS ooi
    ON oo.order_id = ooi.order_id
GROUP BY oc.customer_unique_id
ORDER BY total_spending DESC
LIMIT 10;


-- KEY FINDINGS:
-- Highest customer spending: R$13,440.00
-- Second-highest customer spending: R$7,388.00
-- Difference: R$6,052.00


-- BUSINESS INSIGHT:
-- The highest-spending customer contributed
-- R$13,440 in product purchases.
--
-- Spending is calculated using product prices.
-- Freight charges are excluded.