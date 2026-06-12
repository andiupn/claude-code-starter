# Плани — Робоча пам'ять

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <strong>Українська</strong> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Папка містить **план реалізації** для кодування. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (або Saat di-review setelahnya)
- Trail keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- План реалізації для нетривіального варіанту (>1 крок)
- Рефакторинг плану з пакетом файлів banyak
- План міграції (база даних, версія фреймворку, dsb)
- Вихід у режимі `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Планувати тривіальне завдання (<1 джем) — cukup di TodoWrite
- Eksperimen / spike — itu masuk `experiments/`
- Підйом експлораси → `docs/research/`
- Keputusan immutable yang hasil dari plan → `.claude/wiki/decisions/`

## Угода про іменування

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Контох: `PLAN-20260507-migrasi-laravel-12.md`

## Робочий процес

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Потік статусу

| Статус | Арті |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan disetujui & sedang dieksekusi |
| `finalized` | Implementasi selesai, plan = запис |
| `superseded` | Diganti plan baru (набір `superseded_by`) |
| `archived` | Tidak relevan, masuk `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Розробка поля:
- `status` — для фільтра
- `related` — посилання ke riset / ADR / plan lain
- `promoted_to` — посилання ke ADR kalau hasil plan dipromote

## План Cara Cari

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Індекс

[INDEX.md](INDEX.md) berisi tabele semua plan.