CREATE TABLE IF NOT EXISTS ods_corn_sale
(
    dt STRING COMMENT '销售日期',
    city STRING COMMENT '城市',
    price_per_ton BIGINT COMMENT '每吨价格',
    sale_ton_num BIGINT COMMENT '销量吨数'
)
COMMENT '玉米销售原始表';