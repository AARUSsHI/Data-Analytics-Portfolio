-- ================================================================
-- COHORT
-- ================================================================




-- ================================================================
-- First Purchase 
-- ================================================================


SELECT
    c.customer_unique_id,
    DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS cohort_month
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id;


-- ================================================================
-- Customer Acquisition Month With Their Subsequent Activity Months
-- ================================================================


WITH cohort AS(
    SELECT
        c.customer_unique_id,
        DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS cohort_month
    FROM orders o
    JOIN customers c
       ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    c.customer_unique_id,
    cohort.cohort_month,
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month
FROM orders o
JOIN customers c
   ON o.customer_id = c.customer_id
JOIN cohort
   ON c.customer_unique_id = cohort.customer_unique_id;


-- ================================================================
-- Retention
-- ================================================================


SELECT
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_unique_id) AS active_customers
FROM cohort_data
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;


-- ================================================================
-- Month Difference
-- ================================================================


WITH cohort AS (
    SELECT 
        c.customer_unique_id, 
        DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS cohort_month
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),

cohort_data AS (
    SELECT 
        c.customer_unique_id, 
        cohort.cohort_month, 
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,

        (EXTRACT(YEAR FROM DATE_TRUNC('month', o.order_purchase_timestamp)) - 
         EXTRACT(YEAR FROM cohort.cohort_month)) * 12 +

        (EXTRACT(MONTH FROM DATE_TRUNC('month', o.order_purchase_timestamp)) - 
         EXTRACT(MONTH FROM cohort.cohort_month)) AS month_number

    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN cohort
        ON c.customer_unique_id = cohort.customer_unique_id
)

SELECT 
    cohort_month, 
    month_number, 
    COUNT(DISTINCT customer_unique_id) AS active_customers
FROM cohort_data
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;