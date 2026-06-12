# Badania — pamięć robocza

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <strong>Polski</strong> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Folder ini berisi **riset eksplorasi yang ograniczony w czasie**. Tujuannya: simpan proses & hasilriset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat sesji AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat Insight-nya terbukti evergreen

## Kapan Pakai Folder Ini?

✅ **Tak, proste:**
- Biblioteka / framework / narzędzie Komparasi
- Zachowanie API Eksplorasi
- Investigasi wydajność / koszt
- Spike wzrost sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah niezmienny → `.claude/wiki/decisions/` (ADR)
- Wzór wielokrotnego użytku → `.claude/wiki/patterns/`
- Wyciągnięta lekcja Yang Evergreen → `.claude/wiki/learnings/`
- Plan wdrożenia → `docs/plans/`
- Kontekst sesji efemeryczny → `.claude/memory/`

## Konwencja nazewnictwa

__KOD_BLOKU_0__

Konto: `RES-20260507-react-query-vs-swr.md`

## Przepływ pracy

__KOD_BLOKU_1__

## Przepływ stanu

| Stan | Arti | Akcja |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset Jalan | Aktualizacja wyników |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan Turunan |
| `superseded` | Sudah digantikanriset/keputusan baru | Ustaw `superseded_by` |
| `archived` | Tidak istotne informacje | Pindah ke `_archive/` |

## Frontmater Wajib

Otwórz [docs/templates/research.md](../templates/research.md). Penting w terenie:
- `id` — dopasowuje plik nazwy
- `status` — filtruj przez `grep`
- `related` — odniesienie do ADR / plan terkait
- `promoted_to` — link do wpisu na wiki Kalau Inspect di-extract

## Cara Cari Powstaje

__KOD_BLOKU_2__

## Indeks

[INDEX.md](INDEX.md) tabela wszystkich wzrostów. Zaktualizuj ręczne atau za pomocą umiejętności `/research-new` (automatyczne dodawanie).