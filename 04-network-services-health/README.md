# 🌐 Project 4: Network, Services & System Health (`sysdash`) | الشبكات والخدمات ومراقبة صحة النظام

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This project explores Linux networking, system daemons (`systemd`), open port auditing (`ss`), and automated server health reporting (`sysdash`) from the command line.
- **AR:** يستكشف هذا المشروع شبكات لينكس، وإدارة خدمات النظام الخلفية (`systemd`)، وفحص المنافذ المفتوحة (`ss`)، وأتمتة تقارير صحة الخادم (`sysdash`) عبر سطر الأوامر.

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Manage system services and inspect daemon logs using `systemctl` and `journalctl`.
  - Audit active listening ports and network sockets using `ss -tuln` and `curl -I`.
  - Analyze disk and memory bottlenecks using `df -h`, `du -sh`, `lsblk`, and `free -h`.
  - Build an automated system health dashboard script (`sysdash`).
- **AR:**
  - إدارة خدمات النظام وفحص سجلاتها باستخدام `systemctl` و `journalctl`.
  - تدقيق المنافذ المفتوحة واتصالات الشبكة باستخدام `ss -tuln` و `curl -I`.
  - تحليل استهلاك القرص والذاكرة باستخدام `df -h`, `du -sh`, `lsblk`, و `free -h`.
  - بناء سكربت لوحة مراقبة مؤتمتة لصحة الخادم (`sysdash`).

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: `Ubuntu Linux (WSL)` | Service Manager: `systemd` | Networking: `ss`, `curl`, `ssh` | Storage/Health: `df`, `du`, `free`, `uptime`
- **AR:** نظام التشغيل: `Ubuntu Linux (WSL)` | مدير الخدمات: `systemd` | الشبكات: `ss`, `curl`, `ssh` | الفحص الصحي: `df`, `du`, `free`, `uptime`

---

## ⚙️ Commands Used / الأوامر المستخدمة
`systemctl status`, `journalctl -u`, `ss -tuln`, `curl -I`, `df -h`, `du -sh ~/* | sort -h | tail -5`, `lsblk`, `free -h`, `uptime`

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** A network port is a logical door where a daemon listens for incoming traffic. / **AR:** المنفذ الشبكي (`Port`) هو البوابة المنطقية التي تستمع من خلالها الخدمة للاتصالات الواردة.
2. **EN:** `Connection refused` indicates no active daemon is listening on the target port. / **AR:** رسالة `Connection refused` تعني عدم وجود خدمة نشطة تستمع على هذا المنفذ حالياً.
3. **EN:** Chaining `du -sh` with `sort -h` and `tail` pinpoints disk space hogs in seconds. / **AR:** ربط أوامر `du -sh` مع `sort -h` و `tail` يحدد أكبر الملفات المستهلكة للقرص خلال ثوانٍ.
4. **EN:** Combining network and resource checks into a single Bash script accelerates incident triage. / **AR:** دمج فحوصات الشبكة والموارد في سكربت واحد يسرّع تشخيص الأعطال.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** Port 53 returned `Empty reply from server` with `curl`<br>**AR:** المنفذ 53 أعطى رداً فارغاً عند فحصه بأمر `curl` | **EN:** Identified that Port 53 speaks `DNS` protocol, not `HTTP`.<br>**AR:** التحقق من أن المنفذ 53 يعمل ببروتوكول `DNS` وليس بروتوكول `HTTP`. |
| **EN:** Locating directories consuming excessive disk space<br>**AR:** صعوبة تحديد المجلدات الأكثر استهلاكاً لمساحة القرص | **EN:** Used pipeline `du -sh ~/* \| sort -h \| tail -5` to rank top consumers.<br>**AR:** استخدام أنبوب الأوامر `du -sh` مع `sort -h` لترتيب أكبر المجلدات حجماً. |
| **EN:** Service failing silently in the background<br>**AR:** توقف خدمة خلفية دون رسالة خطأ ظاهرة | **EN:** Inspected daemon state and logs via `systemctl status` and `journalctl`.<br>**AR:** فحص حالة الخدمة وسجلاتها التفصيلية عبر `systemctl status` و `journalctl`. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** Cloud engineers continuously verify `AWS EC2` health checks, security group ports, and daemon uptime to guarantee high availability (`SLA`).
- **AR:** يعتمد مهندسو السحابة يومياً على فحص صحة خوادم `AWS EC2` ومنافذ الشبكة واستمرارية عمل الخدمات لضمان التوافر العالي (`High Availability`).

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **NextWork Reference:** [NextWork Level 4: Network, Services & Health](https://nextwork.ai/refreshed_olive_vibrant_plum/docs/9dc8053e-07e2-4a55-ac13-b90e9520d20b)
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
