---
name: memory-promote
description: |
  Promote satu entry memory dari project lokal (`.agent/memory/entries/<cat>/`) ke parent
  workspace root. Berguna untuk lesson learned yang relevan lintas-project.
  Trigger when: user minta "promote memory", "memory-promote", "naikin lesson ini ke root",
    "share memory ke parent workspace".
  Do NOT trigger when: project ini standalone (tidak ada `inherits_from` di scaffold.lock.json).
tools: [Read, Write, Bash]
agent: true
model: haiku
color: yellow
---

# Memory Promote Skill

**Bahasa output:** Indonesia. File paths, field names, category names dalam English.

## Proses

1. **Read lock file** — Read `.claude/scaffold.lock.json`. Cek field `inherits_from`.
   - Jika null atau empty: error "Project ini standalone — tidak ada parent workspace untuk promote. Gunakan `/memory-promote` hanya di child project yang memiliki `inherits_from` di scaffold.lock.json."

2. **Get parent path** — `parent_path = inherits_from` dari lock file.

3. **Validate parent** — Test apakah `<parent_path>/.claude/scaffold.lock.json` ada.
   - Jika tidak: warn "Parent workspace tidak ditemukan di `<parent_path>`. Mungkin sudah dipindah? Update scaffold.lock.json jika perlu."

4. **User specifies entry** — Minta user specify relative path dari `.agent/memory/entries/`:
   - Format: `<category>/<filename>` contoh `gotchas/php-session.md`
   - Validate: category harus salah satu dari: config, context, decisions, errors, gotchas, implementation, learnings, optimization, patterns, test
   - Validate: file harus ada di `.agent/memory/entries/<category>/<filename>`

5. **Construct destination** — `dst = <parent_path>/.agent/memory/entries/<category>/<filename>`

6. **Conflict check**:
   - Jika `dst` tidak ada: proceed langsung
   - Jika `dst` ada dan user tidak pass `--force`: suffix filename dengan `-2`, `-3`, dll sampai tidak conflict
   - Jika `dst` ada dan user pass `--force`: overwrite (warn user dulu)

7. **Move file** — `mv <src> <dst>` (atau Copy-Item + Remove-Item di Windows)

8. **Update parent memory index** — Read `<parent_path>/.agent/memory/index.json`. Tambahkan entry baru ke `entries` array (additive). Write back.

9. **Report result**:
   ```
   Memory promoted:
   FROM: .agent/memory/entries/gotchas/php-session.md
   TO:   <parent_path>/.agent/memory/entries/gotchas/php-session.md
   
   Parent memory index updated.
   ```

## Aturan

- Default: no overwrite — suffix `-2`, `-3` jika conflict
- `--force`: overwrite dengan explicit warning
- Always echo final destination path
- Sonnet karena perlu judgment (conflict resolution, format check)
- Hanya move 1 file per invokasi
- Tidak recursive — tidak promote entire directory

## Error Cases

| Situation | Response |
|---|---|
| No `inherits_from` in lock | Error: "project standalone" |
| Parent lock not found | Warn + ask user to verify |
| Entry file not found | Error: "file not found at .agent/memory/entries/<path>" |
| Invalid category | Error: list valid categories |
| Parent memory dir not found | Try create `<parent>/.agent/memory/entries/<cat>/` first |
