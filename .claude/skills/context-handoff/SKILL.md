---
name: context-handoff
description: |
  Simpan ringkasan context session saat ini ke .claude/memory/ sebelum /compact atau akhir session,
  agar findings, decisions, dan next steps tidak hilang saat context di-reset.
  Trigger when: user minta "simpan context", "context-handoff", "save session", "mau compact dulu",
    "ringkas session ini", "handoff", "simpan progress", atau context % mendekati 80%.
  Do NOT trigger when: user baru mulai session (tidak ada yang perlu disimpan).
tools: [Read, Write, Bash]
model: haiku
color: yellow
---

# Context Handoff Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (file path, function name, command).

## Tujuan

Buat snapshot ringkas dari session saat ini dan simpan ke `.claude/memory/` sebelum context di-reset via `/compact`. Dengan ini, session berikutnya punya cukup context untuk melanjutkan tanpa perlu recap panjang.

---

## Proses

### Step 1: Baca State Memory Existing

Read `.claude/memory/MEMORY.md` untuk tahu apa yang sudah pernah disimpan sebelumnya.
Ini membantu menghindari duplikasi dan memastikan handoff yang dihasilkan bersifat additive.

### Step 2: Analisis Session Saat Ini

Dari conversation history session ini, ekstrak:

**A. Apa yang dikerjakan:**
- Task utama yang berhasil diselesaikan (dengan nama file/path jika relevan)
- Task yang gagal atau di-skip beserta alasannya

**B. Decisions yang dibuat:**
- Pilihan arsitektur, naming, approach yang disepakati
- Hal-hal yang sengaja NOT dilakukan (dan kenapa)

**C. Findings & discoveries:**
- Bug atau gotcha yang ditemukan
- Pattern yang berhasil atau tidak berhasil
- Konten file penting yang dibaca dan relevan

**D. State saat ini:**
- File terakhir yang dimodifikasi
- Test yang sedang berjalan / belum selesai
- Blocking issue yang belum resolved

**E. Next steps yang jelas:**
- Apa yang harus dilakukan setelah session ini
- Urutan prioritas jika ada beberapa task

### Step 3: Tulis Handoff File

Buat file baru: `.claude/memory/handoff-YYYY-MM-DD-HH.md`

Format:

```markdown
# Context Handoff — YYYY-MM-DD HH:MM

**Session duration:** ~N menit
**Context saat disimpan:** ~XX% (jika diketahui)

## Yang Dikerjakan

- ✅ <task selesai> — <hasil singkat>
- ✅ <task selesai> — <hasil singkat>
- ⏭️ <task di-skip> — <alasan>

## Decisions Penting

- **<Topik>:** <decision> — <rationale singkat>
- **<Topik>:** <decision> — <rationale singkat>

## Findings & Gotchas

- `<file:baris>` — <temuan atau issue>
- <gotcha> — <solusinya>

## State Saat Ini

**File terakhir dimodifikasi:**
- `<path>` — <perubahan apa>
- `<path>` — <perubahan apa>

**Belum selesai / in progress:**
- <item> — <kenapa belum selesai>

**Blocking issue:**
- <issue jika ada, atau "Tidak ada">

## Next Steps (Prioritas)

1. <next step paling penting>
2. <next step berikutnya>
3. <next step tambahan>

## Quick Context untuk Session Berikutnya

> Paste snippet ini di awal session berikutnya untuk resume cepat:
>
> "Lanjutkan dari handoff `handoff-YYYY-MM-DD-HH.md`. Kita sedang mengerjakan <X>.
> Terakhir selesai: <Y>. Next: <Z>."
```

### Step 4: Update MEMORY.md Index

Append ke `.claude/memory/MEMORY.md` di bagian atas (reverse-chrono):

```markdown
## Handoff YYYY-MM-DD HH:MM
- **File:** `handoff-YYYY-MM-DD-HH.md`
- **Tasks:** <ringkasan 1 baris>
- **Next:** <next step paling penting>
```

### Step 5: Output ke User

```
## Context Handoff Saved ✅

File: .claude/memory/handoff-YYYY-MM-DD-HH.md
MEMORY.md: updated

Ringkasan yang disimpan:
  ✅ <N> tasks selesai
  📝 <N> decisions
  🔍 <N> findings
  ➡️  <N> next steps

Quick resume untuk session berikutnya:
  "Lanjutkan dari handoff YYYY-MM-DD-HH. Next: <step 1>"

Sekarang aman untuk jalankan /compact.
```

---

## Aturan

- **Hanya baca, tidak eksekusi** — jangan jalankan test atau command apapun saat handoff
- **Ringkas, bukan verbatim** — bukan copy-paste conversation, tapi sintesis bermakna
- **File path selalu absolute atau relative-to-root** — agar session berikutnya langsung bisa Read
- **Next steps harus actionable** — bukan "lanjutkan" tapi "buka file X dan fix bug di baris Y"
- **Jika tidak ada yang signifikan** — tulis tetap (bahkan "session eksplorasi tanpa output") agar log lengkap
- **Bahasa output:** Indonesia, technical terms English
