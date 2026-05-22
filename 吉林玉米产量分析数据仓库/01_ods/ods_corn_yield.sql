CREATE TABLE ods_corn_yield
(
    stat_year STRING COMMENT '年份',
    city STRING COMMENT '城市',
    total_plant_area BIGINT COMMENT '种植面积'，
    total_yield_ton BIGINT COMMENT '总产量',
    mu_yield DOUBLE COMMENT '亩产量'
)
COMMENT '玉米产量原始表';