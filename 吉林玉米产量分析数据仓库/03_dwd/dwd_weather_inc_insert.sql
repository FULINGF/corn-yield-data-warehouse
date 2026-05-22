--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-21 16:55:43
--********************************************************************--
 INSERT OVERWRITE TABLE dwd_weather_inc PARTITION(dt)
 SELECT 
 city,
 COALESCE(IF(avg_temp BETWEEN -40 AND 45, avg_temp,NULL ),
        LAG(IF(avg_temp BETWEEN -40 AND 45, avg_temp,NULL)) OVER (PARTITION BY city ORDER BY dt)) AS avg_temp,
 COALESCE(IF(max_temp BETWEEN -40 AND 45, max_temp,NULL ),
        LAG(IF(max_temp BETWEEN -40 AND 45, max_temp,NULL)) OVER (PARTITION BY city ORDER BY dt)) AS max_temp,
 COALESCE(IF(min_temp BETWEEN -40 AND 45, min_temp,NULL ),
        LAG(IF(min_temp BETWEEN -40 AND 45, min_temp,NULL)) OVER (PARTITION BY city ORDER BY dt)) AS min_temp,
 COALESCE(IF(rainfall >= 0,rainfall,NULL),0) AS rainfall,
 COALESCE(IF(humidity BETWEEN 0 AND 100,humidity,NULL),
        LAG(IF(humidity BETWEEN 0 AND 100,humidity,NULL)) OVER (PARTITION BY city ORDER BY dt)) AS humidity,
 COALESCE(IF(sun_hour BETWEEN 0 AND 24,sun_hour,NULL),
        LAG(IF(sun_hour BETWEEN 0 AND 24,sun_hour,NULL)) OVER (PARTITION BY city ORDER BY dt)) AS sun_hour,
 dt
 FROM ods_weather_day;               

