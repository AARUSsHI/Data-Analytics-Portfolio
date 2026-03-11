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