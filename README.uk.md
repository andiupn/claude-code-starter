# Початковий шаблон Claude — LITE Edition 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <strong>Українська</strong> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>Інженерам ШІ потрібні правила, а не лише обчислювальна потужність.</strong></h3>
  <p><strong>Простий, зручний для початківців шаблон робочої області Claude Code, який містить 3 основних агента, 6 основних навичок і попередньо налаштовані правила робочої області.</strong></p>

  <p>Припиніть боротьбу з Claude CLI за доступ до каталогу, розмитий контекст і безладні git-коміти. Працюйте з Claude Code так, як це було розроблено для використання.</p>
</div>

> 📦 Безкоштовний шаблон від **andiupn** ([kuncimu.com](https://kuncimu.com)) · Ліцензія [MIT + Attribution](LICENSE.md)  
> ☕ Якщо це корисно, [приготуйте мені кави](https://ko-fi.com/andiupn) · 🚀 Потрібні розширені монорепо? Спробуйте [PRO версію](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Проблема: безлад Клода КЛІ
За замовчуванням інтерфейс CLI Claude Code неймовірно швидкий. Однак без попередньо налаштованого пісочниці та правил він постійно запитуватиме підтвердження, губитиметься в глибоко вкладених шляхах і створюватиме безладні git-коміти, які руйнуватимуть робочий процес запитів на вилучення вашої команди.

---

## ⚡ Рішення: пісочниця Pristine Claude

### 1. 🤖 3 спеціалізовані агенти Otonom
Ви не спілкуєтесь із звичайним чат-ботом. Ви отримуєте команду з 3 попередньо налаштованих вузькоспеціалізованих автономних агентів ШІ:
- **`@code-reviewer`** — перевіряє якість і структуру вашого коду перед фіксацією.
- **`@research-assistant`** — безпечно досліджує документи та бібліотеки API на рентабельному Claude-3-Haiku.
- **`@architecture-reviewer`** — переглядає модульність і структурний дизайн.

### 2. ⚡ 6 основних навичок (автоматизація)
Готові до використання робочі процеси (`/skills`), які дозволяють Клоду миттєво виконувати складні робочі процеси розробки:
- `/git-workflow` — Структуровані коміти + автоматичні перевірки безпеки.
- `/context-handoff` — зберігає активний контекст робочої області перед запуском `/compact`.
- `/test-writer` & `/experiment-scaffold` — Прискорення інженерних циклів.

### 3. 📂 Організована структура робочого простору
Зберігайте ваші основні файли в `src/`, ваші правила штучного інтелекту в `.claude/`, а ваші дослідження в `docs/`. Claude Code миттєво знає межі, заощаджуючи ваш бюджет жетонів.

---

## 📊 LITE vs PRO: преміум-оновлення

Версія LITE обмежена 3 агентами, 6 навичками та 1 попереднім налаштуванням. Для професійного розвитку та функцій на рівні агентства:

| LITE (безкоштовно) | PRO ($1-5) |
|---|---|
| 3 агенти | 5 агентів (+ планувальник, рецензент безпеки) |
| 6 навичок | 17 навичок (+ управління знаннями, налагодження стека тощо) |
| 1 пресет (загальний) | 10 пресетів (PHP, Node, Next.js, Flutter, RN, Yii тощо) |
| 3 сервери MCP | 6 серверів MCP |
| Немає git хуків | Попередньо налаштовані перехоплення Git (env-guard, tsc-check) |
| Проста структура | Статус першого багатопроектного монорепо (`active/`, `staging/` тощо) |

👉 **[Отримайте PRO Edition на GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly)** · Повна інформація: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Швидкий старт (3 кроки)

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

Відкрийте цю папку в Claude Code та почніть кодувати!

---

## 💖 Підтримайте цей проект (пожертви)

Цей шаблон є безкоштовним і має відкритий код. Якщо це допомогло вам, подумайте про підтримку:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Авторство та авторство

Цей шаблон створено **andiupn**.
- 🌐 Веб-сайт: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Електронна пошта: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Вимоги до посилання:** Якщо ви розповсюджуєте або розгалужуєте цей шаблон, будь ласка, збережіть цей кредитний блок у `CLAUDE.md` та `README.md` (відповідно до [LICENSE.md](LICENSE.md)).