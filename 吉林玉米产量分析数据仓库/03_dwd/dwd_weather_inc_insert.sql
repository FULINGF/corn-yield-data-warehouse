-- MaxCompute SQL
-- ============================================================
-- 描述：ODS → DWD，气象日数据清洗
-- 清洗规则：
--   avg_temp、max_temp、min_temp：-40~45℃，异常值用前向填充（LAG）
--   rainfall：≥0，异常值置 0
--   humidity：0~100，异常值用前向填充
--   sun_hour：0~24，异常值用前向填充
-- 分区：dt（STRING，yyyy-MM-dd）
-- ============================================================

INSERT OVERWRITE TABLE dwd_weather_inc PARTITION(dt)

SELECT
    city,
    COALESCE(
        IF(avg_temp BETWEEN -40 AND 45, avg_temp, NULL),
        LAG(IF(avg_temp BETWEEN -40 AND 45, avg_temp, NULL)) OVER w
    ) AS avg_temp,
    COALESCE(
        IF(max_temp BETWEEN -40 AND 45, max_temp, NULL),
        LAG(IF(max_temp BETWEEN -40 AND 45, max_temp, NULL)) OVER w
    ) AS max_temp,
    COALESCE(
        IF(min_temp BETWEEN -40 AND 45, min_temp, NULL),
        LAG(IF(min_temp BETWEEN -40 AND 45, min_temp, NULL)) OVER w
    ) AS min_temp,
    IF(rainfall >= 0, rainfall, 0) AS rainfall,
    COALESCE(
        IF(humidity BETWEEN 0 AND 100, humidity, NULL),
        LAG(IF(humidity BETWEEN 0 AND 100, humidity, NULL)) OVER w
    ) AS humidity,
    COALESCE(
        IF(sun_hour BETWEEN 0 AND 24, sun_hour, NULL),
        LAG(IF(sun_hour BETWEEN 0 AND 24, sun_hour, NULL)) OVER w
    ) AS sun_hour,
    dt
FROM ods_weather_day
WINDOW w AS (PARTITION BY city ORDER BY dt);