# Планы — Рабочая память

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <strong>Русский</strong> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Папка ini berisi **planimplementasi** sebelum coding dimulai. Тухуанья:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saatimplementasi (atau saat di-review setelahnya)
- Тропа кепутасан: кенапа пендекатан А дипилих, букан Б.

## Капан Пакай Папка Ini?

✅ **Да, просто ди сини:**
- План реализации нетривиальных условий (>1 хари керджа)
- План рефакторинга с использованием файла terdampak.
- План миграции (база данных, версия платформы, dsb)
- Вывод в режиме `Plan` / `architecture-reviewer`

❌ **Букан ди сини:**
- Планирование тривиальных задач (<1 пробки) — покупка TodoWrite
- Эксперимент / спайк — иту масук `experiments/`
- Рисет эксплораси → `docs/research/`
- Кепутасанский неизменный план ян хасил дари → `.claude/wiki/decisions/`

## Соглашение об именах

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Конто: `PLAN-20260507-migrasi-laravel-12.md`

## Рабочий процесс

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Поток состояния

| Статус | Арти |
|---|---|
| `draft` | План больших расходов, неприятные последствия |
| `active` | План disetujui & седан dieksekusi |
| `finalized` | Внедрение простое, план = запись |
| `superseded` | Диганти-план бару (набор `superseded_by`) |
| `archived` | Тидак актуальный, масук `_archive/` |

## Фронтматтер Ваджиб

Лихат [docs/templates/plan.md](../templates/plan.md). Полевая оклейка:
- `status` — включить фильтр
- `related` — ссылка keriset/ADR/plan lain
- `promoted_to` — ссылка на план дипромоутирования ADR

## План Кара Кари

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Индекс

[INDEX.md](INDEX.md) план семуа таблицы таблицы.