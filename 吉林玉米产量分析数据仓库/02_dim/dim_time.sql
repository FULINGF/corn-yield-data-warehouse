CREATE TABLE IF NOT EXISTS dim_time (
    date_id STRING COMMENT '日期 yyyy-MM-dd',
    year STRING COMMENT '年',
    month STRING COMMENT '月',
    day STRING COMMENT '日',
    season STRING COMMENT '季节'
) COMMENT '时间维度表';