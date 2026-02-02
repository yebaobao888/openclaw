# AI 工具使用 - 快速参考

## ✅ 已添加技能

技能位置：`~/.openclaw/workspace/skills/ai-tools-usage/SKILL.md`

这个技能教会 Agent 如何正确使用 7 个 AI 工具。

## 🛠️ 7 个工具的使用方法

### 1. ChatGPT (chatgpt.com)
```
用途：内容生成、分析、头脑风暴
步骤：
1. browser navigate https://chatgpt.com
2. browser snapshot
3. browser act type "你的提示词"
4. browser act click "send-button"
5. 等待 10 秒
6. browser snapshot
7. 提取结果
```

### 2. Gemini (gemini.google.com)
```
用途：实时信息搜索、多语言翻译
步骤：
1. browser navigate https://gemini.google.com
2. browser snapshot
3. browser act type "你的查询"
4. browser act click
5. 等待 10 秒
6. browser snapshot
7. 提取结果
```

### 3. Manus (manus.im)
```
用途：深度研究、长文写作
步骤：
1. browser navigate https://manus.im
2. browser snapshot
3. browser act click "new-document"
4. browser act type "你的内容"
5. 使用 AI 辅助
6. browser snapshot
```

### 4. Grok (x.com/i/grok)
```
用途：X 平台趋势分析、实时热点
步骤：
1. browser navigate https://x.com/i/grok
2. browser snapshot
3. browser act type "你的查询"
4. browser act click
5. 等待 10 秒
6. browser snapshot
7. 提取结果
```

### 5. Perplexity (perplexity.ai)
```
用途：深度调研、带引用的答案（推荐用于调研）
步骤：
1. browser navigate https://perplexity.ai
2. browser snapshot
3. browser act type "你的搜索查询"
4. browser act click 或 Enter
5. 等待 15 秒
6. browser snapshot
7. 提取答案和引用链接
```

### 6. Leonardo.ai (leonardo.ai)
```
用途：AI 图像生成
步骤：
1. browser navigate https://leonardo.ai
2. browser snapshot
3. browser act click "create-image"
4. browser act type "图像描述提示词"
5. browser act click "generate"
6. 等待 60 秒
7. browser snapshot
8. browser act click "download"
```

### 7. Suno (suno.com)
```
用途：AI 音乐生成
步骤：
1. browser navigate https://suno.com
2. browser snapshot
3. browser act click "create"
4. browser act type "音乐描述"
5. browser act click "generate"
6. 等待 120 秒
7. browser snapshot
8. browser act click "download"
```

## 🎯 关键要点

### 1. 每次操作都要 snapshot
```
browser navigate [url]
browser snapshot  ← 必须！找到元素 ref
browser act ...
browser snapshot  ← 必须！确认操作成功
```

### 2. 等待时间很重要
```
ChatGPT/Gemini/Grok: 10 秒
Perplexity: 15 秒
Leonardo.ai: 60 秒
Suno: 120 秒
```

### 3. 工具选择
```
调研 → Perplexity（首选，带引用）
内容生成 → ChatGPT
长文写作 → Manus
X 平台分析 → Grok
实时信息 → Gemini
图像 → Leonardo.ai
音频 → Suno
```

## 📋 完整示例

### 任务：调研 AI 工具变现策略

```
步骤 1: 用 Perplexity 调研
1. browser navigate https://perplexity.ai
2. browser snapshot
3. browser act type "AI tools monetization strategies 2026"
4. 等待 15 秒
5. browser snapshot
6. 提取答案（包含引用链接）

步骤 2: 用 ChatGPT 分析
1. browser navigate https://chatgpt.com
2. browser snapshot
3. browser act type "分析这些变现策略：[从 Perplexity 获取的内容]"
4. 等待 10 秒
5. browser snapshot
6. 提取分析结果

步骤 3: 用 Manus 整理
1. browser navigate https://manus.im
2. browser snapshot
3. browser act click "new-document"
4. 整理成结构化文档
5. browser snapshot
```

## ✅ 验证技能已加载

```bash
# 查看技能文件
cat ~/.openclaw/workspace/skills/ai-tools-usage/SKILL.md

# 重启 Gateway（已完成）
pnpm openclaw gateway restart

# 检查状态
pnpm openclaw gateway status
```

## 🎉 现在 Agent 知道如何使用这些工具了！

Agent 会：
- ✅ 正确使用 browser 工具访问 AI 工具
- ✅ 知道每个工具的具体步骤
- ✅ 知道需要等待多久
- ✅ 知道如何提取结果
- ✅ 知道什么时候用哪个工具

下次执行任务时，Agent 会参考这个技能文档，正确使用这 7 个 AI 工具！
