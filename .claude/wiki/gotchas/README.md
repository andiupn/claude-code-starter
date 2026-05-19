---
title: Gotchas & Troubleshooting Wiki
description: Masalah yang sudah diketahui dan langkah debug per error kategori
---

# Gotchas & Troubleshooting

Koleksi masalah yang pernah ditemui beserta solusinya — agar tidak diulangi.

| File | Isi |
|------|-----|
| [known-gotchas.md](known-gotchas.md) | 21 gotcha lintas OS/stack: CRLF, MCP, Docker port, PHP-FPM socket, Flutter NDK, Redis/Valkey, Next.js Turbopack, pdf-parse, tesseract |
| [troubleshooting.md](troubleshooting.md) | Problem/fix cepat: MCP won't start, Docker port conflict, Caddy 502, Laravel app key, Flutter doctor, permission denied |

## Konvensi

- `known-gotchas.md` — append-only, jangan hapus entry lama
- Entry baru ditambah via `/knowledge-extract` atau manual (append ke tabel)
- Severity: 🔴 Critical = blocker, 🟡 Warning = degraded tapi tidak blocker
