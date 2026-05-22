--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-20 18:07:15
--********************************************************************--
INSERT OVERWRITE TABLE dim_disaster_type
SELECT 
    disaster_type,
    category,
    severity_level,
    description
FROM (
    -- MaxCompute 兼容写法：用 SELECT + UNION ALL 代替 VALUES
    SELECT '风灾' AS disaster_type, '气象灾害' AS category, 3 AS severity_level, '风力≥6级造成作物倒伏' AS description UNION ALL
    SELECT '霜冻' AS disaster_type, '气象灾害' AS category, 4 AS severity_level, '气温≤0℃导致冻害' AS description UNION ALL
    SELECT '干旱' AS disaster_type, '气象灾害' AS category, 4 AS severity_level, '连续无降雨＞15天' AS description UNION ALL
    SELECT '洪涝' AS disaster_type, '气象灾害' AS category, 3 AS severity_level, '积水淹没农田＞3天' AS description UNION ALL
    SELECT '玉米螟' AS disaster_type, '生物灾害' AS category, 2 AS severity_level, '玉米螟幼虫危害' AS description
) t;