# Дослідження — Робоча пам'ять

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <strong>Українська</strong> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Ця папка містить **вивчення експлораси, обмежене за часом**. Tujuannya: простий проза & hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Немає вихідних сесій AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Бібліотека/фреймворк/інструмент Komparasi
— Поведінка API Explorasi
- Investigasi продуктивність / вартість
- Колосистий підйом sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah незмінний → `.claude/wiki/decisions/` (ADR)
- Шаблон для багаторазового використання → `.claude/wiki/patterns/`
- Вивчений урок Ян вічнозелений → `.claude/wiki/learnings/`
- Реалізація плану → `docs/plans/`
- Ефемерний контекст сеансу → `.claude/memory/`

## Угода про іменування

```
RES-YYYYMMDD-<kebab-slug>.md
```

Контох: `RES-20260507-react-query-vs-swr.md`

## Робочий процес

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Потік статусу

| Статус | Арті | Дія |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Оновлення висновків |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Набір `superseded_by` |
| `archived` | Tidak relevan lagi | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Розробка поля:
- `id` — відповідність файлу назви
- `status` — для фільтрування через `grep`
- `related` — перехресне посилання ADR / plan terkait
- `promoted_to` — посилання ke вікі-запис kalau insight di-extract

## Cara Cari Riset

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

## Індекс

[INDEX.md](INDEX.md) berisi tabele semua riset. Оновити вручну або за допомогою навички `/research-new` (автоматичне додавання).