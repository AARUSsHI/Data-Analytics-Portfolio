-- ===========================================
-- CHANNEL CONVERTION INTO LEADS
-- ===========================================



-- ===========================================
-- Sales Cycle KPI
-- ===========================================


SELECT
    ROUND(AVG(c.won_date::date - m.first_contact_date::date),2) AS avg_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP(
        ORDER BY c.won_date::date - m.first_contact_date::date
    ) AS median_days,
    MIN(c.won_date::date - m.first_contact_date::date) AS min_days,
    MAX(c.won_date::date - m.first_contact_date::date) AS max_days
FROM closed_deals c
JOIN mqls m
  ON c.mql_id = m.mql_id
WHERE c.won_date::date >= m.first_contact_date::date;

-- "avg_days"	"median_days"	"min_days"	"max_days"
--   48.50	         14	            0	       427
