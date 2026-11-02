-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 10_delivery_analysis.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Analyse average order delivery time.
--
-- BUSINESS QUESTION:
-- How long does it take for an order to reach
-- the customer after purchase?
--
-- TABLE USED:
-- olist_orders
--
-- SOURCE COLUMNS:
-- order_purchase_timestamp
-- order_delivered_customer_date
--
-- SQL CONCEPTS:
-- AVG()
-- Timestamp subtraction
-- EXTRACT(EPOCH FROM ...)
-- WHERE


-- =====================================================
-- ANALYSIS 01:
-- AVERAGE DELIVERY TIME AS AN INTERVAL
-- =====================================================

-- BUSINESS QUESTION:
-- What is the average time difference between
-- order purchase and customer delivery?
--
-- METHODOLOGY:
-- 1. Subtract the purchase timestamp from
--    the delivery timestamp.
-- 2. Calculate the average time interval using AVG().
-- 3. Exclude records with missing timestamps.

SELECT
    AVG(
        order_delivered_customer_date
        - order_purchase_timestamp
    ) AS average_delivery_time
FROM olist_orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- Timestamp subtraction:
-- Calculates the time interval between purchase
-- and customer delivery.
--
-- AVG():
-- Calculates the average delivery interval.
--
-- WHERE:
-- Excludes orders with missing purchase or
-- delivery timestamps.
--
-- The result is returned as a PostgreSQL INTERVAL.


-- =====================================================
-- ANALYSIS 02:
-- AVERAGE DELIVERY TIME IN DAYS
-- =====================================================

-- BUSINESS QUESTION:
-- What is the average delivery time in days?
--
-- METHODOLOGY:
-- 1. Subtract purchase timestamp from delivery timestamp.
-- 2. Convert the interval into seconds using EXTRACT().
-- 3. Divide by 86,400 to convert seconds into days.
-- 4. Calculate the average delivery time in days.
--
-- NOTE:
-- 86,400 seconds = 24 hours = 1 day.

SELECT
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM (
                order_delivered_customer_date
                - order_purchase_timestamp
            )) / 86400
        ),
        2
    ) AS average_delivery_days
FROM olist_orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- EXTRACT(EPOCH FROM interval):
-- Converts the time interval into seconds.
--
-- / 86400:
-- Converts seconds into days.
--
-- AVG():
-- Calculates the average delivery time across
-- all eligible orders.
--
-- ROUND(..., 2):
-- Rounds the result to two decimal places.
--
-- WHERE:
-- Excludes records with missing timestamps.


-- =====================================================
-- RESULT AND BUSINESS FINDING:
-- =====================================================

-- Average delivery time:
-- 12.56 days
--
-- BUSINESS INSIGHT:
-- Orders took approximately 12.56 calendar days
-- on average to reach customers after purchase.
--
-- This provides a baseline for evaluating
-- delivery performance.
--
-- DATA CONSIDERATION:
-- Only records with valid purchase and delivery
-- timestamps are included.
--
-- Delivery time is calculated in calendar days,
-- not business days.


-- =====================================================
-- END OF DELIVERY ANALYSIS
-- =====================================================