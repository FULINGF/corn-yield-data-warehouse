CREATE TABLE IF NOT EXISTS dws_disaster_agg (
    city STRING COMMENT '城市',
    total_affected_area BIGINT COMMENT '总受灾面积（亩）',
    avg_loss_rate DOUBLE COMMENT '平均损失率',
    estimated_loss DOUBLE COMMENT '预估减产（受灾面积×损失率）'
) PARTITIONED BY (stat_year STRING COMMENT '年份');