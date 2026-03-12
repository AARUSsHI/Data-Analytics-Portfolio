-- -----------------------------------------------------------
-- Average payment value
-- -----------------------------------------------------------

SELECT AVG(payment_value)
FROM olist_order_payments_dataset;

-- -----------------------------------------------------------
-- Median payment value
-- -----------------------------------------------------------


SELECT percentile_cont(0.5)
WITHIN GROUP (ORDER BY payment_value)
FROM olist_order_payments_dataset;

-- -----------------------------------------------------------
-- Standard deviation
-- -----------------------------------------------------------


SELECT STDDEV(payment_value)
FROM olist_order_payments_dataset;



-- -----------------------------------------------------------
-- Revenue By State table generation SQL code
-- -----------------------------------------------------------
WITH payment_summary AS (
    SELECT order_id,
           SUM(payment_value) AS order_revenue
    FROM payments
    GROUP BY order_id
)

SELECT c.customer_state,
       SUM(ps.order_revenue) AS total_revenue,
       COUNT(DISTINCT o.order_id) AS total_orders
FROM payment_summary ps
JOIN orders o
ON ps.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- -----------------------------------------------------------
-- Category State Revenue table generation SQL code
-- -----------------------------------------------------------
SELECT c.customer_state,
       p.product_category_name,
       SUM(oi.price) AS category_revenue,
       COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY c.customer_state, p.product_category_name
ORDER BY category_revenue DESC;