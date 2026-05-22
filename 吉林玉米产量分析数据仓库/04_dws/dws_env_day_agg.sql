CREATE TABLE dws_env_day_agg
(
    city               STRING COMMENT '城市'
    ,avg_temp          DOUBLE COMMENT '日均气温'
    ,max_temp          DOUBLE COMMENT '日最高气温'
    ,min_temp          DOUBLE COMMENT '日最低气温'
    ,total_rainfall    DOUBLE COMMENT '日总降水量'
    ,avg_soil_temp     DOUBLE COMMENT '日均土壤温度'
    ,avg_soil_humidity DOUBLE COMMENT '日均土壤湿度'
    ,avg_ph            DOUBLE COMMENT '平均pH值'
)
COMMENT '环境日宽表'
PARTITIONED BY
(
    dt                 STRING COMMENT '日期'
);