# Kế hoạch - Bộ nhớ làm việc

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <strong>Tiếng Việt</strong> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Thư mục bắt đầu **kế hoạch triển khai** sebelumcoding dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat thực hiện (atau saat di-review setelahnya)
- Đường mòn keputusan: kenapa pendekatan A nhúng, bukan B

## Thư mục Kapan Pakai Ini?

✅ **Ya, đơn giản thôi:**
- Kế hoạch thực hiện không hề tầm thường (>1 năm)
- Kế hoạch tái cấu trúc với tập tin banyak được thực hiện
- Kế hoạch di chuyển (cơ sở dữ liệu, phiên bản khung, dsb)
- Đầu ra ở chế độ `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Lập kế hoạch cho nhiệm vụ tầm thường (<1 mứt) — cukup di TodoWrite
- Eksperimen / Spike — itu masuk `experiments/`
- Riset câu chuyện → `docs/research/`
- Keputusan bất biến yang hasil dari plan → `.claude/wiki/decisions/`

## Quy ước đặt tên

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Quy trình làm việc

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Luồng trạng thái

| Trạng thái | Arti |
|---|---|
| `draft` | Kế hoạch masih dirancang, belum disetujui |
| `active` | Kế hoạch giải phóng & sedang dieksekusi |
| `finalized` | Thực hiện kế hoạch = record |
| `superseded` | Kế hoạch Diganti (bộ `superseded_by`) |
| `archived` | Bạn có liên quan, mặt nạ `_archive/` |

## Người đứng đầu Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Hiện trường đang bị dồn nén:
- `status` — cho đến bộ lọc
- `related` — link ke Riset / ADR / plan lain
- `promoted_to` — link ke ADR kalau hasil plan dipromote

## Kế hoạch Cara Cari

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Chỉ mục

[INDEX.md](INDEX.md) kế hoạch bán hàng của bạn.