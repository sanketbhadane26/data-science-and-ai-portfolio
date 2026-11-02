-- =====================================================
-- PROJECT 2: OLIST E-COMMERCE BUSINESS ANALYSIS
-- FILE: 08_payment_analysis.sql
-- DATABASE: olist_ecommerce
-- DBMS: PostgreSQL
-- =====================================================

-- OBJECTIVE:
-- Analyse customer payment behaviour based on:
-- 1. Payment method distribution.
-- 2. Total payment value by payment method.
-- 3. Payment instalment distribution.
--
-- TABLE USED:
-- olist_order_payments
--
-- IMPORTANT COLUMNS:
-- payment_type
-- payment_value
-- payment_installments
-- order_id


-- =====================================================
-- ANALYSIS 01:
-- PAYMENT METHOD DISTRIBUTION
-- =====================================================

-- BUSINESS QUESTION:
-- Which payment methods are used most frequently?
--
-- METHODOLOGY:
-- 1. Group payment records by payment_type.
-- 2. Count the number of payment records for each method.
-- 3. Sort the results in descending order.

SELECT
    payment_type,
    COUNT(*) AS total_payments
FROM olist_order_payments
GROUP BY payment_type
ORDER BY total_payments DESC;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- COUNT(*) counts the payment records in each group.
--
-- GROUP BY payment_type:
-- Combines records having the same payment method.
--
-- ORDER BY total_payments DESC:
-- Displays the most frequently used payment methods first.


-- =====================================================
-- RESULTS:
-- =====================================================

-- Credit card: 76,795
-- Boleto: 19,784
-- Voucher: 5,775
-- Debit card: 1,529
-- Not defined: 3
--
-- BUSINESS INSIGHT:
-- Credit cards are the most frequently recorded
-- payment method, followed by boleto.


-- =====================================================
-- ANALYSIS 02:
-- TOTAL PAYMENT VALUE BY PAYMENT METHOD
-- =====================================================

-- BUSINESS QUESTION:
-- How much total payment value is recorded
-- through each payment method?
--
-- METHODOLOGY:
-- 1. Group payment records by payment_type.
-- 2. Calculate the total payment value using SUM().
-- 3. Sort the results in descending order.
--
-- NOTE:
-- payment_value is used instead of product price
-- because this analysis focuses on recorded payments.

SELECT
    payment_type,
    SUM(payment_value) AS total_payment_value
FROM olist_order_payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- SUM(payment_value):
-- Calculates the total recorded payment value
-- for each payment method.
--
-- GROUP BY payment_type:
-- Separates payment values by payment method.
--
-- ORDER BY:
-- Displays the highest payment value first.


-- =====================================================
-- RESULTS:
-- =====================================================

-- Credit card: R$ 12,542,084.19
-- Boleto: R$ 2,869,361.27
-- Voucher: R$ 379,436.87
-- Debit card: R$ 217,989.79
-- Not defined: R$ 0.00
--
-- Total payment value: R$ 16,008,872.12
--
-- BUSINESS INSIGHTS:
-- Credit cards account for approximately 78.34%
-- of the total recorded payment value.
--
-- Boleto is the second-largest payment method
-- by total payment value.
--
-- Credit cards dominate both payment frequency
-- and total recorded payment value.


-- =====================================================
-- ANALYSIS 03:
-- PAYMENT INSTALMENT DISTRIBUTION
-- =====================================================

-- BUSINESS QUESTION:
-- How many payment records exist for each
-- payment instalment value?
--
-- METHODOLOGY:
-- 1. Group records by payment_installments.
-- 2. Count the number of payment records
--    in each instalment group.
-- 3. Sort the results in ascending order.

SELECT
    payment_installments,
    COUNT(*) AS total_payments
FROM olist_order_payments
GROUP BY payment_installments
ORDER BY payment_installments;


-- =====================================================
-- INTERPRETATION:
-- =====================================================

-- payment_installments:
-- Represents the number of instalments associated
-- with a payment record.
--
-- COUNT(*):
-- Counts how many payment records belong
-- to each instalment group.
--
-- GROUP BY:
-- Combines payment records having the same
-- instalment count.
--
-- ORDER BY:
-- Displays the instalment counts in ascending order.


-- =====================================================
-- KEY RESULTS:
-- =====================================================

-- One instalment: 52,546 payment records.
-- Two instalments: 12,413 payment records.
-- Three instalments: 10,461 payment records.
-- Four instalments: 7,098 payment records.
-- Ten instalments: 5,328 payment records.
--
-- BUSINESS INSIGHTS:
-- One-instalment payments are the most common.
--
-- The dataset also contains payment records
-- with longer instalment plans, extending up
-- to 24 instalments.
--
-- DATA CONSIDERATION:
-- These figures represent payment records
-- grouped by instalment count.
-- They do not represent the number of individual
-- instalments actually paid.


-- =====================================================
-- END OF PAYMENT ANALYSIS
-- =====================================================