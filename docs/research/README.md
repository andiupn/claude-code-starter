# Research — Working Memory

Folder ini berisi **riset eksplorasi yang time-bound**. Tujuannya: simpan proses & hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat session AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Komparasi library / framework / tool
- Eksplorasi API behavior
- Investigasi performance / cost
- Spike riset sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah immutable → `.claude/wiki/decisions/` (ADR)
- Pattern reusable → `.claude/wiki/patterns/`
- Lesson learned yang evergreen → `.claude/wiki/learnings/`
- Plan implementasi → `docs/plans/`
- Session context ephemeral → `.claude/memory/`

## Naming Convention

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Workflow

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Status Flow

| Status | Arti | Action |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Update findings |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Set `superseded_by` |
| `archived` | Tidak relevan lagi | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Field penting:
- `id` — match nama file
- `status` — untuk filter via `grep`
- `related` — cross-ref ke ADR / plan terkait
- `promoted_to` — link ke wiki entry kalau insight di-extract

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

## Index

[INDEX.md](INDEX.md) berisi tabel semua riset. Update manual atau via skill `/research-new` (auto-append).
