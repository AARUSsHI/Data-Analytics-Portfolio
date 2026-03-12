-- =====================================================
-- TOPIC - Window Functions - ROW_NUMBER() , RANK(), SUM()
-- =====================================================



-- =====================================================
-- First Order For Each Customer
-- =====================================================
SELECT *
FROM (
    SELECT o.order_id,
           c.customer_unique_id,
           o.order_purchase_timestamp,
           ROW_NUMBER() OVER (
               PARTITION BY c.customer_unique_id
               ORDER BY o.order_purchase_timestamp
           ) AS order_rank
    FROM orders o
    JOIN customers c
      ON c.customer_id = o.customer_id
) t
WHERE order_rank = 1;


-- =====================================================
-- Top 5 States By Revenue
-- =====================================================
SELECT customer_state,
       total_revenue AS revenue,
       RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM revenue_by_states
ORDER BY revenue_rank
LIMIT 5;


-- =====================================================
-- Running Revenue Over Time
-- =====================================================
select date(o.order_purchase_timestamp) as order_date,
       sum(p.payment_value) as daily_revenue,
       sum(sum(p.payment_value)) over(order by date(o.order_purchase_timestamp)) as running_revenue
from orders o
join payments p on o.order_id = p.order_id
group by date(o.order_purchase_timestamp)
order by order_date;


-- =====================================================
-- Monthly Revenue (Revenue Trend Analysis)
-- =====================================================
SELECT
DATE_TRUNC('month', order_purchase_timestamp) AS month,
SUM(payment_value) AS revenue
FROM payments p
JOIN orders o
ON p.order_id = o.order_id
GROUP BY month
ORDER BY month;