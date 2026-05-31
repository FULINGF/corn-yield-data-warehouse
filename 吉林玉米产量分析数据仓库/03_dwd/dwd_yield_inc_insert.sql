-- MaxCompute SQL
-- ============================================================
-- 描述：ODS → DWD，产量数据清洗
-- 清洗规则：
--   mu_yield：200~1500 斤/亩，超出范围置 NULL
--   total_plant_area、total_yield_ton：保留原值
-- ============================================================

INSERT OVERWRITE TABLE dwd_yield_inc

SELECT
    stat_year,
    city,
    total_plant_area,
    total_yield_ton,
    IF(mu_yield BETWEEN 200 AND 1500, mu_yield, NULL) AS mu_yield
FROM ods_corn_yield;