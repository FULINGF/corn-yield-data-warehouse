CREATE TABLE IF NOT EXISTS dwd_sale_inc (
    dt STRING COMMENT '日期（月份）',
    city STRING COMMENT '城市',
    price_per_ton BIGINT COMMENT '价格（元/吨）',
    sale_ton_num BIGINT COMMENT '销量（吨）'
) COMMENT '销售明细清洗表';