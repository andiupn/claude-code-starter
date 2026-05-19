# Skills — Reusable Workflow Automation (LITE)

Template LITE menyertakan **6 essential skills**. Trigger via `/<skill-name>`.

## Skill Inventory

### `/git-workflow`
Structured git commit + push dengan safety check (no force push, no merge ke main langsung).
**Use:** `/git-workflow` setelah selesai sebuah feature.

### `/experiment-scaffold`
Buat folder experiment baru dengan README template.
**Use:** `/experiment-scaffold nama-experiment`

### `/test-writer`
Generate unit test dari function signature (deteksi framework otomatis).
**Use:** `/test-writer src/utils/parser.ts`

### `/validate-agent-config`
Cek parity antara `AGENTS.md` vs actual file di `.claude/agents/`. Detect orphan, missing, mismatch.
**Use:** `/validate-agent-config` setelah edit agent.

### `/context-handoff`
Save ringkasan session ke `.claude/memory/` sebelum context reset / `/compact`.
**Use:** `/context-handoff` ketika context >70%.

### `/init-project`
Scaffold AI rules ke project baru. LITE menyertakan **preset `generic`** saja (stack-agnostic).
**Use:** `/init-project --preset generic` saat clone template ini ke project baru.

---

## Cost-Saving Tips

- `/test-writer` & `/git-workflow` — instan, no LLM call (deterministic scripts)
- `/context-handoff` — gunakan sebelum context 80% untuk hindari information loss
- Untuk session panjang, jalankan `/context-handoff` lalu mulai sesi baru (lebih hemat daripada `/compact`)

---

## Want More Skills?

PRO version menyertakan **17 skills** total, termasuk:

**Knowledge management:**
- `/research-new` — Buat file riset dengan auto-frontmatter
- `/plan-new` — Buat file plan implementasi
- `/task-add` — Tambah ke BACKLOG dengan auto-ID
- `/knowledge-extract` — Harvest insight dari session ke wiki
- `/knowledge-harvest` — Serap knowledge dari project eksternal
- `/rules-maintenance` — Audit kesehatan AI rules workspace

**Stack-specific:**
- `/log-monitor` — Stream Docker/Laravel/Flutter logs realtime
- `/stack-debug` — Health check Caddy/Nginx/PHP-FPM/MySQL/Redis
- `/ui-test` — Smoke test UI via Chrome MCP

**Utility:**
- `/wiki-lint` — Validate `.claude/wiki/` broken links
- `/memory-promote` — Promote lesson ke parent workspace

👉 [Get PRO at kuncimu.com](https://kuncimu.com)

---

## Adding Custom Skills

Buat folder `.claude/skills/<skill-name>/` dengan `SKILL.md`:

```markdown
---
name: my-skill
description: |
  When to trigger this skill.
  Multi-line OK.
---

Instructions untuk Claude saat skill ini di-invoke.
```

Skills auto-discover by Claude Code at startup.
