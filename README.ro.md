# Șablon de pornire Claude — Ediția LITE 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <strong>Română</strong>
</div>

<br />

<div align="center">
  <h3><strong>Inginerii AI au nevoie de reguli, nu doar de putere de calcul.</strong></h3>
  <p><strong>Un șablon de spațiu de lucru Claude Code simplu, prietenos pentru începători, care include 3 agenți de bază, 6 abilități esențiale și reguli preconfigurate pentru spațiul de lucru.</strong></p>

  <p>Nu mai luptați cu Claude CLI pentru accesul la director, contextul liber și comiterile git dezordonate. Lucrați cu Claude Code așa cum a fost conceput pentru a fi utilizat.</p>
</div>

> 📦 Șablon gratuit de la **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licențiat sub [MIT + Atribuire](LICENSE.md)  
> ☕ Dacă este util, [cumpără-mi o cafea](https://ko-fi.com/andiupn) · 🚀 Ai nevoie de monorepo avansate? Încercați [versiunea PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Problema: dezordinea lui Claude CLI
În mod implicit, CLI Claude Code este incredibil de rapid. Cu toate acestea, fără sandbox și reguli preconfigurate, acesta va cere în mod continuu confirmarea, se va pierde în căi profund imbricate și va crea comiteri git dezordonate care ruinează fluxul de lucru al solicitărilor de extragere al echipei tale.

---

## ⚡ Soluția: Cutia de nisip Claude curată

### 1. 🤖 3 Agenți Specializați Otonom
Nu vorbești cu un chatbot generic. Obțineți o echipă de 3 agenți AI preconfigurați, foarte specializați și autonomi:
- **`@code-reviewer`** — Revizuiește calitatea și structura codului înainte de comitere.
- **`@research-assistant`** — Cercetează documentele și bibliotecile API în siguranță pe Claude-3-Haiku rentabil.
- **`@architecture-reviewer`** — Evaluează modularitatea și designul structural.

### 2. ⚡ 6 abilități esențiale (automatizări)
Fluxuri de lucru gata de utilizare (`/skills`) care îi permit lui Claude să execute instantaneu fluxuri de lucru complexe de dezvoltare:
- `/git-workflow` — Angajări structurate + verificări automate de siguranță.
- `/context-handoff` — Salvează contextul spațiului de lucru activ înainte de a rula `/compact`.
- `/test-writer` & `/experiment-scaffold` — Accelerați ciclurile de inginerie.

### 3. 📂 Structura organizată a spațiului de lucru
Păstrați fișierele principale în `src/`, regulile AI în `.claude/` și cercetarea dvs. în `docs/`. Claude Code cunoaște instantaneu granița, economisindu-vă bugetul indicativ.

---

## 📊 LITE vs PRO: Upgrade Premium

Versiunea LITE este limitată la 3 agenți, 6 abilități și 1 presetare. Pentru dezvoltarea profesională și caracteristicile la nivel de agenție:

| LITE (gratuit) | PRO ($1-5) |
|---|---|
| 3 agenti | 5 agenti (+ planificator, examinator de securitate) |
| 6 aptitudini | 17 abilități (+ managementul cunoștințelor, depanare a stivei, etc.) |
| 1 presetat (generic) | 10 presetări (PHP, Node, Next.js, Flutter, RN, Yii etc.) |
| 3 servere MCP | 6 servere MCP |
| Fără cârlige git | Cârlige Git preconfigurate (env-guard, tsc-check) |
| Structură simplă | Monorepo multi-proiect pentru starea întâi (`active/`, `staging/` etc.) |

👉 **[Obțineți ediția PRO pe sponsorii GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Detalii complete: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Început rapid (3 pași)

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

Deschideți acest folder în Claude Code și începeți să codați!

---

## 💖 Sprijină acest proiect (donații)

Acest șablon este gratuit și open-source. Dacă v-a ajutat, luați în considerare susținerea:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Credite și Atribuire

Acest șablon este creat de **andiupn**.
- 🌐 Site: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Cerință de atribuire:** dacă redistribuiți sau transferați acest șablon, vă rugăm să păstrați acest bloc de credit în `CLAUDE.md` și `README.md` (conform [LICENSE.md](LICENSE.md)).