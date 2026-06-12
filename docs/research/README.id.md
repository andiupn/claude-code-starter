# Penelitian — Memori Kerja

<div align="center">
  <a href="README.md">English</a> | <strong>Bahasa Indonesia</strong> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Folder ini berisi **riset eksplorasi yang terikat waktu**. Tujuan: menyimpan proses & hasil penelitian sebagai artefak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dibahas
- Tidak hilang saat sesi AI direset
- Dapat dipromosikan ke `.claude/wiki/` saat wawasannya terbukti selalu hijau

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Komparasi perpustakaan / kerangka / alat
- Perilaku Eksplorasi API
- Investigasi kinerja/biaya
- Spike riset sebelum mengambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah tidak dapat diubah → `.claude/wiki/decisions/` (ADR)
- Pola dapat digunakan kembali → `.claude/wiki/patterns/`
- Pelajaran yang selalu dipelajari → `.claude/wiki/learnings/`
- Implementasi rencana → `docs/plans/`
- Konteks sesi bersifat sementara → `.claude/memory/`

## Konvensi Penamaan

__KODE_BLOK_0__

Contoh: `RES-20260507-react-query-vs-swr.md`

## Alur Kerja

__KODE_BLOK_1__

## Aliran Status

| Status | Arti | Aksi |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Jalan bangkit | Perbarui temuan |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / rencana turunan |
| `superseded` | Telah menggantikan penelitian/keputusan baru | Setel `superseded_by` |
| `archived` | Tidak relevan lagi | Pindah ke `_archive/` |

## Materi Depan Wajib

Lihat [docs/templates/research.md](../templates/research.md). Bidang penting:
- `id` — cocok dengan nama file
- `status` — untuk memfilter melalui `grep`
- `related` — referensi silang ke ADR / paket terkait
- `promoted_to` — tautan ke entri wiki kalau wawasan di-ekstrak

## Cara Cari Bangkit

__KODE_BLOK_2__

## Indeks

[INDEX.md](INDEX.md) berisi tabel semua penelitian. Perbarui manual atau melalui skill `/research-new` (tambahan otomatis).