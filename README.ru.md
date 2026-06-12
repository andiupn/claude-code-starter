# Стартовый шаблон Claude — LITE Edition 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <strong>Русский</strong> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>

<div align="center">
  <h3><strong>Инженерам ИИ нужны правила, а не только вычислительная мощность.</strong></h3>
  <p><strong>Простой, удобный для начинающих шаблон рабочего пространства Claude Code, включающий 3 основных агента, 6 основных навыков и предварительно настроенные правила рабочего пространства.</strong></p>

  <p>Хватит бороться с Клодом CLI из-за доступа к каталогам, отсутствия контекста и беспорядочных коммитов git. Работайте с Claude Code так, как он был задуман.</p>
</div>

> 📦 Бесплатный шаблон от **andiupn** ([kuncimu.com](https://kuncimu.com)) · Лицензия [MIT + Attribution](LICENSE.md)  
> ☕ Если полезно, [купи мне кофе](https://ko-fi.com/andiupn) · 🚀 Нужны расширенные монорепозитории? Попробуйте [PRO-версию](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
__ЗНАК_3__
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Проблема: беспорядок в Claude CLI
По умолчанию CLI Claude Code невероятно быстр. Однако без предварительно настроенной песочницы и правил он будет постоянно запрашивать подтверждение, теряться в глубоко вложенных путях и создавать беспорядочные коммиты git, которые разрушают рабочий процесс запросов на включение вашей команды.

---

## ⚡ Решение: Песочница Pristine Claude

### 1. 🤖 3 специализированных агента Отоном
Вы не разговариваете с обычным чат-ботом. Вы получаете команду из трех предварительно настроенных, узкоспециализированных и автономных ИИ-агентов:
- **`@code-reviewer`** — проверяет качество и структуру вашего кода перед фиксацией.
- **`@research-assistant`** — безопасно исследует документацию и библиотеки API на экономичном Claude-3-Haiku.
- **`@architecture-reviewer`** — проверяет модульность и структурный дизайн.

### 2. ⚡ 6 основных навыков (автоматизация)
Готовые к использованию рабочие процессы (`/skills`), которые позволяют Клоду мгновенно выполнять сложные рабочие процессы разработки:
- `/git-workflow` — Структурированные коммиты + автоматические проверки безопасности.
- `/context-handoff` — сохраняет активный контекст рабочей области перед запуском `/compact`.
- `/test-writer` и `/experiment-scaffold` — Ускорение циклов проектирования.

### 3. 📂 Организованная структура рабочего пространства
Храните основные файлы в `src/`, правила ИИ в `.claude/`, а исследования в `docs/`. Клод Код мгновенно узнает границы, экономя ваш бюджет токенов.

---

## 📊 LITE против PRO: Премиум-обновление

Версия LITE ограничена 3 агентами, 6 навыками и 1 предустановкой. Для профессионального развития и функций уровня агентства:

| ЛАЙТ (бесплатно) | ПРО (1–5 долларов США) |
|---|---|
| 3 агента | 5 агентов (+ планировщик, проверяющий безопасность) |
| 6 навыков | 17 навыков (+ управление знаниями, отладка стека и т. д.) |
| 1 пресет (общий) | 10 пресетов (PHP, Node, Next.js, Flutter, RN, Yii и т. д.) |
| 3 сервера MCP | 6 серверов MCP |
| Никаких git-хуков | Предварительно настроенные перехватчики Git (env-guard, tsc-check) |
| Простая структура | Статус-первый многопроектный монорепозиторий (`active/`, `staging/` и т. д.) |

👉 **[Получите PRO-версию у спонсоров GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Полная информация: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Быстрый старт (3 шага)

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

Откройте эту папку в Claude Code и начните программировать!

---

## 💖 Поддержите этот проект (пожертвования)

Этот шаблон бесплатный и с открытым исходным кодом. Если вам это помогло, рассмотрите возможность поддержки:
- **Ко-фи:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Саверия:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Авторы и авторство

Этот шаблон создан **andiupn**.
- 🌐 Веб-сайт: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Электронная почта: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Требование об указании авторства.** Если вы распространяете или создаете форк этого шаблона, сохраните этот блок кредитов в `CLAUDE.md` и `README.md` (согласно [LICENSE.md](LICENSE.md)).