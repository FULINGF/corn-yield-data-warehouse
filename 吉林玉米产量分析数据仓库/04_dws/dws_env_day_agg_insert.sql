--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 13:11:31
--********************************************************************--
INSERT OVERWRITE TABLE dws_env_day_agg PARTITION(dt)
SELECT 
    w.city,
    AVG(w.avg_temp) AS avg_temp,
    MAX(w.max_temp) AS max_temp,
    MIN(w.min_temp) AS min_temp,
    SUM(w.rainfall) AS total_rainfall,
    AVG(s.soil_temp) AS avg_soil_temp,
    AVG(s.soil_humidity) AS avg_soil_humidity,
    AVG(s.ph_value) AS avg_ph,
    w.dt
FROM dwd_weather_inc w
LEFT JOIN dwd_soil_inc s ON w.city = s.city AND w.dt = s.dt
WHERE w.dt IS NOT NULL
GROUP BY w.city, w.dt;