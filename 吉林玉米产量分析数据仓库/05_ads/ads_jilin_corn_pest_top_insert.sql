-- 假设 dt 为今天日期，插入几个常见的玉米病虫害
INSERT OVERWRITE TABLE ads_jilin_corn_pest_top PARTITION (dt='2026-05-27')
VALUES
    ('玉米螟', 120),
    ('大斑病', 85),
    ('粘虫', 60);