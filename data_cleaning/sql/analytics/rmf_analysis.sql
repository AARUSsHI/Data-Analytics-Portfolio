-- ============================================
-- RFM ANALYSIS (CUSTOMER SEGMENTATION)
-- Dataset: Olist E-commerce
-- ============================================

-- GOAL:
-- Segment customers based on:
-- 1. Recency → How recently they purchased
-- 2. Frequency → How often they purchase
-- 3. Monetary → How much they spend

-- ============================================
-- STEP 1: CALCULATE RFM METRICS
-- ============================================

WITH rfm AS (
    SELECT
        c.customer_unique_id,

        -- RECENCY: Days since last purchase
        DATE '2018-10-20' - MAX(o.order_purchase_timestamp) AS recency,

        -- FREQUENCY: Number of orders per customer
        COUNT(DISTINCT o.order_id) AS frequency,

        -- MONETARY: Total spending per customer
        SUM(p.payment_value) AS monetary

    FROM orders o

    -- Join customers to map real users
    JOIN customers c
      ON o.customer_id = c.customer_id

    -- Join payments to get revenue
    JOIN payments p
      ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

-- ============================================
-- STEP 2: SEGMENT CUSTOMERS
-- ============================================

SELECT
    customer_unique_id,
    recency,
    frequency,
    monetary,

    -- CUSTOMER SEGMENTATION LOGIC
    CASE
        -- High value customers: recent, frequent, high spend
        WHEN recency < 40 AND frequency >= 3 AND monetary > 500 THEN 'High Value'

        -- At risk: purchased before but not recently
        WHEN recency BETWEEN 40 AND 100 AND frequency > 3 THEN 'At Risk'

        -- Lost customers: no activity for long time
        WHEN recency > 100 THEN 'Lost'

        -- New customers: recent but low frequency
        WHEN recency < 40 AND frequency <= 2 THEN 'New'

        -- Default group
        ELSE 'Regular'
    END AS customer_segment

FROM rfm;