CREATE TABLE dwd_weather_inc
(
    city STRING COMMENT '城市',
    avg_temp DOUBLE COMMENT '平均气温(清洗后)',
    max_temp DOUBLE COMMENT '最高气温',
    min_temp DOUBLE COMMENT '最低气温',
    rainfall DOUBLE COMMENT '降水量',
    humidity DOUBLE COMMENT '温度',
    sun_hour DOUBLE COMMENT '日照时数'
)
COMMENT '气象明细清洗表'
PARTITIONED BY (dt STRING COMMENT '日期分区 yyyy-MM-dd');