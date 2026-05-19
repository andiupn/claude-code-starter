# Agents — Specialized Claude Instances (LITE)

Template LITE menyertakan **3 core agents** untuk task paling umum:

## Agent Inventory

### `@code-reviewer`
- **Model:** Sonnet + extended thinking
- **Trigger:** Review kode sebelum commit, security audit, validasi conventions
- **Skip:** Formatting changes minor, active implementation (use main session)
- **Use:** `@code-reviewer: Review file src/auth.ts untuk security`

### `@research-assistant`
- **Model:** Haiku (~60% lebih hemat)
- **Trigger:** Riset library/API, "compare X vs Y", lookup dokumentasi, design decision research
- **Skip:** Implementation langsung, debugging aktif, task yang butuh konteks codebase saja
- **Use:** `@research-assistant: Bandingkan Riverpod vs BLoC untuk Flutter state mgmt`

### `@architecture-reviewer`
- **Model:** Sonnet + extended thinking (12K)
- **Trigger:** Review struktur modul, circular dependency, refactoring besar, evaluasi struktur direktori
- **Skip:** Line-level code review (use code-reviewer), single function review
- **Use:** `@architecture-reviewer: Review struktur folder src/, ada circular dependency?`

---

## Cost Tiering

| Agent | Model | Relative Cost |
|---|---|---|
| `@research-assistant` | Haiku | ~0.4x |
| `@code-reviewer` | Sonnet + thinking | ~1.2x |
| `@architecture-reviewer` | Sonnet + 12K thinking | ~1.4x |

**Tips:** Pakai `@research-assistant` untuk SEMUA task riset — paling hemat.

---

## Want More Agents?

PRO version menyertakan 2 agent tambahan:
- **`@planner`** (Opus + 32K thinking) — Deep planning untuk task kompleks
- **`@security-reviewer`** (Sonnet + 12K thinking) — Security audit, vuln check

👉 [Get PRO at kuncimu.com](https://kuncimu.com) — hanya $1-5

---

## Adding Custom Agents

Buat file `.md` baru di `.claude/agents/` dengan frontmatter:

```markdown
---
name: my-agent
description: Brief description (one line)
tools: Read, Grep, Glob
model: sonnet
---

System prompt untuk agent...
```

Lalu validate dengan `/validate-agent-config`.
