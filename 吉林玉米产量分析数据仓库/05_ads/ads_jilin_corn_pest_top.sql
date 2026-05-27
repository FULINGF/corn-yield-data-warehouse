CREATE TABLE IF NOT EXISTS ads_jilin_corn_pest_top (
    pest_name STRING COMMENT '病虫害名称',
    freq BIGINT COMMENT '出现频次'
) PARTITIONED BY (dt STRING COMMENT '数据日期');