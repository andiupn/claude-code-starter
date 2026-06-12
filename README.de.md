# Starter-Vorlage Claude – LITE Edition 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <strong>Deutsch</strong> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>KI-Ingenieure brauchen Regeln, nicht nur Rechenleistung.</strong></h3>
  <p><strong>Eine einfache, einsteigerfreundliche Claude Code-Arbeitsbereichsvorlage mit 3 Kernagenten, 6 wesentlichen Fähigkeiten und vorkonfigurierten Arbeitsbereichsregeln.</strong></p>

  <p>Hören Sie auf, sich gegen Claude CLI wegen Verzeichniszugriff, losem Kontext und chaotischen Git-Commits zu streiten. Arbeiten Sie mit Claude Code so, wie er für die Verwendung konzipiert wurde.</p>
</div>

> 📦 Kostenlose Vorlage von **andiupn** ([kuncimu.com](https://kuncimu.com)) · Lizenziert unter [MIT + Namensnennung](LICENSE.md)  
> ☕ Wenn es nützlich ist, [kauf mir einen Kaffee](https://ko-fi.com/andiupn) · 🚀 Brauchen Sie fortgeschrittene Monorepos? Probieren Sie die [PRO-Version](https://github.com/sponsors/andiupn?frequency=monthly) aus.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Das Problem: Die Unordnung von Claude CLI
Standardmäßig ist die Claude Code CLI unglaublich schnell. Ohne vorkonfiguriertes Sandboxing und vorkonfigurierte Regeln wird es jedoch ständig nach einer Bestätigung fragen, sich in tief verschachtelten Pfaden verlieren und chaotische Git-Commits erzeugen, die den Pull-Request-Workflow Ihres Teams ruinieren.

---

## ⚡ Die Lösung: Pristine Claude Sandbox

### 1. 🤖 3 spezialisierte Otonom-Agenten
Sie sprechen nicht mit einem generischen Chatbot. Sie erhalten ein Team aus 3 vorkonfigurierten, hochspezialisierten und autonomen KI-Agenten:
- **`@code-reviewer`** – Überprüft die Qualität und Struktur Ihres Codes vor dem Festschreiben.
- **`@research-assistant`** – Recherchiert API-Dokumente und Bibliotheken sicher auf dem kostengünstigen Claude-3-Haiku.
- **`@architecture-reviewer`** – Bewertet Modularität und strukturelles Design.

### 2. ⚡ 6 wesentliche Fähigkeiten (Automatisierungen)
Einsatzbereite Workflows (`/skills`), mit denen Claude komplexe Entwicklungsworkflows sofort ausführen kann:
- `/git-workflow` – Strukturierte Commits + automatisierte Sicherheitsprüfungen.
- `/context-handoff` – Speichert den aktiven Arbeitsbereichskontext vor der Ausführung von `/compact`.
- `/test-writer` & `/experiment-scaffold` – Beschleunigen Sie Engineering-Zyklen.

### 3. 📂 Organisierte Arbeitsplatzstruktur
Bewahren Sie Ihre Hauptdateien in `src/`, Ihre KI-Regeln in `.claude/` und Ihre Recherchen in `docs/` auf. Claude Code erkennt sofort die Grenze und spart so Ihr Token-Budget.

---

## 📊 LITE vs. PRO: Das Premium-Upgrade

Die LITE-Version ist auf 3 Agenten, 6 Fertigkeiten und 1 Voreinstellung beschränkt. Für berufliche Weiterentwicklung und Funktionen auf Agenturebene:

| LITE (Kostenlos) | PRO (1-5 $) |
|---|---|
| 3 Agenten | 5 Agenten (+ Planer, Sicherheitsprüfer) |
| 6 Fähigkeiten | 17 Fähigkeiten (+ Wissensmanagement, Stack-Debug usw.) |
| 1 Voreinstellung (allgemein) | 10 Voreinstellungen (PHP, Node, Next.js, Flutter, RN, Yii usw.) |
| 3 MCP-Server | 6 MCP-Server |
| Keine Git-Hooks | Vorkonfigurierte Git-Hooks (env-guard, tsc-check) |
| Einfache Struktur | Status-First-Multiprojekt-Monorepo (`active/`, `staging/` usw.) |

👉 **[Holen Sie sich die PRO Edition auf GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly)** · Vollständige Details: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Schnellstart (3 Schritte)

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

Öffnen Sie diesen Ordner in Claude Code und beginnen Sie mit dem Codieren!

---

## 💖 Unterstützen Sie dieses Projekt (Spenden)

Diese Vorlage ist kostenlos und Open Source. Wenn es Ihnen geholfen hat, denken Sie darüber nach, Folgendes zu unterstützen:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Credits & Namensnennung

Diese Vorlage wurde von **andiupn** erstellt.
- 🌐 Website: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-Mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Namensnennungsanforderung:** Wenn Sie diese Vorlage weiterverbreiten oder teilen, bewahren Sie diese Credit-Sperre bitte in `CLAUDE.md` und `README.md` auf (gemäß [LICENSE.md](LICENSE.md)).