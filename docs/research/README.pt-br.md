# Pesquisa – Memória de Trabalho

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <strong>Português (BR)</strong> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


A pasta ini berisi **riset explorasi yang time-bound**. Tujuannya: simpan proses & hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Não há sessão saat AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Pasta Ini?

✅ **Sim, simpan di sini:**
- Biblioteca / estrutura / ferramenta Komparasi
- Comportamento da API Eksplorasi
- Investigasi desempenho/custo
- Spike riset sebelum ambil keputusan
- Hasil de `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah imutável → `.claude/wiki/decisions/` (ADR)
- Padrão reutilizável → `.claude/wiki/patterns/`
- Lição aprendida yang evergreen → `.claude/wiki/learnings/`
- Implementação do plano → `docs/plans/`
- Contexto da sessão efêmera → `.claude/memory/`

## Convenção de Nomenclatura

```
RES-YYYYMMDD-<kebab-slug>.md
```

Conta: `RES-20260507-react-query-vs-swr.md`

## Fluxo de trabalho

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Fluxo de status

| Estado | Arte | Ação |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Atualizar descobertas |
| `finalized` | Selesai, ada recomendado | Buat ADR / plano turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Definir `superseded_by` |
| `archived` | Não há dias relevantes | Pinda ke `_archive/` |

## Frontmatter Wajib

Leia [docs/templates/research.md](../templates/research.md). Pendência de campo:
- `id` — corresponde ao arquivo nome
- `status` — para filtrar via `grep`
- `related` — referência cruzada para ADR / plano terkait
- `promoted_to` — link para entrada wiki kalau insight di-extract

##Cara Cari Riset

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

[INDEX.md](INDEX.md) na tabela de todos os tempos. Atualize o manual atau por meio da habilidade `/research-new` (anexar automaticamente).