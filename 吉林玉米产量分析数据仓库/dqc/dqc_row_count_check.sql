-- 检查每日数据量相比 7 日均值的波动，超过±50% 则告警

WITH daily_counts AS (
    SELECT dt, COUNT(*) AS row_count
    FROM dwd_weather_inc
    WHERE dt >= TO_CHAR(DATEADD(TO_DATE('2026-05-30', 'yyyy-MM-dd'), -7, 'dd'), 'yyyy-MM-dd')
    GROUP BY dt
),
avg_7d AS (
    SELECT AVG(row_count) AS avg_count FROM daily_counts
),
result AS (
    SELECT
        'dwd_weather_inc' AS table_name,
        '2026-05-30' AS check_date,
        (SELECT row_count FROM daily_counts WHERE dt = '2026-05-30') AS today_count,
        (SELECT avg_count FROM avg_7d) AS avg_7d_count,
        ROUND(
            ABS((SELECT row_count FROM daily_counts WHERE dt = '2026-05-30') - (SELECT avg_count FROM avg_7d))
            / (SELECT avg_count FROM avg_7d) * 100, 2
        ) AS fluctuation_percent
    FROM (SELECT 1) t
)
SELECT * FROM result
WHERE fluctuation_percent > 50.0;