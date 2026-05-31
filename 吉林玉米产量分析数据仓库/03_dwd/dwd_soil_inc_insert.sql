-- MaxCompute SQL
-- ============================================================
-- 描述：ODS → DWD，土壤监测数据清洗
-- 清洗规则：
--   soil_temp：-20~40℃，异常值用前向填充
--   soil_humidity：0~100，异常值用前向填充
--   ph_value：3~10，异常值用前向填充
--   nitrogen、phosphorus、potassium：0~200，异常值用前向填充
-- 分区：dt（STRING，yyyy-MM-dd）
-- ============================================================

INSERT OVERWRITE TABLE dwd_soil_inc PARTITION(dt)

SELECT
    city,
    COALESCE(
        IF(soil_temp BETWEEN -20 AND 40, soil_temp, NULL),
        LAG(IF(soil_temp BETWEEN -20 AND 40, soil_temp, NULL)) OVER w
    ) AS soil_temp,
    COALESCE(
        IF(soil_humidity BETWEEN 0 AND 100, soil_humidity, NULL),
        LAG(IF(soil_humidity BETWEEN 0 AND 100, soil_humidity, NULL)) OVER w
    ) AS soil_humidity,
    COALESCE(
        IF(ph_value BETWEEN 3 AND 10, ph_value, NULL),
        LAG(IF(ph_value BETWEEN 3 AND 10, ph_value, NULL)) OVER w
    ) AS ph_value,
    COALESCE(
        IF(nitrogen BETWEEN 0 AND 200, nitrogen, NULL),
        LAG(IF(nitrogen BETWEEN 0 AND 200, nitrogen, NULL)) OVER w
    ) AS nitrogen,
    COALESCE(
        IF(phosphorus BETWEEN 0 AND 200, phosphorus, NULL),
        LAG(IF(phosphorus BETWEEN 0 AND 200, phosphorus, NULL)) OVER w
    ) AS phosphorus,
    COALESCE(
        IF(potassium BETWEEN 0 AND 200, potassium, NULL),
        LAG(IF(potassium BETWEEN 0 AND 200, potassium, NULL)) OVER w
    ) AS potassium,
    dt
FROM ods_soil_monitor
WINDOW w AS (PARTITION BY city ORDER BY dt);