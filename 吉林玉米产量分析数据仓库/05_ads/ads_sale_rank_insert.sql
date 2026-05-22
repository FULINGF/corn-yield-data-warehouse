--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 18:17:04
--********************************************************************--
 -- 强制使用你的开发库！！
INSERT OVERWRITE TABLE ads_sale_rank PARTITION(ym)
SELECT 
    year_month,
    city,
    total_sale_ton,
    CAST(ROW_NUMBER() OVER(PARTITION BY year_month ORDER BY total_sale_ton DESC) AS INT) AS rank_in_month,
    year_month AS ym  
FROM dws_sale_month_agg
WHERE year_month is not NULL;