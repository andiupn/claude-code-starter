# Исследования — Рабочая память

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <strong>Русский</strong> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Папка ini berisi **riset eksplorasi yang ограничена по времени**. Тухуанья: простые прозы и агар-репо хасил рисет себагай артифак:
- Биса дируха лаги саат кепутусан теркаит дипертаньякан
- Непосредственная настройка искусственного интеллекта во время сеанса.
- Bisa dipromosikan ke `.claude/wiki/` saat Insight-nya terbukti Evergreen

## Капан Пакай Папка Ini?

✅ **Да, просто ди сини:**
- Библиотека/фреймворк/инструмент Компараси
- Поведение API Эксплораси
- Производительность/стоимость расследования
- Шип рисет sebelum ambil keputusan
- Хасил дари `@research-assistant`

❌ **Букан ди сини:**
- Кепутасан финальный ян судах неизменяемый → `.claude/wiki/decisions/` (ADR)
- Шаблон многоразовый → `.claude/wiki/patterns/`
- Урок ян вечнозеленый → `.claude/wiki/learnings/`
- План реализации → `docs/plans/`
- Эфемерный контекст сеанса → `.claude/memory/`

## Соглашение об именах

```
RES-YYYYMMDD-<kebab-slug>.md
```

Конто: `RES-20260507-react-query-vs-swr.md`

## Рабочий процесс

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Поток состояния

| Статус | Арти | Действие |
|---|---|---|
| `draft` | Бару дибуат, масих косонг/сетенга | Ланют Иси |
| `active` | Рисет Джалан | Обновить выводы |
| `finalized` | Селесай, рекомендуем | Буат ADR / план турунан |
| `superseded` | Судах большой размер/кепутусан бару | Установить `superseded_by` |
| `archived` | Тидак соответствующих слов | Пинда ке `_archive/` |

## Фронтматтер Ваджиб

Лихат [docs/templates/research.md](../templates/research.md). Полевая оклейка:
- `id` — соответствует названию файла
- `status` — включить фильтр через `grep`
- `related` — перекрестная ссылка на ADR / план продажи
- `promoted_to` — ссылка на вики-запись, экстракт из калау-инсайта

## Кара Кари Рисет

```bash
# Semua riset draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/research/ | grep -v README.md | grep -v INDEX.md

# Semua riset finalized
grep -rl "^status: finalized" docs/research/ | grep -v README.md

# Riset dengan tag tertentu
grep -rl "flutter" docs/research/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/research/INDEX.md
```

## Индекс

[INDEX.md](INDEX.md) содержит таблицу семиа. Обновите атау вручную с помощью навыка `/research-new` (автодобавление).