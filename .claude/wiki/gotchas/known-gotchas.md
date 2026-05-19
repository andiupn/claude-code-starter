# Known Gotchas

Catatan gotcha (hal yang tidak obvious dari kode/dokumentasi) yang ditemukan saat development.

## Format

Setiap entry: judul singkat, deskripsi 1-3 baris, dan solusi/workaround.

---

## Example Entry (delete this after first real entry)

### CRLF line endings di .sh files
- **Symptom:** `$'\r': command not found` saat run script di Linux/macOS
- **Cause:** File di-save dengan CRLF (biasanya dari editor Windows)
- **Fix:** `dos2unix script.sh` atau set editor ke LF, dan tambahkan `.gitattributes`:
  ```
  *.sh text eol=lf
  ```

---

_(Add new gotchas below as you discover them. Use `/knowledge-extract` to harvest from session.)_
