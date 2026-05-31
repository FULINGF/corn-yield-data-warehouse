-- 检查核心字段空值率，超过阈值（5%）则告警

WITH result AS (
    SELECT
        'ods_corn_yield' AS table_name,
        'mu_yield' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN mu_yield IS NULL THEN 1 ELSE 0 END) AS null_count,
        ROUND(SUM(CASE WHEN mu_yield IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS null_rate_percent
    FROM ods_corn_yield

    UNION ALL

    SELECT
        'ods_weather_day' AS table_name,
        'avg_temp' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN avg_temp IS NULL THEN 1 ELSE 0 END) AS null_count,
        ROUND(SUM(CASE WHEN avg_temp IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS null_rate_percent
    FROM ods_weather_day

    UNION ALL

    SELECT
        'ods_soil_monitor' AS table_name,
        'ph_value' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN ph_value IS NULL THEN 1 ELSE 0 END) AS null_count,
        ROUND(SUM(CASE WHEN ph_value IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS null_rate_percent
    FROM ods_soil_monitor

    UNION ALL

    SELECT
        'dwd_yield_inc' AS table_name,
        'mu_yield' AS column_name,
        COUNT(*) AS total_rows,
        SUM(CASE WHEN mu_yield IS NULL THEN 1 ELSE 0 END) AS null_count,
        ROUND(SUM(CASE WHEN mu_yield IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS null_rate_percent
    FROM dwd_yield_inc
)
SELECT * FROM result
WHERE null_rate_percent > 5.0;  -- DWD 层可单独设为 1.0%