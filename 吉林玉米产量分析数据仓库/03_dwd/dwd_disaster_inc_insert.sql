-- MaxCompute SQL
-- ============================================================
-- 描述：ODS → DWD，灾害数据清洗
-- 清洗规则：
--   loss_rate：0~1，超出范围置 NULL
--   affected_area：保留原值
-- ============================================================

INSERT OVERWRITE TABLE dwd_disaster_inc

SELECT
    stat_year,
    city,
    disaster_type,
    affected_area,
    IF(loss_rate BETWEEN 0 AND 1, loss_rate, NULL) AS loss_rate
FROM ods_pest_disaster;