--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 17:58:53
--********************************************************************--
INSERT OVERWRITE TABLE ads_disaster_impact PARTITION(year)
SELECT 
    city,
    SUM(affected_area) AS total_affected_area,
    SUM(affected_area * loss_rate) AS total_loss_estimate,
    stat_year AS year
FROM dwd_disaster_inc
GROUP BY city, stat_year;