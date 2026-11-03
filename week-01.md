# Week 01 每日任务（基础盘点 + 环境搭建）

> 主题：起跑——别贪多，先把工具链和自我盘点做扎实。每天 2.5–3 小时。

---

## Day 1（周一）— 自我盘点与 GitHub 启动

**今日三件事**：
1. 写一份"AI 学习档案" markdown（保存在 `ai-roadmap/self-assessment.md`）：
   - 已会的语言、框架、工具
   - 数学基础自评（线代/概率/微积分 1-5 分）
   - 期望毕业时拿到的 offer 类型 / 薪资区间
   - 每天能投入的时间
2. 注册 / 登录 GitHub，把 profile 写完整（头像、bio、所在地、技术栈）
3. 建仓库 `ai-roadmap`，作为整个学习过程的进度记录仓
   - 加 README、目录结构
   - 第一次 commit：`docs: 初始化学习路线`

**今晚交付**：1 份自评文档 + 1 个空仓库

---

## Day 2（周二）— Python 进阶 + 环境搭建

**目标**：能干净地搭一个 AI 开发环境。

1. 检查 Python：`python --version`，建议 3.10 或 3.11
2. 安装 **Miniconda**（如果没装），安装路径建议 `D:\miniconda`（你说默认 D 盘）
3. 创建虚拟环境：
   ```bash
   conda create -n ai python=3.10 -y
   conda activate ai
   ```
4. 安装核心包：
   ```bash
   pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
   pip install numpy pandas scikit-learn jupyter matplotlib
   ```
5. 写 5 个 Python 进阶小练习（手敲，不要复制）：
   - 装饰器：实现一个计时装饰器
   - 生成器：斐波那契生成器（yield）
   - 上下文管理器：with 写文件 + 自动关闭
   - typing：给一个函数加类型注解
   - dataclass：定义一个 `User` 数据类

**今晚交付**：可用环境（验证 `python -c "import sklearn"` 成功）+ 5 个练习代码 push 到仓库 `week01/` 目录

---

## Day 3（周三）— Linux 命令行 + WSL2

**目标**：能在命令行里不迷路。

1. 安装 **WSL2 + Ubuntu**（Windows 推荐方式）
   - `wsl --install -d Ubuntu-22.04`
2. 记熟这 20 个命令，每个敲 3 遍：
   `ls cd pwd mkdir rm mv cp cat less grep find ssh scp curl tar zip chmod chown ps top sudo vi`
3. 实战：在 WSL 里把 GitHub 的 `ai-roadmap` 仓库 clone 下来，能正常 push
4. 用 `tmux` 或至少会用 `screen`（进阶，可选）

**今晚交付**：能流畅在 WSL 里 git push 的工作流

---

## Day 4（周四）— 数学前置 + NumPy 实操

**目标**：把 AI 用得上的数学补到能看懂公式、能写代码的程度。

1. **线性代数**（2h）：看 3Blue1Brown《线性代数的本质》系列（前 8 集）
   - 重点：向量、矩阵乘法、转置、逆矩阵、点积、特征值直觉
2. **概率**（0.5h）：复习条件概率、贝叶斯、期望、方差、二项/正态分布
3. **NumPy 实操**（0.5h）：
   - 实现矩阵乘法（不用 `@`，自己写循环版本）
   - 计算一组数据的均值、方差、标准差
   - 用 `np.random` 生成正态分布，画直方图

**今晚交付**：`week01/numpy-practice.ipynb`，包含上面 3 个练习

---

## Day 5（周五）— 第一个 ML 模型（端到端）

**目标**：跑通标准 ML 流程，理解每一步在干什么。

1. 用 **sklearn 鸢尾花数据集**：
   ```python
   from sklearn.datasets import load_iris
   from sklearn.model_selection import train_test_split
   from sklearn.preprocessing import StandardScaler
   ```
2. 完整流程：
   - 加载 → 拆分（train/test） → 标准化 → 训练 → 预测 → 评估
3. **对比 3 个模型**：KNN、决策树、逻辑回归
   - 打印每个模型的 accuracy / precision / recall / F1
   - 用 matplotlib 画混淆矩阵
4. 写 200 字总结：哪个最好？为什么？标准化前后差异？

**今晚交付**：`week01/iris-ml.ipynb`，包含 3 个模型对比

---

## Day 6（周六）— 阅读 + 写作（深度学习的一天）

**目标**：建立"读 AI 内容 → 写笔记"的习惯。

**早上（1h）**：通读一篇优质长文（二选一）：
- 强烈推荐：**Andrej Karpathy《A Recipe for Training Neural Networks》**（中文翻译到处都是）
- 或者：**3Blue1Brown《深度学习系列》**前 3 集

**下午（2h）**：
1. 把今天读到的核心 3 个观点写下来（用自己的话，不是抄）
2. 用 markdown 写一篇学习笔记（至少 800 字）
3. 笔记里必须有：**原话引用 + 你的理解 + 一个能用在你自己的项目里的例子**

**今晚交付**：`week01/notes/day6-reading.md`，push 到 GitHub

---

## Day 7（周日）— 周复盘 + 下周任务确认

**目标**：把这一周变成可衡量的进度。

1. **写周复盘** `week01/weekly-review.md`，包含：
   - 完成度（7 天任务各打勾/打叉）
   - 卡点（哪里耗时长、哪里不懂）
   - 下周重点（基于卡点调整）
2. **整理仓库**：把 week01 目录整理干净，README 写"Week 01 总结"
3. 给我汇报（贴周复盘链接或直接贴内容），我帮你核准下周任务

**今晚交付**：1 份周复盘 + 1 次跟我同步

---

## 本周产出清单（周日自检）

- [ ] `self-assessment.md`（自评）
- [ ] `week01/` 目录下 ≥ 5 个代码文件
- [ ] `week01/numpy-practice.ipynb`
- [ ] `week01/iris-ml.ipynb`
- [ ] `week01/notes/day6-reading.md`
- [ ] `week01/weekly-review.md`
- [ ] GitHub 仓库至少 7 次 commit

## 给我同步的格式

周日晚上把"周复盘"内容贴给我（或贴仓库链接），我据此生成 **Week 02 任务**。如果某天任务卡住超 2 小时，直接说"Day X 卡了"，我给替代方案。