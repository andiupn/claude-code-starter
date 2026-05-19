---
name: log-monitor
description: |
  Monitor log file realtime via Monitor tool, filter pattern, dan stop on condition.
  Trigger when: user minta "monitor log", "watch logs", "tail logs", "stream output", atau debug stack runtime.
  Do NOT trigger when: user butuh log analysis batch (use Read), atau log static file kecil.
tools: [Bash, Read, Monitor]
model: haiku
color: red
---

# Log Monitor Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (log path, regex pattern, error messages).

## Proses

1. **Konfirmasi target log** — minta path log file jika tidak disebut (default: tanya user atau infer dari context stack yang sedang di-debug)
2. **Pattern filter** — opsional: regex untuk highlight (contoh: `error|warning|fatal|exception`)
3. **Stop condition** — opsional: pattern yang menandai berhenti (contoh: `Server started`, `deploy success`, `READY`)
4. **Mulai stream** — gunakan Monitor tool untuk stream new lines dari log file
5. **Reaksi live** — saat error/warning pattern match, summarize dan suggest fix

## Aturan

- Maksimal 10 menit streaming default (timeout safety); informasikan user jika mendekati limit
- Jika log file tidak ada, suggest cara tail dari running process:
  - **Linux (systemd):** `journalctl -u nginx -f`, `journalctl -u mariadb -f`, `journalctl -u php83-php-fpm -f`
  - **Linux log paths:** `/var/log/nginx/error.log`, `/var/log/php-fpm/error.log`, `/var/log/mariadb/mariadb.log`
  - **PowerShell:** `Get-Content -Path "log.txt" -Wait -Tail 50`
  - **Laragon error log:** `D:\Server\laragon\logs\php_error.log`
  - **MySQL error log:** `D:\Server\laragon\bin\mysql\mysql-8.0.30\data\<hostname>.err`
  - **Oracle alert log (Linux):** `$ORACLE_BASE/diag/rdbms/orcl/orcl/trace/alert_orcl.log`
  - **Oracle alert log (Windows):** `%ORACLE_BASE%\diag\rdbms\orcl\orcl\trace\alert_orcl.log`
- Jika tidak ada error ditemukan setelah 2 menit streaming: report "Tidak ada error baru dalam 2 menit — log bersih"
- Bahasa output: Indonesia, technical terms English
