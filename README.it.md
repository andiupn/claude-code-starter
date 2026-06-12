# Modello iniziale Claude — Edizione LITE 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <strong>Italiano</strong> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>

<br />

<div align="center">
  <h3><strong>Gli ingegneri AI hanno bisogno di regole, non solo di potenza di calcolo.</strong></h3>
  <p><strong>Un modello di area di lavoro Claude Code semplice e adatto ai principianti con 3 agenti principali, 6 competenze essenziali e regole dell'area di lavoro preconfigurate.</strong></p>

  <p>Smettila di combattere Claude CLI per l'accesso alle directory, il contesto vago e i commit git disordinati. Lavora con Claude Code nel modo in cui è stato progettato per essere utilizzato.</p>
</div>

> 📦 Modello gratuito di **andiupn** ([kuncimu.com](https://kuncimu.com)) · Concesso in licenza da [MIT + Attribution](LICENSE.md)  
> ☕ Se utile, [offrimi un caffè](https://ko-fi.com/andiupn) · 🚀 Hai bisogno di monorepos avanzati? Prova la [versione PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Il problema: il disordine di Claude CLI
Per impostazione predefinita, la CLI di Claude Code è incredibilmente veloce. Tuttavia, senza sandboxing e regole preconfigurati, chiederà continuamente conferma, si perderà in percorsi profondamente annidati e creerà commit git disordinati che rovinano il flusso di lavoro delle richieste pull del tuo team.

---

## ⚡ La soluzione: Claude Sandbox incontaminata

### 1. 🤖 3 Agenti specializzati Otonom
Non parli con un chatbot generico. Ottieni un team di 3 agenti IA preconfigurati, altamente specializzati e autonomi:
- **`@code-reviewer`**: esamina la qualità e la struttura del codice prima del commit.
- **`@research-assistant`**: ricerca documenti e librerie API in modo sicuro sul conveniente Claude-3-Haiku.
- **`@architecture-reviewer`** — Riesamina la modularità e il design strutturale.

### 2. ⚡ 6 Competenze Essenziali (Automazioni)
Flussi di lavoro pronti all'uso (`/skills`) che consentono a Claude di eseguire istantaneamente flussi di lavoro di sviluppo complessi:
- `/git-workflow`: commit strutturati + controlli di sicurezza automatizzati.
- `/context-handoff`: salva il contesto dell'area di lavoro attiva prima di eseguire `/compact`.
- `/test-writer` e `/experiment-scaffold`: accelera i cicli di progettazione.

### 3. 📂 Struttura organizzata dello spazio di lavoro
Conserva i tuoi file principali in `src/`, le tue regole AI in `.claude/` e le tue ricerche in `docs/`. Claude Code riconosce immediatamente il confine, risparmiando sul budget dei token.

---

## 📊 LITE vs PRO: l'aggiornamento Premium

La versione LITE è limitata a 3 agenti, 6 abilità e 1 preimpostazione. Per lo sviluppo professionale e le funzionalità a livello di agenzia:

| LITE (gratuito) | PRO ($1-5) |
|---|---|
| 3 agenti | 5 agenti (+ pianificatore, revisore della sicurezza) |
| 6 abilità | 17 competenze (+ gestione della conoscenza, debug dello stack, ecc.) |
| 1 preimpostato (generico) | 10 preimpostazioni (PHP, Node, Next.js, Flutter, RN, Yii, ecc.) |
| 3 server MCP | 6 server MCP |
| Nessun gancio git | Hook Git preconfigurati (env-guard, tsc-check) |
| Struttura semplice | Monorepo multiprogetto primo stato (`active/`, `staging/` e così via) |

👉 **[Ottieni l'edizione PRO sugli sponsor GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Dettagli completi: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Avvio rapido (3 passaggi)

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

Apri questa cartella in Claude Code e inizia a programmare!

---

## 💖 Sostieni questo progetto (donazioni)

Questo modello è gratuito e open source. Se ti è stato d'aiuto, valuta la possibilità di supportare:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Crediti e attribuzione

Questo modello è stato creato da **andiupn**.
- 🌐 Sito web: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Requisito di attribuzione:** Se ridistribuisci o esegui il fork di questo modello, mantieni questo blocco di crediti in `CLAUDE.md` e `README.md` (come da [LICENSE.md](LICENSE.md)).