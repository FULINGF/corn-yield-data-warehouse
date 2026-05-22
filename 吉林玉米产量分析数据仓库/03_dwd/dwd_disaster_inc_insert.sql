--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-22 11:19:17
--********************************************************************--
insert overwrite table dwd_disaster_inc 
SELECT stat_year,city,disaster_type,affected_area,
IF(loss_rate between 0 and 1,loss_rate,NULL)AS loss_rate
FROM ods_pest_disaster ;