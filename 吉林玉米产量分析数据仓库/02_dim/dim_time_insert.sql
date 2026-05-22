--MaxCompute SQL
--********************************************************************--
--author: nick3931492681
--create time: 2026-05-20 14:34:25
--********************************************************************--
INSERT OVERWRITE TABLE dim_time
SELECT 
    TO_CHAR(d, 'yyyy-MM-dd') AS date_id,  -- 修改DATE_FORMAT为TO_CHAR
    CAST(YEAR(d) AS STRING) AS year,
    CAST(MONTH(d) AS STRING) AS month,
    CAST(DAY(d) AS STRING) AS day,
    CASE 
        WHEN MONTH(d) IN (3,4,5) THEN '春'
        WHEN MONTH(d) IN (6,7,8) THEN '夏'
        WHEN MONTH(d) IN (9,10,11) THEN '秋'
        ELSE '冬'
    END AS season
FROM (
    SELECT EXPLODE(SEQUENCE(TO_DATE('2020-01-01'), TO_DATE('2024-12-31'), INTERVAL 1 DAY)) AS d
) t;
