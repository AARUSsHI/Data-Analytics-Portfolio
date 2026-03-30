-- ================================================================
-- FUNNEL ANALYSIS
-- ================================================================

-- ================================================================
-- Order Distribution By Status
-- ================================================================


SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;


-- ================================================================
-- Percentage Distribution
-- ================================================================


WITH status_count AS (
    SELECT order_status, COUNT(*) AS total
    FROM orders
    GROUP BY order_status
)
SELECT 
    order_status,
    total,
    ROUND(total * 1.0 / SUM(total) OVER (), 2) AS percentage
FROM status_count;


-- ================================================================
-- Delivery Success Rate
-- ================================================================


SELECT
    COUNT(*) FILTER (WHERE order_status = 'delivered') AS delivered_orders,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) FILTER (WHERE order_status = 'delivered') * 100.0 / COUNT(*),
        2
    ) AS delivery_rate_percentage
FROM orders;
