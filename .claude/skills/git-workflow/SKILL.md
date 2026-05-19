---
name: git-workflow
description: |
  Jalankan operasi git yang common secara terstruktur dengan validasi.
  Trigger when: user meminta commit, push, branch management, atau rangkuman perubahan git.
  Do NOT trigger when: user hanya ingin melihat diff biasa, atau operasi git lengkap sudah disebutkan eksplisit.
tools: [Bash, Read]
model: sonnet
color: green
---

# Git Workflow Skill

## Proses Standar

1. **Status Check** — Mulai dengan `git status` dan `git log --oneline -5`
2. **Diff Review** — Tampilkan `git diff` sebelum staging
3. **Staging** — Gunakan `git add <specific-files>`, bukan `git add -A`
4. **Commit** — Format: `<type>: <deskripsi singkat>`
   - Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`
5. **Konfirmasi** — Tampilkan `git log --oneline -3` setelah commit
6. **Push (opsional)** — Hanya jika diminta eksplisit
   - Branch existing: `git push origin <branch>`
   - Branch baru: `git push -u origin <branch>`
7. **Branch Management** — Naming: `<type>/<deskripsi-kebab-case>`
   - Contoh: `feat/tambah-auth`, `fix/null-pointer`, `chore/update-deps`
   - Buat branch: `git checkout -b <nama>` dari branch yang tepat

## Aturan

- Jangan force push ke main/master tanpa konfirmasi eksplisit
- Jika ada merge conflict, stop dan jelaskan — jangan resolve otomatis
- Selalu tampilkan rencana sebelum eksekusi
- Push ke branch baru selalu gunakan `-u` untuk tracking
- Branch naming mengikuti konvensi commit type
