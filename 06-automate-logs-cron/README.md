# ⏱️ Project 6: Automate Logs & Cron Scheduling | أتمتة السجلات وجدولة المهام عبر Cron

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This project implements automated background job scheduling using `cron` (`crontab`) and enterprise log lifecycle management using `logrotate` to prevent disk exhaustion on Linux servers.
- **AR:** يطبّق هذا المشروع جدولة المهام الخلفية تلقائياً باستخدام خدمة `cron` (`crontab`) وإدارة دورة حياة السجلات عبر أداة `logrotate` لحماية الخوادم من امتلاء القرص الصلب.

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Configure scheduled background maintenance jobs using 5-field `crontab` expressions.
  - Design custom `logrotate` policies to compress, rotate, and purge aging application logs.
  - Ensure cron scripts use absolute paths and redirect stdout/stderr cleanly.
  - Verify scheduled job execution via system logs (`/var/log/syslog` & `journalctl`).
- **AR:**
  - إعداد مهام الصيانة المجدولة في الخلفية باستخدام تعبيرات `crontab` القياسية.
  - تصميم سياسات `logrotate` مخصصة لضغط وتدوير وحذف السجلات القديمة تلقائياً.
  - ضمان عمل سكربتات `cron` بالمسارات المطلقة وتوجيه المخرجات والأخطاء بشكل سليم.
  - التحقق من تنفيذ المهام المجدولة عبر سجلات النظام (`/var/log/syslog`).

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: `Ubuntu Linux (WSL)` | Scheduler: `cron` (`crontab`) | Log Lifecycle: `logrotate` | Compression: `gzip`
- **AR:** نظام التشغيل: `Ubuntu Linux (WSL)` | الجدولة: `cron` (`crontab`) | تدوير السجلات: `logrotate` | الضغط: `gzip`

---

## ⚙️ Commands Used / الأوامر المستخدمة
`crontab -e`, `crontab -l`, `sudo service cron status`, `sudo systemctl status cron`, `logrotate -d`, `sudo logrotate -f`, `tail -f /var/log/syslog`

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** Cron runs with a minimal `PATH` environment, so scripts must always use absolute paths. / **AR:** تعمل خدمة `cron` ببيئة متغيرات محدودة، لذا يجب دائماً كتابة المسارات المطلقة الكاملة داخل السكربتات.
2. **EN:** Testing `logrotate` with `-d` (dry-run debug mode) prevents accidental log deletion. / **AR:** اختبار إعدادات `logrotate` بالخيار `-d` (وضع المحاكاة) يمنع الحذف الخاطئ للسجلات.
3. **EN:** Unmanaged log growth is one of the top causes of production server outages. / **AR:** تُعد زيادة حجم ملفات السجلات دون تدوير من أكثر أسباب توقف خوادم الإنتاج شيوعاً.
4. **EN:** Redirecting cron output (`>> /path/cron.log 2>&1`) captures silent background failures. / **AR:** توجيه مخرجات وأخطاء المهام المجدولة (`2>&1`) يتيح اكتشاف الأعطال الخفية في الخلفية.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** Script works manually in terminal but fails inside `cron`<br>**AR:** السكربت يعمل يدوياً ولكنه يفشل عند تشغيله عبر `cron` | **EN:** Replaced relative paths with absolute paths (`/home/hisoka/...`) and defined `PATH`.<br>**AR:** استبدال المسارات النسبية بمسارات مطلقة كاملة وتحديد متغير `PATH` صراحةً. |
| **EN:** `cron` daemon not running automatically in WSL session<br>**AR:** خدمة `cron` لا تعمل تلقائياً عند بدء جلسة WSL | **EN:** Started and verified service via `sudo service cron start` and checked `syslog`.<br>**AR:** تشغيل الخدمة عبر `sudo service cron start` والتحقق من السجلات. |
| **EN:** Verifying `logrotate` config without waiting 24 hours<br>**AR:** التحقق من صحة إعدادات تدوير السجلات فوراً دون انتظار يوم كامل | **EN:** Used `logrotate -d` for dry-run validation and `logrotate -f` to force rotation.<br>**AR:** استخدام `logrotate -d` للفحص التجريبي ثم `logrotate -f` للتنفيذ الفوري. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** Automated log rotation and scheduled maintenance on `AWS EC2` prevent disk-full crashes and reduce `Amazon CloudWatch` / `EBS` storage costs.
- **AR:** تمنع أتمتة تدوير السجلات والمهام المجدولة توقف خوادم `AWS EC2` بسبب امتلاء القرص، كما تقلل تكاليف التخزين السحابي.

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
