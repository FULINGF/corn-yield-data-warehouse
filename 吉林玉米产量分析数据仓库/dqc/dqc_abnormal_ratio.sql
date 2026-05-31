-- 检查异常值比例，超过阈值（3%）则告警

WITH result AS (
    -- 产量表
    SELECT
        'dwd_yield_inc' AS table_name,
        'mu_yield' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN mu_yield < 200 OR mu_yield > 1500 THEN 1 ELSE 0 END) AS abnormal_count,
        ROUND(SUM(CASE WHEN mu_yield < 200 OR mu_yield > 1500 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS abnormal_rate_percent
    FROM dwd_yield_inc

    UNION ALL

    -- 气象表（分区表，加 WHERE）
    SELECT
        'dwd_weather_inc' AS table_name,
        'avg_temp' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN avg_temp < -40 OR avg_temp > 45 THEN 1 ELSE 0 END) AS abnormal_count,
        ROUND(SUM(CASE WHEN avg_temp < -40 OR avg_temp > 45 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS abnormal_rate_percent
    FROM dwd_weather_inc
    WHERE dt = '${bizdate}'

    UNION ALL

    -- 土壤表（分区表，加 WHERE）
    SELECT
        'dwd_soil_inc' AS table_name,
        'ph_value' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN ph_value < 3 OR ph_value > 10 THEN 1 ELSE 0 END) AS abnormal_count,
        ROUND(SUM(CASE WHEN ph_value < 3 OR ph_value > 10 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS abnormal_rate_percent
    FROM dwd_soil_inc
    WHERE dt = '${bizdate}'
)
SELECT * FROM result
WHERE abnormal_rate_percent > 3.0;