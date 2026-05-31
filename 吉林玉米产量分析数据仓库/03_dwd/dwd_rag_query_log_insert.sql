-- MaxCompute SQL
-- ============================================================
-- 描述：RAG 问答日志 → DWD 层清洗
-- 数据来源：RAG 系统生成的 query_log.csv → ODS 层导入
-- 清洗规则：
--   latency_ms：必须 > 0，异常值置 NULL
--   query、answer、ref_info：去除首尾空格
-- 分区：dt（STRING，yyyy-MM-dd）
-- ============================================================

INSERT OVERWRITE TABLE dwd_rag_query_log PARTITION(dt)

SELECT
    TRIM(query) AS query,
    TRIM(answer) AS answer,
    IF(latency_ms > 0, latency_ms, NULL) AS latency_ms,
    TRIM(ref_info) AS ref_info,
    dt
FROM ods_rag_query_log
WHERE dt IS NOT NULL;