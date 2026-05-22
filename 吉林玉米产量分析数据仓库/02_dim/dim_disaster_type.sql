CREATE TABLE dim_disaster_type (
    disaster_type   STRING COMMENT '灾害类型（唯一主键）',
    category        STRING COMMENT '灾害大类：气象灾害/生物灾害',
    severity_level  INT    COMMENT '灾害严重等级 1-5',
    description     STRING COMMENT '灾害说明'
) COMMENT '灾害类型维度表';