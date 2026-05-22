CREATE TABLE ads_sale_rank
(
    year_month      STRING COMMENT '年月'
    ,city           STRING COMMENT '城市'
    ,total_sale_ton BIGINT COMMENT '月销量'
    ,rank_in_month  INT COMMENT '当月销量排名'
)
COMMENT '玉米销量排名表'
PARTITIONED BY
(
    ym              STRING
);