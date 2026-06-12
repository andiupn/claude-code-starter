# Nybörjarmall Claude — LITE Edition 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <strong>Svenska</strong> | <a href="README.ro.md">Română</a>
</div>
<br>

<div align="center">
  <h3><strong>AI-ingenjörer behöver regler, inte bara beräkningskraft.</strong></h3>
  <p><strong>En enkel, nybörjarvänlig Claude Code-arbetsytamall med 3 kärnagenter, 6 viktiga färdigheter och förkonfigurerade arbetsyteregler.</strong></p>

  <p>Sluta slåss mot Claude CLI om katalogåtkomst, löst sammanhang och röriga git-commits. Arbeta med Claude Code så som den designades för att användas.</p>
</div>

> 📦 Gratis mall från **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licensierad under [MIT + Attribution](LICENSE.md)  
> ☕ Om det är användbart, [köp mig en kaffe](https://ko-fi.com/andiupn) · 🚀 Behöver du avancerade monorepos? Prova [PRO-versionen](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Problemet: Claude CLIs röran
Som standard är Claude Code CLI otroligt snabb. Men utan förkonfigurerad sandboxing och regler kommer den kontinuerligt att be om bekräftelse, gå vilse i djupt kapslade vägar och skapa röriga git-commits som förstör ditt teams arbetsflöde för pull-begäran.

---

## ⚡ Lösningen: Orörd Claude Sandbox

### 1. 🤖 3 specialiserade Otonom-agenter
Du pratar inte med en generisk chatbot. Du får ett team med 3 förkonfigurerade, högt specialiserade och autonoma AI-agenter:
- **`@code-reviewer`** — Granska din kodkvalitet och struktur innan du bestämmer dig.
- **`@research-assistant`** — Undersöker API-dokument och bibliotek på ett säkert sätt på kostnadseffektiva Claude-3-Haiku.
- **`@architecture-reviewer`** — Recenserar modularitet och strukturell design.

### 2. ⚡ 6 grundläggande färdigheter (automatisering)
Färdiga arbetsflöden (`/skills`) som låter Claude utföra komplexa utvecklingsarbetsflöden direkt:
- `/git-workflow` — Strukturerade åtaganden + automatiska säkerhetskontroller.
- `/context-handoff` — Sparar aktiv arbetsytakontext innan du kör `/compact`.
- `/test-writer` & `/experiment-scaffold` — Accelerera tekniska cykler.

### 3. 📂 Organiserad arbetsytastruktur
Behåll dina huvudfiler i `src/`, dina AI-regler i `.claude/` och din forskning i `docs/`. Claude Code vet omedelbart gränsen och sparar din tokenbudget.

---

## 📊 LITE vs PRO: Premium-uppgraderingen

LITE-versionen är begränsad till 3 agenter, 6 färdigheter och 1 förinställning. För professionell utveckling och funktioner på byrånivå:

| LITE (gratis) | PRO ($1-5) |
|---|---|
| 3 agenter | 5 agenter (+ planerare, säkerhetsgranskare) |
| 6 färdigheter | 17 färdigheter (+ kunskapshantering, stackfelsökning, etc.) |
| 1 förinställning (generisk) | 10 förinställningar (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 MCP-servrar | 6 MCP-servrar |
| Inga git krokar | Förkonfigurerade Git-krokar (env-guard, tsc-check) |
| Enkel struktur | Status-första multi-projekt monorepo (`active/`, `staging/`, etc.) |

👉 **[Hämta PRO-versionen på GitHub-sponsorer](https://github.com/sponsors/andiupn?frequency=monthly)** · Fullständig information: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Snabbstart (3 steg)

```bash
# 1. Setup environment
cp .env.example .env
# Edit .env and fill in your GITHUB_TOKEN

# 2. Setup permissions
cp .claude/settings.local.example.json .claude/settings.local.json
# Edit according to your OS (Linux/macOS/Windows)

# 3. Customize CLAUDE.md
# Replace {{PROJECT_NAME}} with your project's name
```

Öppna den här mappen i Claude Code och börja koda!

---

## 💖 Stöd detta projekt (donationer)

Denna mall är gratis och öppen källkod. Om det hjälpte dig, överväg att stödja:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Tack och erkännande

Den här mallen är skapad av **andiupn**.
- 🌐 Webbplats: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-post: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Tillskrivningskrav:** Om du omdistribuerar eller delar den här mallen, vänligen behåll denna kreditspärr i `CLAUDE.md` och `README.md` (enligt [LICENSE.md](LICENSE.md)).