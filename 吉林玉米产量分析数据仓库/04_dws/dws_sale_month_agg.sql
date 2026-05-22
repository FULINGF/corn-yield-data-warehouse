CREATE TABLE IF NOT EXISTS dws_sale_month_agg (
    city STRING COMMENT '城市',
    avg_price DOUBLE COMMENT '月均价格（元/吨）',
    total_sale_ton BIGINT COMMENT '月总销量（吨）'
)
COMMENT '产销月汇总'
PARTITIONED BY (year_month STRING COMMENT '年月 yyyy-MM');