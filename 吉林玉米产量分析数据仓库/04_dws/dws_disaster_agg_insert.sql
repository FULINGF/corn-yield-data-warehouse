--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 13:44:21
--********************************************************************--

INSERT OVERWRITE TABLE dws_disaster_agg PARTITION(stat_year)
SELECT 
    city,
    SUM(affected_area) AS total_affected_area,
    AVG(loss_rate) AS avg_loss_rate,
    SUM(affected_area * NVL(loss_rate, 0)) AS estimated_loss,
    stat_year
FROM dwd_disaster_inc
GROUP BY city, stat_year;