CREATE TABLE ads_env_score
(
    city            STRING
    ,avg_temp       DOUBLE
    ,total_rainfall DOUBLE
    ,avg_ph         DOUBLE
    ,env_score      DOUBLE
)
COMMENT '环境综合质量评分表'
PARTITIONED BY
(
    dt              STRING
);