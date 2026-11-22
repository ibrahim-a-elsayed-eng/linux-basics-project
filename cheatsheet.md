# Linux & DevOps CLI Cheatsheet (Projects 01–07 + Daily Ops)

Comprehensive quick reference extracted from **Projects 01–07** plus essential everyday Linux/Cloud troubleshooting commands.
If you forget a flag, check `command --help` or `man command` (press `/` to search inside `man`, `q` to quit).

---

## 1. Navigation, Files, Paths & Redirection (`Projects 01, 02, 05, 06` + Daily Ops)
- `pwd` — print current working directory (always verify before `cp`, `mv`, `rm`, or `chmod`)
- `ls -l` long list | `ls -a` hidden files | `ls -la` both | `ls -d path1 path2` confirm exact target directories
- `mkdir -p dir/sub` — create nested directories cleanly (no error if they already exist)
- `cp -r src/ dest/` copy | `mv src dest` move/rename | `rm -i file` remove with prompt
- `ln -s /target/path /link/path` — create a symbolic link *(Daily Ops)*
- `cat file` | `head -n 20 file` | `tail -n 200 file` | `tail -f /var/log/app.log` (live follow) | `less file` (scroll safely)
- `wc -l file` — count lines (`wc -l < file` prints count without filename)
- `find /var/log -type f -name "*.log"` — search files by name/type (`-mtime +7` for files older than 7 days) *(Daily Ops)*
- `realpath file` — print full absolute path
- `echo "$PATH"` | `command -v name` — check search paths and where Bash resolves a command
- `export PATH="$HOME/bin:$PATH"` in `~/.bashrc`, then `source ~/.bashrc`
- `env` / `printenv VAR` — inspect environment variables *(Daily Ops)*
- **Redirection & Pipes:**
  - `>` overwrite stdout | `>>` append stdout | `2>/dev/null` discard stderr | `>> app.log 2>&1` append both stdout and stderr
  - `printf '%s\n' "$line" | tee -a report.log` — write to terminal and append to file simultaneously

---

## 2. Users, Groups & DAC Permissions (`Projects 02, 07` + Daily Ops)
- `whoami` | `id` | `groups` — verify current user, UID/GID, and group memberships
- `su - teammate` — switch user with a full login shell (never rely on `~` across users; use absolute paths)
- `sudo -l` — list commands allowed via `sudo` *(Daily Ops)*
- `chmod 700 script.sh` — owner-only `rwx` (private admin scripts)
- `chmod 750 dir/` — owner `rwx`, group `r-x`, others none (least-privilege shared folders/logs)
- `chmod 640 app.log` — owner `rw-`, group `r--`, others none
- `chmod 600 ~/.ssh/key.pem` — strict owner-only read/write required by SSH private keys *(Daily Ops)*
- `chmod +x script.sh` — make a script executable | `chmod o+x parent_dir` — allow directory traversal only
- `chown user:group path` | `chgrp group path` — change owner and/or group
- `stat path` — inspect exact octal mode (`0750`), ownership, and timestamps

---

## 3. Text Processing & Log Analysis (`Projects 01, 05, 06, 07` + Daily Ops)
- **grep:**
  - `grep -n 'ERROR' file` (line numbers) | `grep -c 'level=WARN' file` (count) | `grep -i 'warn' file` (case-insensitive)
  - `grep -F 'exact.text' file` (literal string, no regex) | `grep -r 'pattern' /etc/` (recursive) | `grep -v '^#' file` (exclude comments)
- **awk & cut:**
  - `awk '{print $1}' access.log` — print field 1 (whitespace-delimited)
  - `df -h / | awk 'NR==2 {print $5}'` — extract disk usage percentage from row 2
  - `awk -F':' '{print $1, $7}' /etc/passwd` — custom delimiter *(Daily Ops)*
  - `cut -d':' -f1 /etc/passwd` — fast single-delimiter column extraction *(Daily Ops)*
- **Ranking (`sort` + `uniq`):**
  ```bash
  awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 5
  ```
  - Always `sort` before `uniq -c` (`uniq` only counts adjacent duplicates); `sort -nr` sorts numerically descending
- **sed:**
  - `sed 's/old/new/' file` (first match/line) | `sed 's/old/new/g' file` (all matches) | `sed 's/%//'` (strip `%` for integer tests)
  - `sed -i '...' file` edits in-place — back up or test on a copy first
  - Mask last IPv4 octet with extended regex (`-E`):
    ```bash
    sed -E 's/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)[0-9]{1,3}/\1XXX/g' access.log > access-clean.log
    ```
