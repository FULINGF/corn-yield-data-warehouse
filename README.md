<img width="2599" height="5049" alt="mermaid-1782027684214" src="https://github.com/user-attachments/assets/db84984e-c8e0-4fa3-b37e-7a23ed9a79aa" />
flowchart TB
    subgraph "🌽 离线数仓（MaxCompute）"
        ODS["ODS 
        原始数据层
        (气象/土壤/产量/灾害/销售)"]
        DIM["DIM 
        维度层
        (时间/地区/灾害类型)"]
        DWD["DWD 
        明细清洗层
        (异常值填充/前向填充/过滤)"]
        DWS["DWS 
        汇总层
        (月销量/环境宽表/灾害聚合)"]
        ADS["ADS 
        应用层
        (高频病虫害TopN/产量同比/环境评分)"]
        DQC["DQC
        质量监控
        (空值/异常/波动告警)"]

        ODS --> DWD
        DIM --> DWD
        DWD --> DWS
        DWS --> ADS
        DQC -.->|检查异常| DWD
        DQC -.->|检查异常| ODS
    end

    subgraph "🤖 RAG 智能问答系统"
        DOCS["📁 知识库源文件
        (PDF/DOCX/CSV/TXT)"]
        WAREHOUSE_CSV["📊 数仓导出CSV
        (ads_jilin_corn_pest_top)"]
        ETL["ETL 流水线
        (增量/全量构建索引)"]
        FAISS["FAISS 向量库
        (BAAI/bge-small-zh-v1.5)"]
        LLM["DeepSeek LLM
        (ChatOpenAI)"]
        STREAMLIT["Streamlit UI
        (Web交互)"]
        INTEGRATION["数仓联动脚本
        (批量生成防治报告)"]

        DOCS --> ETL
        WAREHOUSE_CSV --> ETL
        ETL --> FAISS
        FAISS -->|检索 TOP_K| LLM
        LLM --> STREAMLIT
        WAREHOUSE_CSV --> INTEGRATION
        INTEGRATION -->|调用RAG| LLM
        STREAMLIT -->|用户提问| LLM
    end

    subgraph "🔗 联动与数据闭环"
        ADS -->|导出高频病虫害CSV| WAREHOUSE_CSV
        LLM -->|RAG回答| REPORT["防治报告.txt"]
    end

    style ODS fill:#e1f5fe,stroke:#01579b
    style DIM fill:#fce4ec,stroke:#c62828
    style DWD fill:#fff3e0,stroke:#e65100
    style DWS fill:#e8f5e9,stroke:#2e7d32
    style ADS fill:#f3e5f5,stroke:#6a1b9a
    style DQC fill:#ffebee,stroke:#b71c1c
    style FAISS fill:#e0f2f1,stroke:#004d40
    style LLM fill:#e8eaf6,stroke:#283593
    style STREAMLIT fill:#fce4ec,stroke:#880e4f
    style INTEGRATION fill:#fff9c4,stroke:#f57f17
