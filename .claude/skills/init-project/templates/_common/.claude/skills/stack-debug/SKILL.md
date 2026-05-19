---
name: stack-debug
description: |
  Health check seluruh web dev stack (Nginx, PHP, MySQL, Oracle), report errors recent.
  Trigger when: user minta "cek stack", "debug server", "kenapa lambat", "ada error?", atau awal session web dev.
  Do NOT trigger when: debugging satu komponen spesifik (use targeted tool).
tools: [Bash, Read, Grep]
model: haiku
color: yellow
---

# Stack Debug Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (service name, port, error message, process name).

## Step 0: OS Detection

Jalankan dulu untuk menentukan mode:

```bash
if uname -r 2>/dev/null | grep -qi microsoft; then
  echo "wsl"
elif [ -f /proc/version ]; then
  echo "linux"
elif [ -d /System/Library ]; then
  echo "macos"
else
  echo "windows"
fi
```

Gunakan **Linux Mode** untuk hasil `linux` atau `wsl`.
Gunakan **Windows Mode** untuk hasil `windows`.

---

## Linux Mode (Fedora / Ubuntu / WSL)

### 1. Service Status

Deteksi nama service aktual dulu (Fedora/RHEL pakai nama berbeda):
```bash
# PHP-FPM: mungkin php-fpm, php82-php-fpm, php83-php-fpm, dll
systemctl list-units --type=service --state=running --no-pager | grep -E "php[0-9]?.*fpm"

# MySQL/MariaDB: mungkin mysql atau mariadb
systemctl list-units --type=service --state=running --no-pager | grep -E "mysql|mariadb"

# Redis/Valkey: mungkin redis atau valkey (Fedora 40+ pakai Valkey)
systemctl list-units --type=service --state=running --no-pager | grep -E "redis|valkey"
```

Kemudian cek status tiap service yang ditemukan:
```bash
systemctl status nginx --no-pager -l
systemctl status php-fpm php82-php-fpm php83-php-fpm php84-php-fpm --no-pager -l 2>/dev/null
systemctl status mysql mariadb --no-pager -l 2>/dev/null
systemctl status postgresql --no-pager -l
systemctl status redis valkey --no-pager -l 2>/dev/null
```

### 2. Process Check
```bash
ps aux --no-header | grep -E "nginx|php-fpm|mariadbd|mysqld|postgres|oracle|redis-server|valkey" | grep -v grep | awk '{printf "%-8s %-6s %5s MB  %s\n", $1, $2, int($6/1024), $11}'
```

### 3. Port Check
```bash
ss -tlnp | grep -E ":80 |:443 |:3306 |:5432 |:1521 |:6379 |:8080 |:8443 "
```

### 4. Recent Errors
```bash
# Nginx
tail -n 50 /var/log/nginx/error.log 2>/dev/null || journalctl -u nginx --no-pager -n 50

# PHP-FPM
tail -n 50 /var/log/php-fpm/error.log 2>/dev/null || journalctl -u php-fpm --no-pager -n 50

# MySQL
tail -n 50 /var/log/mysql/error.log 2>/dev/null || journalctl -u mysql --no-pager -n 50

# Oracle (jika ada)
[ -n "$ORACLE_BASE" ] && tail -n 50 "$ORACLE_BASE/diag/rdbms/orcl/orcl/trace/alert_orcl.log" 2>/dev/null
```

### 5. Latency Probe
```bash
# HTTP
curl -s -o /dev/null -w "%{time_total}" http://localhost

# MySQL
mysql -u root --connect-timeout=2 -e "SELECT 1" 2>&1

# Oracle (jika ada)
[ -n "$ORACLE_SID" ] && sqlplus -S system/REDACTED_PASSWORD@localhost:1521/orcl <<< "SELECT 1 FROM DUAL;" 2>&1
```

---

## Windows Mode (Laragon / XAMPP)

### 1. Service Status
```powershell
Get-Service -Name 'MySQL*','nginx','OracleService*' | Select Name,Status
```

### 2. Process Check
```powershell
Get-Process nginx,php-cgi,mysqld,oracle -ErrorAction SilentlyContinue |
  Select Name,@{N='MB';E={[math]::Round($_.WorkingSet/1MB,1)}}
```

### 3. Port Check
```cmd
netstat -ano | findstr ":80 :443 :3306 :1521"
```

### 4. Recent Errors
- Laragon error log: `D:\Server\laragon\logs\error.log`
- PHP error log: `D:\Server\laragon\logs\php_error.log`
- MySQL error log: `D:\Server\laragon\bin\mysql\mysql-8.0.30\data\*.err`
- Oracle alert log: `%ORACLE_BASE%\diag\rdbms\orcl\orcl\trace\alert_orcl.log`

```bash
# Baca via Bash (Git Bash / WSL):
tail -n 50 /d/Server/laragon/logs/error.log 2>/dev/null
```

### 5. Latency Probe
```bash
curl -s -o /dev/null -w "%{time_total}" http://localhost
mysql -u root --connect-timeout=2 -e "SELECT 1" 2>&1
sqlplus -S system/REDACTED_PASSWORD@localhost:1521/orcl <<< "SELECT 1 FROM DUAL;" 2>&1
```

---

## Format Output

```
## Stack Health Report — [timestamp] ([OS: Linux/Windows])

| Service | Status | Memory | Port | Latency | Health |
|---|---|---|---|---|---|
| Nginx   | ✅ Running | 24 MB  | 80 ✅  | 106ms | OK |
| PHP-FPM | ✅ Running | 60 MB  | -     | -     | OK |
| MySQL   | ✅ Running | 1088 MB | 3306 ✅ | 0.21ms | OK |
| Oracle  | ✅ Running | 413 MB | 1521 ✅ | 0.15ms | OK |

### Recent Errors
[Error summary atau "Tidak ada error baru"]

### Recommendations
[Actionable items jika ada issue]
```

## Aturan

- **Read-only:** jangan restart service otomatis — suggest command exact untuk user
- Jika service down, sebutkan command start yang tepat:
  - **Linux:** `sudo systemctl start nginx` / `sudo systemctl start mysql`
  - **Windows/Laragon:** "Start dari Laragon control panel"
  - **Oracle (Linux):** `sqlplus / as sysdba` → `STARTUP;`
  - **Oracle (Windows):** `net start OracleServiceORCL` dan `lsnrctl start`
- Bahasa output: Indonesia, technical terms English
