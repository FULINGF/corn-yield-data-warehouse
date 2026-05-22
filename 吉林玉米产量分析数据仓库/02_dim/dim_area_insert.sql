--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-20 17:44:21
--********************************************************************--
INSERT OVERWRITE TABLE dim_area
SELECT DISTINCT city FROM ods_corn_yield;