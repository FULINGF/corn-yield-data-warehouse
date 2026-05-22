CREATE TABLE IF NOT EXISTS ads_disaster_impact (
    city STRING COMMENT '城市',
    total_affected_area BIGINT COMMENT '总受灾面积（亩）',
    total_loss_estimate DOUBLE COMMENT '总减产估算（吨）'
)
 COMMENT '受灾总汇表'
 PARTITIONED BY (year STRING);