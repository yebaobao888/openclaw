# AI 自媒体变现 Agent 正确使用指南

## 问题诊断

当前 Agent 只是"计划 + 回复"，没有真正执行长期任务。

## 解决方案：创建自主运行的 Sub-Agent

### 第一步：创建一个专门的调研 Agent

在 Discord 中发送：

```
使用 sessions_spawn 工具创建一个独立的调研 Agent，任务如下：

task: "你是我的 AI 自媒体变现调研助手。目标：
1. 每天自动调研 AI 工具变现的最新趋势
2. 分析 X/YouTube/小红书/B站 上的成功案例
3. 每天早上 8 点给我发送调研报告到 Discord

具体执行：
- 用 browser 工具访问 Perplexity/Gemini/ChatGPT
- 搜索 'AI tools monetization 2026'、'AI content creator income' 等关键词
- 提取 5 个最新的变现策略
- 用 cron 工具设置每天早上 8 点的定时任务
- 用 message 工具把报告发送到 Discord channelId 1466468518181470248

现在立即开始第一次调研，完成后设置定时任务。"

label: "AI 变现调研助手"
agentId: main
cleanup: keep
```

### 第二步：验证 Sub-Agent 是否在运行

```bash
# 查看所有 session
openclaw sessions list --kinds subagent

# 查看 Sub-Agent 的日志
openclaw sessions history --session-key "agent:main:subagent:<uuid>"
```

### 第三步：设置定时任务（如果 Sub-Agent 没有自动设置）

```bash
openclaw cron add \
  --name "每日 AI 变现调研" \
  --cron "0 8 * * *" \
  --tz "Asia/Shanghai" \
  --session isolated \
  --message "执行今天的 AI 变现调研：
1. 用 browser 访问 Perplexity，搜索 'AI tools monetization trends 2026'
2. 用 browser 访问 X.com，搜索 'AI creator income'
3. 提取 5 个最新策略
4. 用 message 工具发送到 Discord channelId 1466468518181470248" \
  --deliver \
  --channel discord \
  --to "1466468518181470248"
```

## 方案对比

### ❌ 错误方式（当前）
```
"帮我做 AI 自媒体变现调研"
→ Agent 回复一个计划
→ 什么都不做
```

### ✅ 正确方式 1：Sub-Agent
```
"用 sessions_spawn 创建一个调研 Agent，任务是..."
→ 创建独立的 Agent 会话
→ 这个 Agent 持续运行
→ 定期汇报结果
```

### ✅ 正确方式 2：Cron + 明确指令
```
"设置一个每天 8 点的 cron 任务，执行以下步骤：
1. 打开浏览器访问 Perplexity
2. 搜索 'AI tools monetization'
3. 提取 5 个策略
4. 发送到 Discord"
→ 每天自动执行
```

## 关键区别

| 方式 | Agent 行为 | 持续性 |
|------|-----------|--------|
| "帮我做调研" | 只回复计划 | ❌ 一次性 |
| `sessions_spawn` | 创建独立 Agent | ✅ 持续运行 |
| `cron` + 明确步骤 | 定时执行具体任务 | ✅ 定时运行 |

## 测试命令

### 1. 查看当前所有 session
```bash
openclaw sessions list --kinds all
```

### 2. 查看 cron 任务
```bash
openclaw cron list
```

### 3. 手动触发 cron 任务（测试）
```bash
openclaw cron run <jobId> --force
```

### 4. 查看 Sub-Agent 的执行历史
```bash
openclaw sessions history --session-key "agent:main:subagent:<uuid>" --limit 50
```

## 下一步

1. 在 Discord 中发送上面的 `sessions_spawn` 命令
2. 等待 5 分钟，看 Agent 是否真的在执行
3. 用 `openclaw sessions list` 验证 Sub-Agent 是否存在
4. 查看浏览器是否有活动

如果还是不工作，说明需要更明确的"动词 + 对象"指令。
