
-- =============================================================
-- Project: Olist E-Commerce Analysis
-- Topic: Basic JOINs, Aggregation & Join Intuition Drills
-- =============================================================


-- =============================================================
-- Q1: Orders by Customer State
-- Objective:
-- Join orders with customers to calculate total orders per state.
-- =============================================================

SELECT c.customer_state,
       COUNT(o.order_id) AS total_orders
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;



-- =============================================================
-- Q2: Unique Customers per State
-- Objective:
-- Count distinct customers who placed orders in each state.
-- DISTINCT ensures we don't double-count repeat customers.
-- =============================================================

SELECT c.customer_state,
       COUNT(DISTINCT o.customer_id) AS unique_customers
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state;



-- =============================================================
-- Q3: States with More Than 5000 Orders
-- Objective:
-- Use HAVING to filter aggregated results (group-level filtering).
-- =============================================================

SELECT c.customer_state,
       COUNT(*) AS total_orders
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
HAVING COUNT(*) > 5000
ORDER BY total_orders DESC;



-- =============================================================
-- DRILL 1: INNER JOIN vs LEFT JOIN Comparison
-- Objective:
-- Compare row counts to understand join behavior.
-- If counts differ → missing matches exist.
-- =============================================================

-- INNER JOIN: Keeps only matching rows
SELECT COUNT(*) AS inner_join_count
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- LEFT JOIN: Keeps all rows from orders
SELECT COUNT(*) AS left_join_count
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;



-- =============================================================
-- DRILL 2: Identify Mismatches (Orders without Customers)
-- Objective:
-- Detect data integrity issues.
-- If this returns rows → unmatched foreign keys exist.
-- =============================================================

SELECT o.order_id
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;



-- =============================================================
-- DRILL 3: Reverse the Join
-- Objective:
-- Find customers who never placed an order.
-- Join direction matters in LEFT JOIN.
-- =============================================================

SELECT c.customer_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;



-- =============================================================
-- DRILL 4: One-to-Many Relationship Awareness
-- Objective:
-- Count number of orders per customer.
-- Demonstrates duplication after joins.
-- =============================================================

SELECT o.customer_id,
       COUNT(o.order_id) AS total_orders
FROM orders o
GROUP BY o.customer_id
ORDER BY total_orders DESC
LIMIT 10;



-- =============================================================
-- DRILL 5: JOIN + GROUP BY + ORDER BY + LIMIT
-- Objective:
-- Combine multiple SQL concepts together.
-- =============================================================

SELECT c.customer_state,
       COUNT(o.order_id) AS total_orders
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
LIMIT 5;



-- =============================================================
-- Notes:
-- 1. LEFT JOIN keeps all rows from the left table.
-- 2. INNER JOIN keeps only matching rows.
-- 3. WHERE filters rows before grouping.
-- 4. HAVING filters after GROUP BY.
-- 5. Join direction affects result set.
-- =============================================================
