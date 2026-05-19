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

Buat snapshot ringkas dari session saat ini dan simpan ke `.claude/memory/` sebelum context di-reset via `/compact`. Session berikutnya bisa langsung resume tanpa recap panjang.

---

## Proses

### Step 1: Baca State Memory Existing

Read `.claude/memory/MEMORY.md` untuk tahu apa yang sudah tersimpan — hindari duplikasi.

### Step 2: Analisis Session Saat Ini

Ekstrak dari conversation history:

**A. Yang dikerjakan** — tasks selesai (✅) dan di-skip (⏭️) beserta alasannya

**B. Decisions** — pilihan arsitektur, naming, approach; hal yang sengaja NOT dilakukan

**C. Findings & gotchas** — bug ditemukan, pattern yang berhasil/gagal, file penting yang dibaca

**D. State saat ini** — file terakhir dimodifikasi, test in-progress, blocking issue

**E. Next steps** — actionable, berurutan prioritas

### Step 3: Tulis Handoff File

Tulis ke `.claude/memory/handoff-YYYY-MM-DD-HH.md`:

```markdown
# Context Handoff — YYYY-MM-DD HH:MM

**Session duration:** ~N menit
**Context saat disimpan:** ~XX%

## Yang Dikerjakan
- ✅ <task> — <hasil>
- ⏭️ <task> — <alasan skip>

## Decisions Penting
- **<Topik>:** <decision> — <rationale>

## Findings & Gotchas
- `<file:baris>` — <temuan>

## State Saat Ini
**File terakhir dimodifikasi:** <list>
**Belum selesai:** <list>
**Blocking issue:** <issue atau "Tidak ada">

## Next Steps (Prioritas)
1. <actionable step>
2. <actionable step>

## Quick Resume
> "Lanjutkan dari handoff YYYY-MM-DD-HH. Kita sedang mengerjakan <X>. Next: <Z>."
```

### Step 4: Update MEMORY.md Index

Append di bagian atas `.claude/memory/MEMORY.md` (reverse-chrono):

```markdown
## Handoff YYYY-MM-DD HH:MM
- **File:** `handoff-YYYY-MM-DD-HH.md`
- **Tasks:** <ringkasan 1 baris>
- **Next:** <next step terpenting>
```

### Step 5: Output

```
## Context Handoff Saved ✅

File: .claude/memory/handoff-YYYY-MM-DD-HH.md
MEMORY.md: updated

  ✅ N tasks selesai | 📝 N decisions | 🔍 N findings | ➡️ N next steps

Quick resume: "Lanjutkan dari handoff YYYY-MM-DD-HH. Next: <step 1>"

Sekarang aman untuk jalankan /compact.
```

---

## Aturan

- **Hanya baca, tidak eksekusi** — jangan jalankan test atau command apapun saat handoff
- **Ringkas, bukan verbatim** — sintesis bermakna, bukan copy-paste conversation
- **File path selalu root-relative** — agar session berikutnya bisa langsung Read
- **Next steps harus actionable** — bukan "lanjutkan" tapi "buka file X, fix bug di baris Y"
- **Bahasa output:** Indonesia, technical terms English
