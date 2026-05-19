# Starter Template Claude — LITE Edition

**Simple, beginner-friendly Claude Code workspace template** dengan 3 core agents + 6 essential skills. Cocok untuk yang baru kenal Claude Code dan ingin start project baru dengan rules yang clean.

> 📦 Free template by **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licensed under [MIT + Attribution](LICENSE.md)
> ☕ If useful, [buy me a coffee](https://ko-fi.com/andiupn) · 🚀 Need more features? Try [PRO version](https://kuncimu.com)

---

## What's Inside

| Komponen | Jumlah |
|---|---|
| Specialized agents | 3 |
| Workflow skills | 6 |
| MCP servers | 3 (minimal) |
| Stack preset | 1 (generic) |

## Quick Start (3 langkah)

```bash
# 1. Setup environment
cp .env.example .env
# Edit .env, isi GITHUB_TOKEN

# 2. Setup permissions
cp .claude/settings.local.example.json .claude/settings.local.json
# Edit sesuai OS (Linux/macOS/Windows)

# 3. Customize CLAUDE.md
# Replace {{PROJECT_NAME}} dengan nama project Anda
```

Buka folder ini di Claude Code, lalu mulai coding!

## Agents (3)

| Agent | Untuk apa |
|---|---|
| `@code-reviewer` | Review kode sebelum commit |
| `@research-assistant` | Riset library/API (pakai Haiku, hemat) |
| `@architecture-reviewer` | Review struktur modul |

## Skills (6)

```
/git-workflow          # commit terstruktur + safety check
/experiment-scaffold   # buat folder experiment baru
/test-writer           # generate unit test
/validate-agent-config # cek agent config valid
/context-handoff       # save context sebelum /compact
/init-project          # scaffold rules ke project baru (preset: generic)
```

## Folder Structure

```
.claude/         # Claude Code config (agents, skills, wiki, settings)
src/             # Your code here
docs/            # Optional: research/, plans/, templates/
```

Tambahkan struktur sesuai kebutuhan project Anda (web app? CLI tool? library?).

## Behavioral Rules (Default)

- Keep diffs small, targeted changes only
- Document only the WHY (not the WHAT)
- Ask before creating new top-level dirs
- Never commit tanpa konfirmasi user

Detail lengkap di [CLAUDE.md](CLAUDE.md).

## Documentation

| File | Isi |
|---|---|
| [CLAUDE.md](CLAUDE.md) | Workspace rules dan conventions |
| [.claude/AGENTS.md](.claude/AGENTS.md) | Cara pakai 3 agents |
| [.claude/SKILLS.md](.claude/SKILLS.md) | Daftar 6 skills + when-to-use |
| [COMPARISON.md](COMPARISON.md) | LITE vs PRO — fitur yang ditambahkan di PRO |
| [LICENSE.md](LICENSE.md) | MIT License + Attribution clause |

---

## Credits & Attribution

This template created by **andiupn**.

- 🌐 Website: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Email: andi.upn@gmail.com

**Attribution requirement:** Jika Anda redistribute/fork template ini, harap pertahankan credit block ini di CLAUDE.md & README.md (sesuai [LICENSE.md](LICENSE.md)).

## Support This Project ☕

Template ini gratis dan open-source. Jika bermanfaat, pertimbangkan untuk mendukung:

| Platform | Link |
|---|---|
| ☕ Ko-fi (one-time / monthly) | [ko-fi.com/andiupn](https://ko-fi.com/andiupn) |
| 🎨 Patreon (monthly) | [patreon.com/AndiUpn](https://patreon.com/AndiUpn) |
| 🇮🇩 Trakteer (Indonesia) | [trakteer.id/andi_upn](https://trakteer.id/andi_upn) |
| 🇮🇩 Saweria (Indonesia) | [saweria.co/andiupn](https://saweria.co/andiupn) |

Donasi Anda membantu maintenance + improvement template ini ❤️

## Upgrade to PRO

LITE version dibatasi 3 agents, 6 skills, 1 preset. Untuk fitur lengkap:

| LITE (gratis) | PRO ($1-5) |
|---|---|
| 3 agents | 5 agents (+ planner, security-reviewer) |
| 6 skills | 17 skills (+ knowledge mgmt, stack-debug, etc.) |
| 1 preset (generic) | 10 presets (PHP, Node, Next.js, Flutter, RN, Yii, dll) |
| 3 MCP servers | 6 MCP servers |
| No hooks | Hooks (env-guard, tsc-check) |
| Simple struktur | Status-first multi-project (active/staging/archive) |

👉 **[Get PRO at kuncimu.com](https://kuncimu.com)**

Detail lengkap: [COMPARISON.md](COMPARISON.md)
