# 📜 Project 5: Advanced Bash Scripting & Automation | البرمجة النصية المتقدمة والأتمتة بلغة Bash

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This project focuses on mastering modular Bash scripting for Cloud & DevOps automation, including variables, conditionals, loops, functions, strict error handling (`set -euo pipefail`), and timestamped logging.
- **AR:** يركز هذا المشروع على إتقان برمجة سكربتات `Bash` المعيارية لأتمتة مهام السحابة وعمليات `DevOps`، بما يشمل المتغيرات، الجمل الشرطية، الحلقات التكرارية، الدوال، ومعالجة الأخطاء الصارمة (`set -euo pipefail`).

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Write reusable Bash scripts accepting dynamic CLI arguments (`$1`, `$2`, `$@`).
  - Enforce strict fail-fast execution using `set -euo pipefail` and exit codes (`$?`).
  - Automate backup and health verification workflows using loops and conditionals.
  - Validate script syntax safely before execution using `bash -n` and `bash -x`.
- **AR:**
  - كتابة سكربتات `Bash` قابلة لإعادة الاستخدام تقبل المعاملات الديناميكية (`$1`, `$2`, `$@`).
  - فرض الإيقاف الآمن عند الأخطاء باستخدام `set -euo pipefail` ورموز الخروج (`$?`).
  - أتمتة مهام النسخ الاحتياطي والفحص الصحي باستخدام الحلقات والجمل الشرطية.
  - التحقق من سلامة الكود قبل التشغيل باستخدام `bash -n` وتتبع التنفيذ عبر `bash -x`.

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: `Ubuntu Linux (WSL)` | Language: `GNU Bash` | Debugging: `bash -n`, `bash -x` | Archiving: `tar`, `gzip`
- **AR:** نظام التشغيل: `Ubuntu Linux (WSL)` | اللغة: `GNU Bash` | التصحيح: `bash -n`, `bash -x` | الأرشفة: `tar`, `gzip`

---

## ⚙️ Commands Used / الأوامر المستخدمة
`#!/bin/bash`, `set -euo pipefail`, `chmod +x`, `if [ ... ]; then`, `for / while`, `read`, `tar -czf`, `bash -n script.sh`, `bash -x script.sh`

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** Adding `set -euo pipefail` prevents cascading failures when a command or variable fails. / **AR:** إضافة `set -euo pipefail` في بداية السكربت تمنع استمرار التنفيذ الخاطئ عند فشل أي أمر فرعي.
2. **EN:** Always quote variables (`"$VAR"`) to prevent word splitting on paths containing spaces. / **AR:** وضع المتغيرات دائماً بين علامتي تنصيص (`"$VAR"`) يمنع انكسار المسارات التي تحتوي على مسافات.
3. **EN:** Using `bash -n` checks syntax without running destructive commands. / **AR:** استخدام `bash -n` يفحص القواعد اللغوية للسكربت دون تنفيذ الأوامر فعلياً.
4. **EN:** Modular functions keep cloud bootstrap scripts (`EC2 User Data`) clean and maintainable. / **AR:** تقسيم الكود إلى دوال معيارية يجعل سكربتات تهيئة الخوادم (`EC2 User Data`) منظمة وسهلة الصيانة.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** Script continuing execution after a failed directory change<br>**AR:** استمرار السكربت في العمل رغم فشل الانتقال للمجلد | **EN:** Added `set -euo pipefail` and explicit `[ -d "$DIR" ]` checks.<br>**AR:** تفعيل `set -euo pipefail` والتحقق المسبق من وجود المجلد. |
| **EN:** Unquoted paths breaking when filenames contain spaces<br>**AR:** تعطل السكربت عند وجود مسافات في أسماء الملفات | **EN:** Wrapped all path variables in double quotes (`"$ target_path"`).<br>**AR:** إحاطة جميع متغيرات المسارات بعلامات تنصيص مزدوجة. |
| **EN:** Debugging silent logic errors inside loops<br>**AR:** صعوبة تتبع الأخطاء المنطقية داخل الحلقات التكرارية | **EN:** Used trace mode (`bash -x script.sh`) to inspect variable expansion step-by-step.<br>**AR:** تشغيل وضع التتبع `bash -x` لمراقبة قيم المتغيرات خطوة بخطوة. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** Bash scripting is the backbone of `AWS EC2 User Data` bootstrapping, CI/CD deployment hooks, and automated disaster recovery scripts.
- **AR:** تُعد لغة `Bash` العمود الفقري لتهيئة خوادم `AWS EC2` تلقائياً عند الإقلاع، وتشغيل مراحل النشر المستمر (`CI/CD`)، وأتمتة النسخ الاحتياطي.

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
