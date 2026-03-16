-- ================================================================
-- SQL BUSINESS ANALYTICS
-- ================================================================


-- ================================================================
-- 1️⃣ Customer Lifetime Value (CLV)
-- ================================================================
SELECT
    c.customer_unique_id,
    SUM(p.payment_value) AS lifetime_value
FROM payments p
JOIN orders o
  ON p.order_id = o.order_id
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY lifetime_value DESC;


-- ================================================================
-- 2️⃣ Top customers by revenue
-- ================================================================
SELECT
    c.customer_unique_id,
    SUM(p.payment_value) AS revenue
FROM payments p
JOIN orders o
  ON p.order_id = o.order_id
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY revenue DESC
LIMIT 10;



-- ================================================================
-- 3️⃣ Revenue concentration
-- ================================================================
WITH customer_revenue AS (
    SELECT 
        c.customer_unique_id,
        SUM(p.payment_value) AS revenue
    FROM payments p 
    JOIN orders o 
      ON p.order_id = o.order_id 
    JOIN customers c 
      ON o.customer_id = c.customer_id 
    GROUP BY c.customer_unique_id
)
SELECT *,
    RANK() OVER(ORDER BY revenue DESC) AS revenue_rank
FROM customer_revenue;



-- ================================================================
-- 4️⃣ Customer purchase frequency
-- ================================================================
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC;
