CREATE TABLE ods_weather_day
(
    dt STRING COMMENT '日期',
    city STRING COMMENT '城市',
    avg_temp DOUBLE  COMMENT '平均气温',
    max_temp DOUBLE  COMMENT '最高气温',
    min_temp DOUBLE COMMENT '最低气温',
    rainfall DOUBLE COMMENT '降水量',
    humidity INT COMMENT '湿度',
    sun_hour DOUBLE COMMENT '日照时长'
)
COMMENT '气象日数据原始表';