WITH customer_metrics AS(
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) as total_orders,
        SUM(p.payment_value) as total_spent
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