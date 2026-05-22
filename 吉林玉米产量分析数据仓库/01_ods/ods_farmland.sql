CREATE TABLE IF NOT EXISTS ods_farmland
(
    farm_id       BIGINT COMMENT '地块id',
    city          STRING COMMENT '城市',
    plant_area    BIGINT COMMENT '种植面积(亩)',
    crop_name     STRING COMMENT '作物名称',
    sow_date      STRING COMMENT '播种日期',
    harvest_date  STRING COMMENT '收获日期',
    soil_type     STRING COMMENT '土壤类型'
)
COMMENT '地块信息原始表';