🌽 吉林玉米产量分析离线数据仓库
项目定位：基于阿里云 MaxCompute + DataWorks 的标准化离线数仓

作者：赵飞宏

GitHub：https://github.com/FULINGF/corn-yield-data-warehouse

技术栈：MaxCompute SQL / Hive / Python (Pandas) / DataWorks

核心亮点：五层架构规范 | DQC 质量监控 | RAG 联动闭环

📊 项目简介
本项目针对吉林省多源异构农业数据（气象、土壤、产量、灾害、销售）分散、口径不一的问题，独立搭建标准化离线数据仓库。通过 ODS→DIM→DWD→DWS→ADS 五层分层架构，实现数据清洗、聚合与指标产出，并支持 RAG 智能问答系统 的数据驱动，形成“数据分析 → 知识检索”的业务闭环。

🏗️ 数据流向架构图
![img.png](img.png)
📂 目录结构
Text
agri_data_warehouse/
├── dqc/                      # 数据质量检查脚本
│   ├── dqc_null_rate.sql     # 空值率检查 (>5%)
│   ├── dqc_abnormal_ratio.sql# 异常值比例检查 (>3%)
│   └── dqc_row_count_check.sql # 行数波动检测 (>±50%)
├── ods/                      # 原始层建表与导入
├── dim/                      # 维度层建表与初始化
├── dwd/                      # 明细层清洗逻辑 (已优化 IF 函数 + WINDOW 子句)
├── dws/                      # 汇总层聚合逻辑
├── ads/                      # 应用层指标计算
└── README.md                 # 项目文档
✨ 核心亮点
1. 工程化代码规范
语法修正：修复 MaxCompute IF 函数三参数缺失问题，统一使用 WINDOW 子句减少重复代码。
注释完善：每个 ETL 脚本均包含清洗规则、阈值说明及分区策略。
性能优化：采用动态分区写入、MapJoin 及谓词下推策略。
2. DQC 数据质量监控体系
三层监控：覆盖空值率、异常值比例、行数波动三大核心维度。
自动化阻断：在 DataWorks 中配置依赖，一旦质量不达标即阻断下游任务。
告警机制：支持钉钉/邮件推送异常记录（表名、字段、指标）。
3. 数仓 + AI 业务闭环
数据驱动：ADS 层产出 ads_jilin_corn_pest_top（高频病虫害 Top N）。
智能决策：直接作为 RAG 项目的输入源，自动触发防治建议生成。
价值延伸：从“数据分析”延伸至“知识检索”，体现全链路数据思维。
🚀 运行指南
环境准备
平台：阿里云 MaxCompute (ODPS) + DataWorks
语言：SQL (MaxCompute 方言)
工具：PyCharm / VS Code (编写 SQL)
执行步骤
创建项目：在 DataWorks 中创建项目 df_cs_1346793。
建表导入：依次执行 ods/, dim/ 下的建表脚本，导入模拟数据。
ETL 调度：按顺序执行 dwd/, dws/, ads/ 下的 INSERT 脚本。
质量检查：运行 dqc/ 目录下的三个脚本验证数据质量。
结果查询：
Sql
SELECT * FROM ads_yield_yoy LIMIT 10;
SELECT * FROM ads_jilin_corn_pest_top;
📝 技术细节补充
模块	关键实现
缺失值处理	使用 LAG() OVER(PARTITION BY city ORDER BY dt) 进行前向填充
异常值过滤	气温 -40~45℃，亩产 200~1500 斤，损失率 0~1
同比计算	LAG(total_yield, 1) OVER(PARTITION BY city ORDER BY year)
销量排名	ROW_NUMBER() OVER(PARTITION BY year_month ORDER BY total_sale_ton DESC)
环境评分	加权公式：(temp-10)/10*0.4 + rain/100*0.3 + (ph-6)*0.3
🔗 关联项目
RAG 智能问答系统：https://github.com/FULINGF/agri_data_rag
利用本数仓产出的高频病虫害指标，自动检索防治文档。