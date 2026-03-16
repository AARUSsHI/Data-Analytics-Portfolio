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