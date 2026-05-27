CREATE TABLE IF NOT EXISTS dwd_rag_query_log (
    query STRING COMMENT '用户问题',
    answer STRING COMMENT 'RAG 回答',
    latency_ms BIGINT COMMENT '响应时间(毫秒)',
    ref_info STRING COMMENT '参考来源'
) PARTITIONED BY (dt STRING COMMENT '日期');