# 🔒 Project 7: Server Hardening, Log Auditing & Monitoring | تأمين الخوادم وتدقيق السجلات والمراقبة

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This capstone Linux security project implements enterprise server hardening (`SSH` lockdown, `UFW` firewall rules, `Fail2ban` intrusion prevention), centralized log auditing, and continuous resource monitoring.
- **AR:** يطبّق مشروع التخرج الأمني هذا تأمين خوادم لينكس بمستوى المؤسسات (تأمين `SSH`، وضبط جدار الحماية `UFW`، ومنع الاختراق عبر `Fail2ban`)، مع التدقيق المتقدم للسجلات والمراقبة المستمرة.

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Harden `SSH` configuration (`/etc/ssh/sshd_config`) by disabling root login and enforcing key-based authentication.
  - Configure `UFW` firewall rules following the Principle of Least Privilege (default deny incoming).
  - Detect brute-force login attempts in `/var/log/auth.log` and automate IP banning with `Fail2ban`.
  - Monitor live network sockets and resource anomalies using `ss -tulpn` and `htop`.
- **AR:**
  - تأمين خدمة `SSH` عبر تعطيل دخول الجذر (`PermitRootLogin no`) وفرض المصادقة بالمفاتيح المشفرة.
  - ضبط قواعد جدار الحماية `UFW` وفق مبدأ الحد الأدنى من الصلاحيات (منع جميع الاتصالات الواردة افتراضياً).
  - رصد محاولات الاختراق في سجل `/var/log/auth.log` وحظرها تلقائياً باستخدام `Fail2ban`.
  - مراقبة المنافذ المفتوحة وموارد النظام لحظياً باستخدام `ss -tulpn` و `htop`.

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: `Ubuntu Linux (WSL)` | Firewall: `UFW` | Security: `OpenSSH`, `Fail2ban` | Auditing: `auth.log`, `ss`, `htop`
- **AR:** نظام التشغيل: `Ubuntu Linux (WSL)` | جدار الحماية: `UFW` | الأمان: `OpenSSH`, `Fail2ban` | التدقيق: `auth.log`, `ss`, `htop`

---

## ⚙️ Commands Used / الأوامر المستخدمة
`sudo ufw default deny incoming`, `sudo ufw allow ssh`, `sudo ufw enable`, `sudo ufw status verbose`, `sudo systemctl status fail2ban`, `sudo ss -tulpn`, `grep "Failed password" /var/log/auth.log`

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** Disabling root SSH login (`PermitRootLogin no`) and password auth eliminates 99% of brute-force risks. / **AR:** تعطيل الدخول المباشر بحساب `root` عبر `SSH` واعتماد المفاتيح المشفرة يقضي على معظم هجمات التخمين.
2. **EN:** Always allow `SSH` port before enabling `UFW` to avoid locking yourself out of a remote cloud server. / **AR:** يجب دائماً السماح بمنفذ `SSH` قبل تفعيل جدار الحماية `UFW` لتجنب حظر نفسك خارج الخادم السحابي.
3. **EN:** Auditing `/var/log/auth.log` with `grep` reveals unauthorized access patterns immediately. / **AR:** فحص سجل `/var/log/auth.log` باستخدام `grep` يكشف محاولات الدخول غير المصرح بها فوراً.
4. **EN:** Host-level firewalls (`UFW`) work alongside cloud firewalls (`AWS Security Groups`) for Defense-in-Depth. / **AR:** يعمل جدار الحماية الداخلي (`UFW`) بالتكامل مع `AWS Security Groups` لتطبيق استراتيجية الدفاع متعدد الطبقات.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** Risk of SSH lockout when activating `UFW` firewall<br>**AR:** خطر انقطاع اتصال `SSH` عند تفعيل جدار الحماية | **EN:** Configured `sudo ufw allow 22/tcp` explicitly prior to running `sudo ufw enable`.<br>**AR:** إضافة قاعدة السماح لمنفذ `22/tcp` أولاً قبل تفعيل جدار الحماية. |
| **EN:** Syntax error in `/etc/ssh/sshd_config` breaking SSH daemon<br>**AR:** خطأ إملائي في ملف إعدادات `SSH` قد يوقف الخدمة | **EN:** Validated configuration using `sudo sshd -t` before restarting `sshd`.<br>**AR:** فحص سلامة ملف الإعدادات بالأمر `sudo sshd -t` قبل إعادة تشغيل الخدمة. |
| **EN:** Filtering thousands of lines in `auth.log` for attacks<br>**AR:** صعوبة فرز آلاف الأسطر في سجل المصادقة لرصد الهجمات | **EN:** Automated extraction of failed IPs using `grep "Failed password"` and `awk`.<br>**AR:** أتمتة استخراج العناوين المشبوهة باستخدام `grep` و `awk`. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** Every public-facing `AWS EC2` instance is scanned by bots within minutes of launch; OS hardening, `Security Groups`, and log auditing are mandatory production skills.
- **AR:** يتعرض أي خادم `AWS EC2` متصل بالإنترنت لمحاولات فحص آلي خلال دقائق من إطلاقه؛ لذا فإن تأمين نظام التشغيل وتدقيق السجلات مهارات إلزامية لمهندس السحابة.

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