- **JSON & Batch Pipelines *(Daily Ops)*:**
  - `jq '.' response.json` | `aws ... | jq -r '.Reservations[].Instances[].InstanceId'` — inspect/query JSON from APIs & Cloud CLIs
  - `find . -name "*.tmp" -print0 | xargs -0 rm -f` — safely pass filenames (even with spaces) into commands

---

## 4. Packages, Processes, Signals & Storage (`Projects 03, 04` + Daily Ops)
- **APT Package Lifecycle:**
  - `sudo apt update` — refresh package index before installing
  - `apt search <pkg>` | `apt show <pkg>` | `apt list --installed 2>/dev/null | wc -l`
  - `sudo apt install -y <pkg>` | `sudo apt remove <pkg>` (keeps configs) | `sudo apt purge <pkg>` (removes configs)
  - `sudo apt autoremove -y` — remove unused orphaned dependencies
- **Processes, Jobs & Signals:**
  - `ps aux --sort=-%cpu | head -11` — top CPU consumers | `ps aux --sort=-%mem | head -6` — top memory consumers
  - `pgrep -a <name>` — quick PID lookup *(Daily Ops)* | `htop` / `top` — live resource monitor
  - `command &` (run in background) | `jobs` (list background jobs) | `fg %1` (bring back to foreground)
  - `kill -15 <PID>` (`SIGTERM`) — graceful shutdown first (lets process flush state & close sockets)
  - `kill -9 <PID>` (`SIGKILL`) — immediate kernel termination (last resort only)
- **System Health & Disk Usage:**
  - `uname -a` | `uptime` | `free -h` | `lsblk` (block devices/volumes)
  - `df -h` (filesystem space) | `df -i` (inode exhaustion check — disk can report free space yet fail on 100% inodes!) *(Daily Ops)*
  - `du -sh ~/* | sort -h | tail -5` — pinpoint largest directories

---

## 5. Networking, Sockets, SSH & Firewall (`Projects 04, 07` + Daily Ops)
- **Ports & Open Files:**
  - `ss -tuln` — listening TCP (`-t`) and UDP (`-u`) sockets with numeric ports (`-n`)
  - `sudo ss -tulpn` — also show owning process (`-p`) *(Daily Ops)*
  - `sudo lsof -i :80` — identify which process is holding a specific port or file *(Daily Ops)*
- **Connectivity, DNS & HTTP Checks:**
  - `hostname -I` | `ip a` | `ip route` — inspect local IPs and routing table *(Daily Ops)*
  - `ping -c 4 <ip>` — ICMP reachability check (note: Security Groups/firewalls often block ICMP even when TCP works)
  - `dig example.com +short` | `dig @1.1.1.1 example.com TXT` — verify DNS records & resolvers *(Daily Ops)*
  - `nc -zv <host> <port>` — verify raw TCP port connectivity without assuming HTTP *(Daily Ops)*
  - `curl -I https://example.com` — fetch HTTP response headers (`Empty reply` on non-HTTP ports like DNS `53` means protocol mismatch)
  - `curl -sS -o /dev/null -w "%{http_code}\n" https://example.com` — quick status-code probe *(Daily Ops)*
- **SSH, Keys & File Transfers:**
  - `ssh-keygen -t ed25519 -f ~/.ssh/my-key` — generate key pair (upload `.pub` only; never expose the private key)
  - `ssh -i ~/.ssh/my-key.pem user@<host>` — connect with explicit private key (type full `yes` on host-key prompt)
  - `scp -i ~/.ssh/key.pem -r ./dir user@<host>:/remote/dir` — simple SSH file/directory copy *(Daily Ops)*
  - `rsync -avzn /src/ /dest/` (dry-run first) -> `rsync -avzP /src/ user@<host>:/dest/` — fast incremental sync *(Daily Ops)*
- **SSH & UFW Hardening (`Project 07`):**
  - Core `/etc/ssh/sshd_config` hardening: `PubkeyAuthentication yes`, `PasswordAuthentication no`, `KbdInteractiveAuthentication no`, `PermitRootLogin no`, `AllowUsers <user>`
  - `sudo sshd -t` — validate SSH daemon config syntax BEFORE reloading `ssh` *(Daily Ops)*
  - `sudo ufw status verbose` | `sudo ufw default deny incoming` | `sudo ufw allow 22/tcp` | `sudo ufw enable` (verify SSH rule before enabling!)

