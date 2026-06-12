# Investigación: memoria de trabajo

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <strong>Español</strong> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Carpeta ini berisi **riset eksplorasi yang con límite de tiempo**. Tujuannya: simpan proses y hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat sesión AI directa
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## ¿Carpeta Kapan Pakai Ini?

✅ **Ya, simpan di sini:**
- Biblioteca/marco/herramienta Komparasi
- Comportamiento de la API explorada
- Rendimiento/costo de la investigación.
- Spike riset sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah inmutable → `.claude/wiki/decisions/` (ADR)
- Patrón reutilizable → `.claude/wiki/patterns/`
- Lección aprendida yang evergreen → `.claude/wiki/learnings/`
- Plan de implementación → `docs/plans/`
- Contexto de sesión efímero → `.claude/memory/`

## Convención de nomenclatura

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Flujo de trabajo

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Flujo de estado

| Estado | Arte | Acción |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset calle | Actualizar resultados |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunán |
| `superseded` | Sudah digantikan riset/keputusan baru | Establecer `superseded_by` |
| `archived` | No hay datos relevantes | Pindah ke `_archive/` |

## Frontmatter Wajib

Leer [docs/templates/research.md](../templates/research.md). Pentencia de campo:
- `id` — coincide con el archivo de nombre
- `status` — para filtrar vía `grep`
- `related` — referencia cruzada de ADR / plan terkait
- `promoted_to` — enlace ke entrada wiki kalau insight di-extracto

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

## Índice

[INDEX.md](INDEX.md) berisi tabel semua riset. Actualice el manual o mediante la habilidad `/research-new` (agregar automáticamente).