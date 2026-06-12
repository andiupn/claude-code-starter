# Planos – Memória de Trabalho

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <strong>Português (BR)</strong> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Pasta ini berisi **plan implementasi** sebelum coding dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (ou saat di-review setelahnya)
- Trilha keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Pasta Ini?

✅ **Sim, simpan di sini:**
- Plano de implementação para fins não triviais (> 1 dia)
- Plano de refatoração com arquivo banyak terdampak
- Plano de migração (banco de dados, versão do framework, dsb)
- Saída do modo `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Planeje tarefas triviais (<1 jam) — cukup di TodoWrite
- Experimen / spike — itu masuk `experiments/`
- Riset exploração → `docs/research/`
- Keputusan imutável yang hasil do plano → `.claude/wiki/decisions/`

## Convenção de Nomenclatura

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Conta: `PLAN-20260507-migrasi-laravel-12.md`

## Fluxo de trabalho

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Fluxo de status

| Estado | Arte |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan disetujui & sedang dieksekusi |
| `finalized` | Implementasi selesai, plano = registro |
| `superseded` | Diganti plano baru (conjunto `superseded_by`) |
| `archived` | Não relevante, masuk `_archive/` |

## Frontmatter Wajib

Leia [docs/templates/plan.md](../templates/plan.md). Pendência de campo:
- `status` — para filtro
- `related` — link ke riset / ADR / plano lain
- `promoted_to` — link ke ADR kalau hasil plan dipromote

## Plano Cara Cari

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Índice

[INDEX.md](INDEX.md) contém tabela de todo plano.