--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-21 20:04:44
--********************************************************************--
INSERT OVERWRITE TABLE dwd_soil_inc PARTITION(dt)
SELECT 
    city,
    COALESCE(IF(soil_temp BETWEEN -20 AND 40, soil_temp, NULL), 
             LAG(IF(soil_temp BETWEEN -20 AND 40, soil_temp, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS soil_temp,
    COALESCE(IF(soil_humidity BETWEEN 0 AND 100, soil_humidity, NULL), 
             LAG(IF(soil_humidity BETWEEN 0 AND 100, soil_humidity, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS soil_humidity,
    COALESCE(IF(ph_value BETWEEN 3 AND 10, ph_value, NULL), 
             LAG(IF(ph_value BETWEEN 3 AND 10, ph_value, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS ph_value,
    COALESCE(IF(nitrogen BETWEEN 0 AND 200, nitrogen, NULL), 
             LAG(IF(nitrogen BETWEEN 0 AND 200, nitrogen, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS nitrogen,
    COALESCE(IF(phosphorus BETWEEN 0 AND 200, phosphorus, NULL), 
             LAG(IF(phosphorus BETWEEN 0 AND 200, phosphorus, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS phosphorus,
    COALESCE(IF(potassium BETWEEN 0 AND 200, potassium, NULL), 
             LAG(IF(potassium BETWEEN 0 AND 200, potassium, NULL)) OVER(PARTITION BY city ORDER BY dt)) AS potassium,
    dt
FROM ods_soil_monitor;