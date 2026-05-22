CREATE TABLE IF NOT EXISTS dwd_yield_inc (
    stat_year STRING COMMENT '年份',
    city STRING COMMENT '城市',
    total_plant_area DOUBLE COMMENT '播种面积（亩）',
    total_yield_ton DOUBLE COMMENT '总产量（吨）',
    mu_yield DOUBLE COMMENT '亩产（斤/亩）'
) COMMENT '产量明细清洗表';