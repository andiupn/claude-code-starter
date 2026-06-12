# 入门模板 Claude — LITE 版 🚀

<div align="center">
  <strong>英语</strong> | <a href="README.id.md">印度尼西亚语</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">法语（加拿大）</a> | <a href="README.de.md">德语</a> | <a href="README.fr.md">法语</a> | <a href="README.pt-br.md">葡萄牙语（巴西）</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">波兰斯基</a>
</div>

<br />

<div align="center">
  <h3><strong>AI 工程师需要规则，而不仅仅是计算能力。</strong></h3>
  <p><strong>一个简单、适合初学者的 Claude Code 工作区模板，具有 3 个核心代理、6 项基本技能和预配置的工作区规则。</strong></p>

  <p>停止在目录访问、松散上下文和混乱的 git 提交方面与 Claude CLI 发生冲突。按照 Claude Code 的设计使用方式使用它。</p>
</div>

> 📦 **andiupn** 提供的免费模板 ([kuncimu.com](https://kuncimu.com)) · 已获得 [MIT + 归属](LICENSE.md) 许可  
> ☕ 如果有用，[请我喝杯咖啡](https://ko-fi.com/andiupn) · 🚀 需要高级 monorepos？尝试[专业版](https://github.com/sponsors/andiupn?frequency=monthly)

__徽章_0__
__徽章_1__
__徽章_2__
__徽章_3__
__徽章_4__
__徽章_5__

---

## 💡 问题：Claude CLI 的混乱
默认情况下，Claude Code CLI 的速度非常快。然而，如果没有预先配置的沙箱和规则，它将不断要求确认，迷失在深层嵌套的路径中，并创建混乱的 git 提交，从而破坏团队的拉取请求工作流程。

---

## ⚡ 解决方案：原始的克劳德沙盒

### 1. 🤖 3 名专业 Otonom 特工
您不会与通用聊天机器人交谈。您将获得一支由 3 个预配置、高度专业化且自主的 AI 代理组成的团队：
- **`@code-reviewer`** — 在提交之前检查您的代码质量和结构。
- **`@research-assistant`** — 在经济高效的 Claude-3-Haiku 上安全地研究 API 文档和库。
- **`@architecture-reviewer`** — 审查模块化和结构设计。

### 2. ⚡ 6 项基本技能（自动化）
即用型工作流程 (`/skills`) 让 Claude 可以立即执行复杂的开发工作流程：
- `/git-workflow` — 结构化提交+自动安全检查。
- `/context-handoff` — 在运行 `/compact` 之前保存活动工作区上下文。
- `/test-writer` 和 `/experiment-scaffold` — 加快工程周期。

### 3. 📂 有组织的工作空间结构
将您的主文件保存在 `src/` 中，将您的 AI 规则保存在 `.claude/` 中，将您的研究保存在 `docs/` 中。 Claude Code 立即知道边界，节省您的代币预算。

---

## 📊 LITE 与 PRO：高级升级

LITE 版本仅限 3 个特工、6 个技能和 1 个预设。对于专业发展和机构级功能：

|精简版（免费）|专业版 ($1-5) |
|---|---|
| 3 代理 | 5 名代理（+ 规划员、安全审核员）|
| 6 技能 | 17项技能（+知识管理、堆栈调试等）|
| 1 个预设（通用）| 10 个预设（PHP、Node、Next.js、Flutter、RN、Yii 等）|
| 3 个 MCP 服务器 | 6 个 MCP 服务器 |
|没有 git hooks |预配置的 Git 挂钩（env-guard、tsc-check）|
|结构简单|状态优先的多项目单一存储库（`active/`、`staging/` 等）|

👉 **[在 GitHub 赞助商上获取专业版](https://github.com/sponsors/andiupn?frequency=monthly)** · 完整详细信息：[COMPARISON.md](COMPARISON.md)

---

## 🚀 快速入门（3 个步骤）

__代码_块_0__

在 Claude Code 中打开此文件夹，然后开始编码！

---

## 💖 支持这个项目（捐款）

该模板是免费且开源的。如果对您有帮助，请考虑支持：
- **Ko-fi：** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon：** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer：** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria：** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 制作人员与归属

该模板由 **andiupn** 创建。
- 🌐 网站：[kuncimu.com](https://kuncimu.com)
- 💻 GitHub：[github.com/andiupn](https://github.com/andiupn)
- ✉️电子邮件：[andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**归属要求：** 如果您重新分发或分叉此模板，请将此信用块保留在 `CLAUDE.md` 和 `README.md` 中（根据 [LICENSE.md](LICENSE.md)）。