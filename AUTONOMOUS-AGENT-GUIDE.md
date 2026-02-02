# AI 自主运行系统 - 使用指南

## 🚀 快速开始

### 1. 启动系统（只需运行一次）

```bash
cd /Users/yenaibao/Downloads/workspace/openclaw
./setup-autonomous-agent.sh
```

这会创建 4 个定时任务：
- ✅ 主控循环（每 5 分钟）- **每次执行后发送进度到 Discord**
- ✅ 每日复盘（每天 8:00）- 发送每日报告到 Discord
- ✅ 每周评估（每周一 9:00）- 发送每周报告到 Discord
- ✅ 状态监控（每小时）- 异常时发送警报到 Discord

### 2. 测试一下（可选）

```bash
# 手动触发一次，立即看到效果
./test-agent.sh
```

等待 1-2 分钟，你会在 Discord 收到类似这样的消息：

```
✅ 执行完成 [11:58]
- 本次任务: 读取目标文件，开始调研
- 执行结果: 访问 Perplexity，搜索 AI 工具变现策略
- 下一步: 继续收集案例数据
- 需要人工决策: 无
```

## 📱 你会收到的 Discord 消息

### 每 5 分钟（主控循环）

```
✅ 执行完成 [12:05]
- 本次任务: 调研 AI 工具变现案例
- 执行结果: 找到 3 个成功案例，记录到策略文件
- 下一步: 继续分析变现模式
- 需要人工决策: 无
```

### 需要人工决策时

```
✅ 执行完成 [12:10]
- 本次任务: 确定主攻平台
- 执行结果: 分析了 X、YouTube、小红书、B站
- 下一步: 等待决策
- 需要人工决策: ⚠️ 需要选择主攻平台
  
  选项 1: X + YouTube（英文市场，付费能力强）
  选项 2: 小红书 + B站（中文市场，用户基数大）
  
  请回复你的选择，我会继续执行。
```

### 每天早上 8:00（每日复盘）

```
**每日报告 - 2026-01-31**
- 昨日完成: 调研 20 个案例，提取 5 个变现模式
- 今日计划: 制定内容策略，创建第一个模板
- 关键发现: AI 工具教程类内容转化率最高
- 需要决策: 无
```

### 每周一早上 9:00（每周评估）

```
**每周战略报告 - 第 1 周**
- 本周成果: 完成调研阶段，确定方向为 X + YouTube
- 关键指标: 调研案例 50 个，内容模板 5 个
- 战略调整: 进入内容创作阶段
- 下周重点: 每天发布 3 条内容，测试反馈
```

## 🔍 监控命令

### 查看当前状态

```bash
# 查看目标和进展
cat ~/.openclaw/workspace/ai-monetization/MISSION.md

# 查看策略和执行日志
cat ~/.openclaw/workspace/ai-monetization/STRATEGY.md

# 查看所有定时任务
openclaw cron list

# 查看最近 10 次执行记录
openclaw cron runs --name "AI变现主控循环" --limit 10
```

### 手动触发（测试）

```bash
# 触发主控循环
./test-agent.sh

# 触发每日复盘
openclaw cron run $(openclaw cron list --json | jq -r '.[] | select(.name == "AI变现每日复盘") | .id') --force

# 触发每周评估
openclaw cron run $(openclaw cron list --json | jq -r '.[] | select(.name == "AI变现每周战略评估") | .id') --force
```

## 🎯 如何与 Agent 互动

### 场景 1：Agent 需要你做决策

Discord 收到：
```
需要人工决策: ⚠️ 需要选择主攻平台
选项 1: X + YouTube
选项 2: 小红书 + B站
```

你的回复方式：
```
# 方式 1: 直接在 Discord 回复
选择选项 1，聚焦 X + YouTube

# 方式 2: 修改策略文件
echo "决策：主攻 X + YouTube" >> ~/.openclaw/workspace/ai-monetization/STRATEGY.md
```

### 场景 2：你想调整目标

```bash
# 编辑目标文件
nano ~/.openclaw/workspace/ai-monetization/MISSION.md

# 例如：把目标从 $10,000 改成 $5,000
# Agent 会在下次执行时读取新目标
```

### 场景 3：你想改变策略

```bash
# 编辑策略文件
nano ~/.openclaw/workspace/ai-monetization/STRATEGY.md

# 例如：添加新的本周目标
# Agent 会在下次执行时按新策略执行
```

## ⚙️ 调整执行频率

### 如果觉得 5 分钟太频繁

```bash
# 1. 删除现有任务
openclaw cron remove $(openclaw cron list --json | jq -r '.[] | select(.name == "AI变现主控循环") | .id')

# 2. 创建新任务（改为 15 分钟）
openclaw cron add \
  --name "AI变现主控循环" \
  --every "15m" \
  --session isolated \
  --message "..." \
  --deliver \
  --channel discord \
  --to "1466468518181470248"
```

### 如果想暂停系统

```bash
# 删除所有任务
openclaw cron list --json | jq -r '.[].id' | xargs -I {} openclaw cron remove {}

# 重新启动时，再次运行
./setup-autonomous-agent.sh
```

## 📊 预期时间线

### 第 1 天
- 00:00 - 启动系统
- 00:05 - 第一次执行，开始调研
- 00:10 - 继续调研
- 08:00 - 第一次每日复盘

### 第 1 周
- 每天收到 288 条进度报告（每 5 分钟一次）
- 每天收到 1 条每日复盘
- 周一收到 1 条每周评估

### 第 1 个月
- Agent 完成调研，制定策略，开始创作内容
- 你会收到约 8,640 条进度报告
- 你会收到 30 条每日复盘
- 你会收到 4 条每周评估

## ⚠️ 重要提醒

### Discord 消息量
- 每 5 分钟一条 = 每天 288 条
- 如果觉得太多，可以改为 15 分钟（每天 96 条）或 30 分钟（每天 48 条）

### 成本估算
- 每次执行约 $0.01-0.05
- 每天 288 次 = $3-15/天
- 每月约 $90-450

### 如何减少成本
```bash
# 方案 1: 降低频率（推荐）
--every "15m"  # 成本降低 67%

# 方案 2: 使用更便宜的模型
--model "sonnet"  # 而不是 "opus"

# 方案 3: 只在工作时间运行
--cron "*/5 8-20 * * *"  # 只在 8:00-20:00 每 5 分钟运行
```

## 🎉 开始使用

```bash
# 1. 启动系统
./setup-autonomous-agent.sh

# 2. 测试一下
./test-agent.sh

# 3. 查看 Discord，等待进度报告

# 4. 享受 Agent 为你工作！
```

Agent 现在会：
- ✅ 每 5 分钟自动执行任务
- ✅ 每次执行后发送进度到 Discord
- ✅ 遇到需要决策的地方通知你
- ✅ 每天/每周发送总结报告
- ✅ 持续迭代，直到达成目标

你只需要：
- 📱 每天看一眼 Discord
- 🤔 遇到决策时给出意见
- 🎯 定期调整目标和策略

**Agent 会像一个真正的员工一样，自己工作，自己汇报，自己迭代！** 🦞