---

## 6. Bash Scripting & Fail-Fast Patterns (`Projects 05, 07`)
- **Recommended Script Header:**
  ```bash
  #!/usr/bin/env bash
  set -euo pipefail
  ```
  - `-e` exit on error | `-u` fail on unset variables | `-o pipefail` fail if any command in a pipe fails
- **Variables, Arguments & Tests:**
  - Always double-quote variables: `"$var"` | Provide safe defaults: `"${VAR:-default}"`
  - `$1` first arg | `$#` arg count | `$@` all args | `$?` last exit code (`0` = success)
  - `[ -f "$file" ]` regular file exists | `[ -d "$dir" ]` directory exists | `[[ ! -r "$log" ]]` not readable
  - Numeric comparisons: `[ "$DISK_USAGE" -gt 80 ]` or `(( error_count > 0 ))`
  - Iteration: `for f in *.txt; do ...; done`
  - Safe `grep -c` under `set -euo pipefail`: `count="$(grep -c 'WARN' <<<"$data" || true)"` (because `grep -c` exits `1` when zero lines match!)
- **Validation & Debugging:**
  - `bash -n script.sh` — syntax check without executing
  - `bash -x script.sh` — trace variable expansion and execution line-by-line
  - `date +%F` (`YYYY-MM-DD`) | `date --iso-8601=seconds` (standardized audit timestamps)

---

## 7. Services (`systemd`), Scheduling (`cron`), `logrotate` & Backups (`Projects 04, 05, 06, 07`)
- **`systemd` & `journalctl`:**
  - `sudo systemctl status <svc>` | `systemctl is-active <svc>` | `systemctl --failed`
  - `sudo systemctl enable --now <svc>` | `sudo systemctl disable --now <svc>`
  - `sudo systemctl daemon-reload` — always run after editing `.service` or `.timer` unit files *(Daily Ops)*
  - `systemctl list-timers --all` — inspect scheduled `systemd` timers *(Daily Ops)*
  - `journalctl -u <svc> -n 50 --no-pager` | `journalctl -u <svc> -f` (live tail) | `journalctl --since "1 hour ago"` | `journalctl -xeu <svc>`
  - **Unit Sandboxing (`Project 07`):** `User=`, `Group=`, `NoNewPrivileges=yes`, `ProtectSystem=strict`, `ProtectHome=yes`, `PrivateTmp=yes`, `PrivateDevices=yes`, `UMask=0027`, `ConditionPathExists=`
- **`cron`:**
  - `EDITOR=nano crontab -e` (edit) | `crontab -l` (verify saved lines)
  - `*/5 * * * * /full/path/script.sh >> /full/path/cron.log 2>&1` (`minute hour day-of-month month weekday`)
  - Always use absolute paths inside `cron` (minimal `PATH` env); check `sudo service cron status` and `grep CRON /var/log/syslog`
  - On WSL, `cron` only runs while the Ubuntu session is active
- **`logrotate`:**
  - `sudo logrotate -d /etc/logrotate.d/app` — dry-run check first (no changes written)
  - `sudo logrotate -f /etc/logrotate.d/app` — force immediate rotation test
- **`tar` Backups & `diff` Verification:**
  ```bash
  tar -czf backup.tar.gz folder/        # create (c), gzip (z), file name (f)
  tar -tzf backup.tar.gz                # list (t) without extracting
  tar -xzf backup.tar.gz -C dest/       # extract (x) into a separate folder (-C)
  diff -qr dirA dirB                    # silent + exit code 0 means identical
  ```

---

## 8. Safe Operational Habits (`Projects 01–07`)
- **Back up before changing configs/scripts:** `cp script.sh script.sh.bak` (and disable old timers with `systemctl disable --now` before replacing unit files).
- **Never trust a backup without a restore + `diff -qr`:** extract into a separate `-C` folder and check `ls -d path1 path2` so you know you compared the right directories.
- **Dry-run destructive/scheduled changes:** run `bash -n`, `logrotate -d`, `sshd -t`, and `rsync -avzn` before live execution.
- **Inspect shell history commands carefully** before pressing `Enter`, especially for `rm`, `sed -i`, `chmod -R`, and `crontab` edits.
