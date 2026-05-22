CREATE TABLE IF NOT EXISTS ods_pest_disaster
(
    stat_year STRING COMMENT '年份',
    city STRING COMMENT '城市',
    disaster_type STRING COMMENT '灾害类型',
    affected_area BIGINT COMMENT '受灾面积',
    loss_rate DOUBLE COMMENT '损失率'
)
COMMENT '病虫害灾害原始表';