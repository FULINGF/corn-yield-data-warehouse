# 吉林玉米产量分析数据仓库（学生练手项目）
**作者**：赵飞宏
**项目日期**：2026年5月
**项目类型**：个人数据仓库设计学习练手项目
**数据来源**：Python 代码模拟生成，非真实数据，仅用于学习

---

## 一、项目简介
本项目为学生大数据技术练手作品，**所有数据均使用 Python 代码模拟生成**，不涉及任何真实业务数据、无商业用途、无不良影响。

项目基于阿里云 MaxCompute + DataWorks，构建完整离线数据仓库，实现气象、土壤、产量、灾害、销售等多源数据的处理与分析，采用标准分层架构（ODS→DIM→DWD→DWS→ADS），产出产量同比、销量排名、环境评分等指标，用于学习数仓开发。

---

## 二、技术栈
- 数据平台：阿里云 MaxCompute + DataWorks
- 开发语言：MaxCompute SQL、Python（Pandas 数据模拟）
- 数据规模：6张模拟数据表，约5400+行数据
- 数仓分层：ODS → DIM → DWD → DWS → ADS

---

## 三、数仓分层架构
| 层级 | 表名 | 说明 |
|------|------|------|
| ODS | ods_weather_day、ods_soil_monitor、ods_farmland、ods_corn_yield、ods_pest_disaster、ods_corn_sale | 原始模拟数据 |
| DIM | dim_time、dim_area、dim_disaster_type | 维度表 |
| DWD | dwd_weather_inc、dwd_soil_inc、dwd_yield_inc、dwd_disaster_inc、dwd_sale_inc | 清洗后明细 |
| DWS | dws_env_day_agg、dws_disaster_agg、dws_sale_month_agg | 主题聚合宽表 |
| ADS | ads_yield_yoy、ads_disaster_impact、ads_sale_rank、ads_env_score | 最终业务指标 |

---

## 四、核心指标
- 产量同比：按年统计产量同比增长率
- 销量排名：按月统计销量并排名
- 环境评分：气温、降水、土壤pH综合评分
- 灾害影响：受灾面积与预估减产

---

## 五、项目亮点
- 标准企业级数仓五层架构
- 完整ETL流程：清洗→聚合→指标
- 使用窗口函数 LAG / ROW_NUMBER
- 动态分区、数据质量检查
- 数据全部自主模拟，安全合规

---

## 六、运行步骤
1. 执行 01_ODS 建表 → 上传CSV
2. 执行 02_DIM → 03_DWD → 04_DWS → 05_ADS
3. 验证数据：SELECT * FROM ads_env_score  where dt is not null LIMIT 10;

---

## 七、未来优化方向
- 使用 DataWorks 调度实现自动化 ETL
- 对接 Quick BI 制作可视化大屏
- 引入机器学习实现产量预测模型
