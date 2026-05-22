--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 15:31:49
--********************************************************************--
INSERT OVERWRITE TABLE ads_yield_yoy
SELECT 
    year,
    city,
    total_yield,
    LAG(total_yield, 1) OVER(PARTITION BY city ORDER BY year) AS prev_year_yield,
    (total_yield - LAG(total_yield, 1) OVER(PARTITION BY city ORDER BY year)) / LAG(total_yield, 1) OVER(PARTITION BY city ORDER BY year) AS yoy_growth
FROM (
    SELECT 
        stat_year AS year,
        city,
        SUM(total_yield_ton) AS total_yield
    FROM dwd_yield_inc
    GROUP BY stat_year, city
) t;