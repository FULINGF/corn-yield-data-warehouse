--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 18:36:59
--********************************************************************--
INSERT OVERWRITE TABLE ads_env_score PARTITION(dt)
SELECT 
    city,
    avg_temp,
    total_rainfall,
    avg_ph,
    (avg_temp - 10) / 10 * 0.4 + (total_rainfall / 100) * 0.3 + (avg_ph - 6) * 0.3 AS env_score,
    dt   
FROM dws_env_day_agg
WHERE dt IS NOT NULL;  