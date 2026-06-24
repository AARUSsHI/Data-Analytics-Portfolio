
-- ============================================
-- Master Table Query
-- ============================================

SELECT
    q.*,
    CASE
        WHEN c.mql_id IS NOT NULL THEN 1
        ELSE 0
    END AS converted,

    c.business_segment,
    c.lead_type,
    c.lead_behaviour_profie,
    c.business_type

FROM mqls q

LEFT JOIN closed_deals c
ON q.mql_id = c.mql_id;

-- ============================================
-- Overall Conversion Rate
-- ============================================

SELECT
    ROUND(
        SUM(converted) * 100.0/ COUNT(*), 2
    ) AS converted_rate
FROM master_table;

-- ==> 10.53

-- ============================================
-- Convertion By Origin
-- ============================================

SELECT origin,
    COUNT(*) AS total_leads,
    SUM(converted) AS converted_leads,
    ROUND(
        SUM(converted) * 100.0/ COUNT(*), 2
    ) AS converted_rate
FROM master_table;
GROUP BY origin
ORDER BY converted_rate DESC;

-- ==>
--  "origin"	"total_leads"	"converted_leads"	"converted_rate"
-- "[null]"	60	14	23.33
-- "unknown"	1099	179	16.29
-- "paid_search"	1586	195	12.30
-- "organic_search"	2296	271	11.80
-- "direct_traffic"	499	56	11.22
-- "referral"	284	24	8.45
-- "social"	1350	75	5.56
-- "display"	118	6	5.08
-- "other_publicities"	65	3	4.62
-- "email"	493	15	3.04
-- "other"	150	4	2.67

-- ============================================
-- Landing Page Analyssis
-- ============================================

SELECT 
    landing_page_id,
    COUNT(*) AS leads,
    SUM(converted) AS deals,
    ROUND(
        SUM(converted) * 100.0 / COUNT(*), 2
    ) AS converted_rate
FROM master_table
GROUP BY landing_page_id
HAVING COUNT(*) >= 20
ORDER BY converted_rate DESC;
