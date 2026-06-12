# Modèle de démarrage Claude — Édition LITE 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <strong>Français</strong> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>Les ingénieurs IA ont besoin de règles, pas seulement de puissance de calcul.</strong></h3>
  <p><strong>Un modèle d'espace de travail Claude Code simple et convivial pour les débutants, comprenant 3 agents principaux, 6 compétences essentielles et des règles d'espace de travail préconfigurées.</strong></p>

  <p>Arrêtez de vous battre contre Claude CLI pour l'accès aux répertoires, le contexte lâche et les commits git désordonnés. Travaillez avec Claude Code de la manière dont il a été conçu pour être utilisé.</p>
</div>

> 📦 Modèle gratuit par **andiupn** ([kuncimu.com](https://kuncimu.com)) · Sous licence [MIT + Attribution](LICENSE.md)  
> ☕ Si utile, [achetez-moi un café](https://ko-fi.com/andiupn) · 🚀 Besoin de monorepos avancés ? Essayez la [version PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Le problème : Le désordre de Claude CLI
Par défaut, la CLI Claude Code est incroyablement rapide. Cependant, sans sandboxing ni règles préconfigurées, il demandera continuellement une confirmation, se perdra dans des chemins profondément imbriqués et créera des commits git désordonnés qui ruineront le flux de travail des demandes d'extraction de votre équipe.

---

## ⚡ La solution : le bac à sable impeccable de Claude

### 1. 🤖 3 Agents Otonom spécialisés
Vous ne parlez pas à un chatbot générique. Vous disposez d'une équipe de 3 agents IA préconfigurés, hautement spécialisés et autonomes :
- **`@code-reviewer`** — Examine la qualité et la structure de votre code avant la validation.
- **`@research-assistant`** — Recherche des documents et des bibliothèques API en toute sécurité sur Claude-3-Haiku économique.
- **`@architecture-reviewer`** — Examine la modularité et la conception structurelle.

### 2. ⚡ 6 compétences essentielles (automatisations)
Des workflows prêts à l'emploi (`/skills`) qui permettent à Claude d'exécuter instantanément des workflows de développement complexes :
- `/git-workflow` — Engagements structurés + contrôles de sécurité automatisés.
- `/context-handoff` — Enregistre le contexte de l'espace de travail actif avant d'exécuter `/compact`.
- `/test-writer` & `/experiment-scaffold` — Accélérez les cycles d'ingénierie.

### 3. 📂 Structure de l'espace de travail organisé
Conservez vos fichiers principaux dans `src/`, vos règles d'IA dans `.claude/` et vos recherches dans `docs/`. Claude Code connaît instantanément les limites, économisant ainsi votre budget symbolique.

---

## 📊 LITE vs PRO : la mise à niveau Premium

La version LITE est limitée à 3 agents, 6 compétences et 1 préréglage. Pour le développement professionnel et les fonctionnalités au niveau de l'agence :

| LITE (Gratuit) | PRO (1-5 $) |
|---|---|
| 3 agents | 5 agents (+ planificateur, réviseur-sécurité) |
| 6 compétences | 17 compétences (+ gestion des connaissances, débogage de pile, etc.) |
| 1 préréglage (générique) | 10 préréglages (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 serveurs MCP | 6 serveurs MCP |
| Pas de crochets git | Hooks Git préconfigurés (env-guard, tsc-check) |
| Structure simple | Monorepo multi-projets de statut premier (`active/`, `staging/`, etc.) |

👉 **[Obtenez l'édition PRO sur les sponsors GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Détails complets : [COMPARISON.md](COMPARISON.md)

---

## 🚀 Démarrage rapide (3 étapes)

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

Ouvrez ce dossier dans Claude Code, et commencez à coder !

---

## 💖 Soutenez ce projet (Dons)

Ce modèle est gratuit et open source. Si cela vous a aidé, pensez à soutenir :
- **Ko-fi :** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon :** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer :** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria :** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Crédits et attribution

Ce modèle est créé par **andiupn**.
- 🌐 Site Web : [kuncimu.com](https://kuncimu.com)
- 💻 GitHub : [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail : [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Exigence d'attribution :** Si vous redistribuez ou dupliquez ce modèle, veuillez conserver ce bloc de crédit dans `CLAUDE.md` et `README.md` (conformément à [LICENSE.md](LICENSE.md)).