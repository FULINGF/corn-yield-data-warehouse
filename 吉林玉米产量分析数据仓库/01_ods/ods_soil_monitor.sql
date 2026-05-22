CREATE TABLE ods_soil_monitor
(
    dt             STRING COMMENT '日期'
    ,city          STRING COMMENT '城市'
    ,soil_temp     DOUBLE COMMENT '土壤温度'
    ,soil_humidity INT COMMENT '土壤湿度'
    ,ph_value      DOUBLE COMMENT 'PH值'
    ,nitrogen      DOUBLE COMMENT '氮'
    ,phosphorus    DOUBLE COMMENT '磷'
    ,potassium     DOUBLE COMMENT '钾'
)
COMMENT '土壤监测原始表';