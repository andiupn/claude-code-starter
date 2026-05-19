---
name: validate-agent-config
description: |
  Validasi parity antara AGENTS.md documentation dan agent definition files (yaml frontmatter).
  Trigger when: user invoke /validate-agent-config, atau sebelum commit perubahan agent rules.
  Do NOT trigger when: user hanya read agents tanpa ada perubahan.
tools: [Read, Glob, Grep]
model: haiku
color: orange
agent: true
---

# Validate Agent Config Skill

## Proses

1. **Discover agent files** — Glob `.claude/agents/*.md` untuk dapatkan semua agent definitions
2. **Parse frontmatter** — Read setiap file, extract `name`, `tools`, `model` dari YAML frontmatter (antara `---` pertama dan `---` kedua)
3. **Read AGENTS.md inventory** — Read `.claude/AGENTS.md`, locate tabel "Agent Inventory", parse baris per agent (kolom: name, tools, model)
4. **Compare per-agent:**
   - Apakah setiap `name` di frontmatter ada di tabel AGENTS.md?
   - Apakah `tools` list match? (order tidak penting, set equality)
   - Apakah `model` match?
   - Apakah ada agent di AGENTS.md yang tidak punya file definition?
   - Apakah `thinking` field (jika ada) punya `enabled` boolean dan `budget_tokens` integer >= 1000?
5. **Report** — Output tabel hasil comparison, kesimpulan PASS/FAIL, dan rekomendasi

## Format Output

```
## Agent Config Validation Report

### Status: PASS ✅ / FAIL ❌

| Agent | Field | File Value | AGENTS.md Value | Match |
|---|---|---|---|---|
| code-reviewer | tools | Read, Grep, Glob | Read, Grep, Glob | ✅ |
| code-reviewer | model | sonnet | Sonnet | ✅ |
| code-reviewer | thinking | enabled=true, budget=8000 | — | ✅ valid |
| research-assistant | tools | WebSearch, WebFetch, Read, Glob | WebSearch, WebFetch, Read, Glob | ✅ |
| research-assistant | model | haiku | Haiku | ✅ |
| architecture-reviewer | thinking | enabled=true, budget=12000 | — | ✅ valid |

### Orphan Check
- Agent files tanpa entry di AGENTS.md: [none / list names]
- AGENTS.md entries tanpa agent file: [none / list names]

### Recommendations
- [If FAIL] Sebutkan file mana yang harus diupdate dan field mana yang mismatch
- [If PASS] "Semua agent config dalam kondisi sinkron. Tidak ada aksi diperlukan."
```

## Aturan

- **Read-only:** jangan auto-fix, hanya report dan rekomendasikan
- Model comparison case-insensitive (`sonnet` == `Sonnet`)
- Tools comparison: normalize ke sorted list sebelum compare (order tidak penting)
- Jika AGENTS.md tidak ada section "Agent Inventory": report sebagai error konfigurasi
- Jika frontmatter YAML tidak valid: report "Frontmatter tidak valid di `<file>` — periksa syntax YAML"
- Bahasa output: Indonesia, technical terms (file path, field name, tool name) dalam English
