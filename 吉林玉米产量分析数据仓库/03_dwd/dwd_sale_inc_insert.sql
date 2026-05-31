-- MaxCompute SQL
-- ============================================================
-- 描述：ODS → DWD，销售数据清洗
-- 清洗规则：
--   price_per_ton：1500~3500 元/吨，超出范围置 NULL
--   sale_ton_num：必须 > 0，否则置 0（保留业务兜底）
-- ============================================================

INSERT OVERWRITE TABLE dwd_sale_inc

SELECT
    dt,
    city,
    IF(price_per_ton BETWEEN 1500 AND 3500, price_per_ton, NULL) AS price_per_ton,
    IF(sale_ton_num > 0, sale_ton_num, 0) AS sale_ton_num
FROM ods_corn_sale;