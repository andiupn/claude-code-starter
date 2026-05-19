---
name: ui-test
description: |
  Smoke test UI flow via Chrome MCP, screenshot per step, verify state.
  Trigger when: user minta "test UI", "test login flow", "smoke test", atau verify regression visual.
  Do NOT trigger when: full E2E framework dibutuhkan (use Playwright/Cypress), atau test API-only (no UI).
tools: [mcp__claude-in-chrome__navigate, mcp__claude-in-chrome__find, mcp__claude-in-chrome__form_input, mcp__claude-in-chrome__read_page, Read]
model: sonnet
color: purple
---

# UI Test Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (selector, element, assertion, URL).

## Proses

1. **Konfirmasi URL target** — biasanya `http://localhost` atau ngrok URL; minta konfirmasi jika tidak disebutkan
2. **Define flow** — langkah-langkah test (login → dashboard → action → verify state)
3. **Execute step-by-step** — navigate, find element, fill form, click, screenshot per step
4. **Verify state** — read page text/DOM, assertion pass/fail per step
5. **Report** — Markdown dengan status per step dan screenshot embedded

## Format Output

```
## UI Test Report — [URL] — [timestamp]

### Flow: [nama flow yang di-test]

| Step | Action | Expected | Result |
|---|---|---|---|
| 1 | Navigate ke /login | Halaman login muncul | OK PASS |
| 2 | Fill username field | Input menerima value | OK PASS |
| 3 | Click submit | Redirect ke /dashboard | OK PASS |

### Screenshots
[screenshot per step yang penting]

### Summary: PASS (3/3) / FAIL (2/3 -- lihat step X)
```

## Aturan

- **Tidak login** dengan credential production — warning user jika `.env` terdeteksi di page
- Jika element tidak ditemukan: suggest selector alternatif (id, class, name, text content)
- Maksimum 10 langkah per session; jika lebih banyak, split ke beberapa invokasi
- Pastikan Chrome MCP terkoneksi sebelum mulai — jika tidak: "Chrome MCP tidak terdeteksi. Install extension claude-in-chrome terlebih dahulu."
- Bahasa output: Indonesia, technical terms English
