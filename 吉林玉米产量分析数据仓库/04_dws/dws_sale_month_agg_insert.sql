--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 13:57:42
--********************************************************************--
INSERT OVERWRITE TABLE dws_sale_month_agg PARTITION(year_month)
SELECT 
    city,
    AVG(price_per_ton) AS avg_price,
    SUM(sale_ton_num) AS total_sale_ton,
    SUBSTR(dt, 1, 7) AS year_month
FROM dwd_sale_inc
WHERE dt IS NOT NULL   -- 避免全表扫描警告
GROUP BY city, SUBSTR(dt, 1, 7);
