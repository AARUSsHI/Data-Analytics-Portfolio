
-- ================================================================
-- Top 10 customers by revenue
-- ================================================================


SELECT 
c.customer_unique_id,
SUM(payment_value) AS total_revenue 
FROM customers c 
JOIN orders o 
  ON o.customer_id = c.customer_id
JOIN payments p 
  ON o.order_id = p.order_id 
GROUP BY c.customer_unique_id
ORDER BY total_revenue DESC 
LIMIT 10;


-- ================================================================
-- Revenue per state
-- ================================================================


SELECT 
c.customer_state,
SUM(payment_value) AS total_revenue 
FROM customers c 
JOIN orders o 
  ON o.customer_id = c.customer_id
JOIN payments p 
  ON o.order_id = p.order_id 
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- ================================================================
-- Orders per month
-- ================================================================


SELECT
DATE_TRUNC('month', order_purchase_timestamp) AS order_month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;


-- ================================================================
-- Find customers who:
-- placed more than 3 orders
-- AND whose total spend is above average
-- ================================================================


WITH customer_metrics AS(
  SELECT
  c.customer_unique_id,
  COUNT(DISTINCT o.order_id) AS total_orders,
  SUM(p.payment_value) AS total_spent
  FROM customers c
  JOIN orders o 
    ON o.customer_id = c.customer_id
  JOIN payments p
    ON p.order_id = o.order_id
  GROUP BY c.customer_unique_id
)

SELECT *
FROM customer_metrics
WHERE total_spent > (
  SELECT AVG(total_spent) FROM customer_metrics
)
AND total_orders > 3
ORDER BY total_orders DESC;


-- ================================================================
-- Top 3 products per category by revenue
-- ================================================================


WITH product_revenue AS(
    SELECT
    pr.product_category_name,
    oi.product_id,
    SUM(oi.price + oi.freight_value) AS total_revenue
    FROM order_items oi
    JOIN products pr
      ON oi.product_id = pr.product_id
    GROUP BY pr.product_category_name, oi.product_id
),

ranked_products AS (
    SELECT
    product_category_name,
    product_id,
    total_revenue,
    RANK() OVER(
        PARTITION BY product_category_name
        ORDER BY total_revenue DESC
    ) AS rank
    FROM product_revenue
)

SELECT
product_category_name,
product_id,
total_revenue
FROM ranked_products
WHERE rank <= 3 
ORDER BY product_category_name, rank;


-- ================================================================
-- Customers who ordered in consecutive months
-- ================================================================


WITH customer_month AS(
  SELECT
  c.customer_unique_id,
  DATE_TRUNC('month', o.order_purchase_timestamp) as order_month
  FROM orders o
  JOIN customers c
    ON c.customer_id = o.customer_id
),

lagged_data AS(
  SELECT
  customer_unique_id,
  order_month,
  LAG(order_month) OVER(
    PARTITION BY customer_unique_id
    ORDER BY order_month
  ) AS prev_month
  FROM customer_month
)

SELECT DISTINCT
customer_unique_id,
prev_month,
order_month
FROM lagges_data
WHERE order_month = prev_month + INTERVAL '1 month';


