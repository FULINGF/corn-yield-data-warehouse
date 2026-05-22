CREATE TABLE IF NOT EXISTS dwd_soil_inc (
    city STRING COMMENT '城市',
    soil_temp DOUBLE COMMENT '土壤温度',
    soil_humidity BIGINT COMMENT '土壤湿度',
    ph_value DOUBLE COMMENT 'pH值',
    nitrogen DOUBLE COMMENT '氮',
    phosphorus DOUBLE COMMENT '磷',
    potassium DOUBLE COMMENT '钾'
) COMMENT '土壤明细清洗表'
PARTITIONED BY (dt STRING);