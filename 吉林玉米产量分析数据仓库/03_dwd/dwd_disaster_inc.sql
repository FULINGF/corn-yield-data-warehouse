CREATE TABLE IF NOT EXISTS dwd_disaster_inc (
    stat_year STRING COMMENT '年份',
    city STRING COMMENT '城市',
    disaster_type STRING COMMENT '灾害类型',
    affected_area BIGINT COMMENT '受灾面积（亩）',
    loss_rate DOUBLE COMMENT '减产损失率'
) COMMENT '灾害明细清洗表';