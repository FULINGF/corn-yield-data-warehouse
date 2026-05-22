--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 11:27:12
--********************************************************************--
INSERT OVERWRITE TABLE dwd_sale_inc
SELECT 
    dt,
    city,
    IF(price_per_ton BETWEEN 1500 AND 3500, price_per_ton, NULL) AS price_per_ton,
    IF(sale_ton_num > 0, sale_ton_num, 0) AS sale_ton_num
FROM ods_corn_sale;