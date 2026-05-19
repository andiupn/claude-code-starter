---
name: experiment-scaffold
description: |
  Buat struktur folder dan file awal untuk experiment baru.
  Trigger when: user ingin mulai experiment baru — menyebut "experiment baru", "coba buat experiment", "prototype baru", "scaffold baru", atau meminta setup folder percobaan.
  Do NOT trigger when: "coba" muncul sebagai kata kerja biasa ("coba jalankan", "coba debug", "coba lihat"), atau user tidak bermaksud membuat struktur folder baru.
tools: [Bash, Write, Read]
model: haiku
color: yellow
---

# Experiment Scaffold Skill

## Proses

1. **Nama experiment** — Tanya jika belum jelas. Format: `kebab-case`, deskriptif, singkat.
2. **Tanggal** — Jalankan `date '+%Y-%m-%d'`
3. **Buat struktur**:
   ```
   experiments/YYYY-MM-DD-<nama>/
     README.md       # Tujuan, approach, hasil (template)
     main.<ext>      # Entry point (sesuai bahasa dipilih)
   ```
4. **Template README.md**:
   ```markdown
   # Experiment: <nama>
   **Tanggal**: YYYY-MM-DD
   **Tujuan**: <satu kalimat>
   
   ## Approach
   ## Hasil
   ## Kesimpulan
   ```
5. **Verifikasi** — `find experiments/<folder> -type f`

## Aturan

- Tanya bahasa/teknologi sebelum membuat `main.<ext>`
- Jangan buat file lebih dari yang dibutuhkan di awal
- Jika nama+tanggal sudah ada, tanya apakah lanjutkan atau buat baru
