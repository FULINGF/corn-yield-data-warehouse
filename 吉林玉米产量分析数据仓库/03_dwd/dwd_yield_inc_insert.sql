--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 10:53:19
--********************************************************************--
INSERT OVERWRITE TABLE dwd_yield_inc
SELECT 
    stat_year,
    city,
    total_plant_area,
    total_yield_ton,
    IF(mu_yield BETWEEN 200 AND 1500, mu_yield, NULL) AS mu_yield
FROM ods_corn_yield;