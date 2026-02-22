-- ================================================
-- SQL Fundamentals: SELECT, WHERE, ORDER BY, LIMIT
-- Dataset: orders
-- ================================================


-- Q1: Show all columns from orders (ONLY for initial exploration)
SELECT *
FROM orders;


-- Q2: Show specific columns: order_id, order_status, order_purchase_timestamp
SELECT order_id, order_status, order_purchase_timestamp
FROM orders;


-- Q3: Show only delivered orders
SELECT order_id, order_status
FROM orders
WHERE order_status = 'delivered';


-- Q4: Show orders placed after January 1, 2018
SELECT order_id, order_purchase_timestamp
FROM orders
WHERE order_purchase_timestamp > '2018-01-01';


-- Q5: Show canceled or unavailable orders
SELECT order_id, order_status
FROM orders
WHERE order_status IN ('canceled', 'unavailable');


-- Q6: Fetch the 10 most recent orders to inspect latest activity
SELECT order_id, order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp DESC
LIMIT 10;


-- Q7: Show unique order statuses (understand category distribution)
SELECT DISTINCT order_status
FROM orders;


-- Q8: Show orders where purchase timestamp is NULL (data quality check)
SELECT *
FROM orders
WHERE order_purchase_timestamp IS NULL;