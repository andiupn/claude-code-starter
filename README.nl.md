# Startersjabloon Claude — LITE-editie 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <strong>Nederlands</strong> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>

<br />

<div align="center">
  <h3><strong>AI Ingenieurs hebben regels nodig, niet alleen rekenkracht.</strong></h3>
  <p><strong>Een eenvoudige, beginnersvriendelijke Claude Code-werkruimtesjabloon met 3 kernagenten, 6 essentiële vaardigheden en vooraf geconfigureerde werkruimteregels.</strong></p>

  <p>Stop met het vechten tegen Claude CLI over maptoegang, losse context en rommelige git-commits. Werk met Claude Code zoals het is ontworpen om te worden gebruikt.</p>
</div>

> 📦 Gratis sjabloon van **andiupn** ([kuncimu.com](https://kuncimu.com)) · Gelicentieerd onder [MIT + Attribution](LICENSE.md)  
> ☕ Indien nuttig, [koop een koffie voor me](https://ko-fi.com/andiupn) · 🚀 Geavanceerde monorepos nodig? Probeer de [PRO-versie](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Het probleem: de rommel van Claude CLI
Standaard is de Claude Code CLI ongelooflijk snel. Zonder vooraf geconfigureerde sandboxing en regels zal het echter voortdurend om bevestiging vragen, verdwalen in diep geneste paden en rommelige git-commits creëren die de pull-request-workflow van je team verpesten.

---

## ⚡ De oplossing: ongerepte Claude-zandbak

### 1. 🤖 3 gespecialiseerde Otonom-agenten
Je praat niet met een generieke chatbot. Je krijgt een team van 3 vooraf geconfigureerde, zeer gespecialiseerde en autonome AI-agenten:
- **`@code-reviewer`** — Beoordeel de kwaliteit en structuur van uw code voordat u commits maakt.
- **`@research-assistant`** — Onderzoekt API-documenten en bibliotheken veilig op kosteneffectieve Claude-3-Hiku.
- **`@architecture-reviewer`** — Beoordelingen van modulariteit en structureel ontwerp.

### 2. ⚡ 6 essentiële vaardigheden (automatisering)
Kant-en-klare workflows (`/skills`) waarmee Claude complexe ontwikkelingsworkflows direct kan uitvoeren:
- `/git-workflow` — Gestructureerde commits + geautomatiseerde veiligheidscontroles.
- `/context-handoff` — Slaat de actieve werkruimtecontext op voordat `/compact` wordt uitgevoerd.
- `/test-writer` & `/experiment-scaffold` — Versnel engineeringcycli.

### 3. 📂 Georganiseerde werkruimtestructuur
Bewaar uw hoofdbestanden in `src/`, uw AI-regels in `.claude/` en uw onderzoek in `docs/`. Claude Code kent onmiddellijk de grens, waardoor u uw tokenbudget bespaart.

---

## 📊 LITE versus PRO: de premium-upgrade

De LITE-versie is beperkt tot 3 agenten, 6 vaardigheden en 1 preset. Voor functies voor professionele ontwikkeling en bureauniveau:

| LITE (gratis) | PRO ($1-5) |
|---|---|
| 3 agenten | 5 agenten (+ planner, security-reviewer) |
| 6 vaardigheden | 17 vaardigheden (+ kennisbeheer, stack-debug, enz.) |
| 1 voorinstelling (algemeen) | 10 presets (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 MCP-servers | 6 MCP-servers |
| Geen git-hooks | Vooraf geconfigureerde Git-hooks (env-guard, tsc-check) |
| Eenvoudige structuur | Status-eerste monorepo voor meerdere projecten (`active/`, `staging/`, enz.) |

👉 **[Krijg de PRO-editie op GitHub-sponsors](https://github.com/sponsors/andiupn?frequency=monthly)** · Volledige details: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Snelle start (3 stappen)

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

Open deze map in Claude Code en begin met coderen!

---

## 💖 Steun dit project (donaties)

Deze sjabloon is gratis en open source. Als het je heeft geholpen, overweeg dan om:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Credits en toeschrijving

Deze sjabloon is gemaakt door **andiupn**.
- 🌐 Website: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Toeschrijvingsvereiste:** Als u deze sjabloon opnieuw distribueert of afsplitst, laat deze kredietblokkering dan in `CLAUDE.md` en `README.md` (volgens [LICENSE.md](LICENSE.md)).