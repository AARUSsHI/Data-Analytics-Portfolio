
-- =====================================================
-- Project: Olist E-Commerce Analysis
-- Topic: SQL Aggregations & Grouping
-- =====================================================

-- =====================================================
-- Q1. Total Number of Orders
-- Objective:
-- Count all rows in the orders table to determine
-- the total number of orders placed.
-- =====================================================

SELECT COUNT(*) AS total_orders
FROM orders;



-- =====================================================
-- Q2. Number of Unique Customers
-- Objective:
-- Count distinct customer_id values to find
-- how many unique customers placed orders.
-- =====================================================

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM orders;



-- =====================================================
-- Q3. Orders per Status
-- Objective:
-- Group orders by order_status and count
-- how many orders fall under each status.
-- =====================================================

SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;



-- =====================================================
-- Q4. Count of Delivered Orders
-- Objective:
-- Filter orders where status = 'delivered'
-- and count how many such orders exist.
-- No GROUP BY required since we are
-- filtering for a single status.
-- =====================================================

SELECT COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'delivered';



-- =====================================================
-- Q5. Orders per Year
-- Objective:
-- Extract the year from order_purchase_timestamp
-- and count number of orders per year.
-- =====================================================

SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_year
ORDER BY order_year;



-- =====================================================
-- Q6. Top 5 Years with Most Orders
-- Objective:
-- Count orders per year, sort by total_orders
-- in descending order, and return the top 5.
-- =====================================================

SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_year
ORDER BY total_orders DESC
LIMIT 5;



-- =====================================================
-- Q7. Statuses with More Than 5000 Orders
-- Objective:
-- Use HAVING clause to filter grouped results.
-- HAVING is used instead of WHERE because
-- COUNT(*) is an aggregate function.
-- =====================================================

SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 5000
ORDER BY total_orders DESC;



-- =====================================================
-- Notes:
-- 1. WHERE filters rows BEFORE grouping.
-- 2. GROUP BY groups rows.
-- 3. HAVING filters AFTER aggregation.
-- 4. EXTRACT(YEAR FROM timestamp) pulls year dynamically.
-- =====================================================
