-- =================================================
-- AQUISITION CHANNELING PROFILING
-- =================================================



-- =================================================
-- Business Segment Aquisition Profilin Based On Origin
-- =================================================


SELECT
    origin,
    business_segment,
    COUNT(*) AS deals
FROM master_table
GROUP BY 
    origin,
    business_segment
ORDER BY deals DESC;

-- "origin"         "business_segment"	         "deals"
-- "organic_search"	"home_decor"	                44
-- "organic_search"	"car_accessories"	            26
-- "paid_search"	"health_beauty"	                26
-- "organic_search"	"health_beauty"	                21
-- "organic_search"	"audio_video_electronics"	    21
-- "paid_search"	"car_accessories"	            20
-- "paid_search"	"home_decor"	                20
-- "unknown"	    "health_beauty"	                20
-- "paid_search"	"household_utilities"	        19


-- =================================================
-- Lead Type Profiling Based On Origin
-- =================================================


SELECT
    origin,
    lead_type,
    COUNT(*) AS deals
FROM master_table
GROUP BY 
    origin,
    lead_type
ORDER BY origin DESC;

-- "origin"	        "lead_type"	    "deals"
-- "organic_search"	"online_medium"	  105
-- "paid_search"	"online_medium"	  78
-- "unknown"	    "online_medium"	  76
-- "organic_search"	"online_big"	  47
-- "organic_search"	"industry"	      42
-- "paid_search"	"industry"	      32
-- "organic_search"	"offline"	      30


-- =================================================
-- Business Type Profiling Based On Origin
-- =================================================


SELECT
    origin,
    business_type,
    COUNT(*) AS deals
FROM master_table
GROUP BY 
    origin,
    business_type
ORDER BY origin DESC;

-- "origin"	        "business_type"	"deals"
-- "organic_search"	"reseller"	      182
-- "paid_search"	"reseller"	      135
-- "unknown"	    "reseller"	      126
-- "organic_search"	"manufacturer"	  84
-- "social"	        "reseller"	      57
-- "paid_search"	"manufacturer"	  57
-- "unknown"	    "manufacturer"	  51


-- =================================================
-- lead behaviour Profile patterns Based On Origin
-- =================================================


SELECT
    origin,
    lead_behaviour_profile,
    COUNT(*) AS deals
FROM master_table
GROUP BY 
    origin,
    lead_behaviour_profile
ORDER BY origin DESC;

-- "origin"	        "lead_behaviour_profile"	"deals"
-- "organic_search"	    "cat"	                  130
-- "paid_search"	    "cat"	                  94
-- "unknown"	        "cat"	                  88
-- "organic_search" 	"eagle"	                  38
-- "paid_search"	    "eagle"	                  34 
-- "social"	            "cat"	                  31
-- "direct_traffic" 	"cat"	                  26
-- "organic_search"	    "wolf"	                  26


-- =================================================
-- Lead Convertion To Customer
-- =================================================


SELECT
    origin,
    ROUND(AVG(won_date::date - first_contact_date::date),2) AS avg_time_to_convert,
    MIN(won_date::date - first_contact_date::date) AS fastest,
    MAX(won_date::date - first_contact_date::date) AS slowest,
    COUNT(*) AS deals
FROM closed_deals c
JOIN mqls m
  ON c.mql_id = m.mql_id
GROUP BY origin
ORDER BY avg_time_to_convert;

