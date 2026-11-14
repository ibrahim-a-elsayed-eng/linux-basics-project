# 🔒 Project 7: Server Hardening & Log Monitor | تأمين الخادم ومراقب السجلات

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This is a training project on Ubuntu WSL. I practiced general SSH hardening and UFW firewall rules, and built a Bash script (`log-monitor.sh`) that monitors a demo application log (`/var/log/demo-app/application.log`) and runs as a hardened `systemd` oneshot service (`log-monitor.service`) under a dedicated user.
- **AR:** هذا مشروع تدريبي على بيئة Ubuntu WSL. تدرّبت فيه على تأمين SSH وقواعد جدار الحماية UFW بشكل عام، وكتبت سكربت Bash (`log-monitor.sh`) لمراقبة سجل تطبيق تجريبي (`/var/log/demo-app/application.log`)، وتشغيله كخدمة `systemd` من نوع `oneshot` (`log-monitor.service`) تحت مستخدم مخصص مع خيارات عزل وحماية.

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Practice basic SSH hardening and UFW firewall rules on Ubuntu WSL.
  - Write `log-monitor.sh` to read the last 200 lines of `/var/log/demo-app/application.log`, count lines with `level=WARN` and `level=ERROR`, write a summary line to `/var/log/log-monitor/report.log`, and print an `ALERT` message if there is at least one `ERROR`.
  - Run the script as a `systemd` oneshot service (`log-monitor.service`) under a dedicated user `log-monitor` with strict sandboxing options.
- **AR:**
  - التدرب على أساسيات تأمين SSH وقواعد جدار الحماية UFW على Ubuntu WSL.
  - كتابة سكربت `log-monitor.sh` لقراءة آخر 200 سطر من `/var/log/demo-app/application.log`، وعدّ الأسطر التي تحتوي على `level=WARN` و`level=ERROR`، وكتابة سطر ملخص في `/var/log/log-monitor/report.log`، وطباعة رسالة `ALERT` عند وجود `ERROR` واحد على الأقل.
  - تشغيل السكربت كخدمة `systemd` من نوع `oneshot` (`log-monitor.service`) تحت المستخدم المخصص `log-monitor` مع خيارات عزل وحماية.

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** `Ubuntu WSL` | `SSH` | `UFW` | `Bash` | `systemd`
- **AR:** `Ubuntu WSL` | `SSH` | `UFW` | `Bash` | `systemd`

---

## 📜 Script: `scripts/log-monitor.sh`

```bash
#!/usr/bin/env bash
set -euo pipefail

source_log="${SOURCE_LOG:-/var/log/demo-app/application.log}"
report_log="${REPORT_LOG:-/var/log/log-monitor/report.log}"
window_lines="${WINDOW_LINES:-200}"

if [[ ! -r "$source_log" ]]; then
  printf 'ERROR source log is not readable: %s\n' "$source_log" >&2
  exit 1
fi

recent_log="$(tail -n "$window_lines" "$source_log")"
warning_count="$(grep -c 'level=WARN' <<<"$recent_log" || true)"
error_count="$(grep -c 'level=ERROR' <<<"$recent_log" || true)"
timestamp="$(date --iso-8601=seconds)"
summary="$timestamp source=$source_log window_lines=$window_lines warnings=$warning_count errors=$error_count"

printf '%s\n' "$summary" | tee -a "$report_log"

if (( error_count > 0 )); then
  printf 'ALERT errors=%s source=%s\n' "$error_count" "$source_log" >&2
fi
```

---

## ⚙️ Systemd Service: `config/log-monitor.service`

Runs as `Type=oneshot` under user/group `log-monitor` with these hardening options:
`NoNewPrivileges`, `PrivateTmp`, `PrivateDevices`, `ProtectSystem=strict`, `ProtectHome`, `ProtectKernelTunables`, `ProtectKernelModules`, `ProtectControlGroups`, `UMask=0027`.

```ini
[Unit]
Description=Scan the demo application log for warnings and errors
Documentation=man:systemd.service(5)
After=local-fs.target
ConditionPathExists=/var/log/demo-app/application.log

[Service]
Type=oneshot
User=log-monitor
Group=log-monitor
ExecStart=/usr/local/lib/log-monitor/log-monitor.sh
LogsDirectory=log-monitor
LogsDirectoryMode=0750
UMask=0027
NoNewPrivileges=yes
PrivateTmp=yes
PrivateDevices=yes
ProtectSystem=strict
ProtectHome=yes
ProtectKernelTunables=yes
ProtectKernelModules=yes
ProtectControlGroups=yes
```

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **GitHub Profile:** [ibrahim-a-elsayed-eng](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented by Ibrahim Ahmed Elsayed.*
