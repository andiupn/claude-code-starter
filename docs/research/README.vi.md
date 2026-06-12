# Nghiên cứu — Trí nhớ làm việc

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <strong>Tiếng Việt</strong> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Thư mục bắt đầu **riset eksplorasi yang time-bound**. Tujuannya: văn xuôi đơn giản & hasil Riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat phiên AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat cái nhìn sâu sắc-nya terbukti thường xanh

## Thư mục Kapan Pakai Ini?

✅ **Ya, đơn giản thôi:**
- Thư viện/khung/công cụ Komparasi
- Hành vi API Eksplorasi
- Điều tra hiệu suất / chi phí
- Spike tăng sebelum ambil keputusan
- Hasil từ `@research-assistant`

❌ **Bukan di sini:**
- Keputusan cuối cùng yang sudah bất biến → `.claude/wiki/decisions/` (ADR)
- Mẫu có thể tái sử dụng → `.claude/wiki/patterns/`
- Bài học dương thường xanh → `.claude/wiki/learnings/`
- Thực hiện kế hoạch → `docs/plans/`
- Bối cảnh phiên tạm thời → `.claude/memory/`

## Quy ước đặt tên

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Quy trình làm việc

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Luồng trạng thái

| Trạng thái | Arti | Hành động |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Cập nhật kết quả |
| `finalized` | Selesai, được đề xuất | Buat ADR / kế hoạch turunan |
| `superseded` | Sudah digantikan Riset/keputusan baru | Đặt `superseded_by` |
| `archived` | Tidak có liên quan lagi | Pindah ke `_archive/` |

## Người đứng đầu Wajib

Lihat [docs/templates/research.md](../templates/research.md). Hiện trường đang bị dồn nén:
- `id` — khớp với tên tập tin
- `status` — bỏ qua bộ lọc qua `grep`
- `related` — tham khảo chéo ke ADR / kế hoạch terkait
- `promoted_to` — link ke wiki entry kalau cái nhìn sâu sắc di-extract

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

## Chỉ mục

[INDEX.md](INDEX.md) danh sách này sẽ tăng lên. Cập nhật atau thủ công thông qua kỹ năng `/research-new` (tự động nối thêm).