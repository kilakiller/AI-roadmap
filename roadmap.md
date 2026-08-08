# AI 学习路线（双非大三 · 软件工程 · 18 个月）

> 作者：Hermes Agent｜制定日期：2026-08-08｜下次复盘：每周末

## 一、定位（先想清楚再上路）

大厂 AI 算法岗（Research Scientist / 核心算法工程师）**默认卡学历**——双非本科几乎进不去，除非你有顶会一作 / Kaggle 顶级名次 / 大厂核心项目背书之一。

对你**最务实**的赛道是 **AI 应用工程师 / LLM Engineer**：
- 学历门槛低（本科友好）
- 拼的是**实战能力 + 作品集 + 工程基本功**（这正是软工专业优势）
- 岗位多：大模型应用、RAG、Agent、MLOps、推理部署、AI 产品工程
- 薪资天花板也很高（大厂 P6+ 能到 40–60w/年，资深更高）

**一句话定位**：用工程能力把 AI 模型变成可用的产品。

## 二、阶段路线（按周）

### 阶段 0 ｜基础盘点与环境（Week 1–2）
目标：把工具链和数学前置理顺，能跑通第一个 ML 模型。
- Python 进阶（装饰器、生成器、上下文管理器、typing）
- Git / GitHub（commit、branch、PR）
- Linux 命令行 + WSL2（推荐 WSL2 Ubuntu）
- 数学：线代 + 概率 + NumPy 实操
- 第一个 sklearn 模型

### 阶段 1 ｜ML / DL 基础（Week 3–8，约 6 周）
- 吴恩达 Machine Learning（快速过）+ 李宏毅机器学习
- 深度学习：李沐《动手学深度学习》PyTorch 版
- 经典模型：CNN（ResNet）、RNN/LSTM、Transformer（重点中的重点）
- 框架：PyTorch 熟练度达到能不看教程搭模型

### 阶段 2 ｜大模型核心（Week 9–16，约 8 周）★ 最核心
- Transformer 架构深读（Attention 是怎么算的，KV Cache 是什么）
- HuggingFace 生态：transformers、datasets、peft、trl
- **Prompt Engineering**（系统提示、少样本、思维链）
- **RAG**（检索增强生成）：embedding、向量库（Chroma/Milvus）、召回策略
- **Agent** 框架：LangChain → LangGraph → 至少一个国产替代（Coze/Dify 也行）
- 微调：LoRA / QLoRA，用 LLaMA-Factory 或 unsloth

### 阶段 3 ｜AI 工程化（Week 17–22，约 6 周）
- 推理部署：vLLM、TGI、量化（GPTQ/AWQ/GGUF）
- 向量数据库：Milvus / Chroma / Faiss 至少熟悉两个
- API 服务化：FastAPI + Docker
- 监控/评估：LangSmith / LangFuse / RAGAS
- 云端 GPU 租用（AutoDL / 恒源智享云 / 阿里云）

### 阶段 4 ｜项目实战 + 作品集（Week 23–end，并行进行）
**至少 3 个能拿出手的项目**（写进简历）：
1. **个人 AI 知识助手**（RAG + 本地知识库 + Web UI）
2. **领域 Agent**（比如自动刷题助手、论文精读 Agent、SQL Agent 任选）
3. **微调 + 部署**（选一个垂直领域，比如法律/医疗/教育数据集，LoRA 微调一个 7B 模型 + vLLM 部署）

**作品集渠道**：
- GitHub 主页（README 要专业，star 数 > 0 的项目 ≥ 2）
- 技术博客（知乎/CSDN/掘金/Medium，挑 1-2 个持续写）
- B 站/小红书技术讲解（加分项，简历杀手锏）
- Kaggle / 天池：至少 1 个有意义的比赛（前 30% 就够写简历）

### 阶段 5 ｜求职准备（最后 2 个月，week 50–end）
- 简历打磨（用 STAR 法则写项目）
- LeetCode 中等题 ≥ 200 道
- 八股文：操作系统、计算机网络、数据库、ML 基础
- AI 行业动态：每天刷 HuggingFace、PaperWeekly、机器之心 30 分钟
- 实习 / 校招节奏：大三下暑期实习（关键）、秋招、春招

## 三、每日节奏（建议）

- **工作日**：2.5–3 小时（晚 7:30–10:30）
- **周末**：每天 4–5 小时
- **每日三件套**：30 分钟读 / 1.5 小时动手 / 30 分钟写笔记 / 周末复盘

## 四、避坑清单

1. ❌ 一上来就追 SOTA 论文 → ✅ 先会用、再懂原理、最后改
2. ❌ 只看课不写代码 → ✅ 每一节都要有产出
3. ❌ 收藏教程从不打开 → ✅ 选定一套主线（建议李沐+HF），别反复切换
4. ❌ 追求"全栈"什么都学 → ✅ 阶段 2 重心就锁死在 LLM 应用
5. � 等"学完再找实习" → ✅ 阶段 2 中期（week 12）就要开始投简历，边学边面
