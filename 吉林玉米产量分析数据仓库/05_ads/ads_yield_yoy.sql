CREATE TABLE IF NOT EXISTS ads_yield_yoy (
    year STRING COMMENT '年份',
    city STRING COMMENT '城市',
    total_yield_ton DOUBLE COMMENT '总产量（吨）',
    prev_year_yield DOUBLE COMMENT '上年产量',
    yoy_growth DOUBLE COMMENT '同比增速'
) COMMENT '玉米产量同比分析';