-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 02_revenue_analysis.sql
-- OBJECTIVE: Analyse product revenue, freight charges
--            and average product price.
-- =====================================================


-- =====================================================
-- BUSINESS QUESTION 01:
-- WHAT IS THE TOTAL PRODUCT SALES REVENUE?
-- TABLE: olist_order_items
-- COLUMN: price
-- =====================================================

SELECT
    SUM(price) AS total_revenue
FROM olist_order_items;


-- RESULT:
-- R$ 13,591,643.70

-- BUSINESS INSIGHT:
-- Olist generated approximately R$13.59 million
-- in product sales revenue across the dataset.


-- =====================================================
-- BUSINESS QUESTION 02:
-- WHAT ARE THE TOTAL FREIGHT CHARGES?
-- TABLE: olist_order_items
-- COLUMN: freight_value
-- =====================================================

SELECT
    SUM(freight_value) AS total_freight_value
FROM olist_order_items;


-- RESULT:
-- R$ 2,251,909.54

-- BUSINESS INSIGHT:
-- Olist charged approximately R$2.25 million
-- in freight across all order items.


-- =====================================================
-- BUSINESS QUESTION 03:
-- WHAT IS THE AVERAGE PRODUCT PRICE PER ITEM?
-- TABLE: olist_order_items
-- COLUMN: price
-- =====================================================

SELECT
    AVG(price) AS average_price_per_item
FROM olist_order_items;


-- RESULT:
-- R$ 120.65

-- BUSINESS INSIGHT:
-- The average price per ordered item was
-- approximately R$120.65.


-- =====================================================
-- END OF REVENUE ANALYSIS
-- =====================================================

-- NOTE:
-- Product revenue and freight charges are calculated
-- separately to avoid mixing the two metrics.
--
-- payment_value from olist_order_payments is not used
-- as a substitute for product revenue.