# 🛡️ Project 2: Control Your System & Privilege Governance (dmin-toolkit) | التحكم في النظام وإدارة الصلاحيات

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This project focuses on Linux system administration, user and group identity management, multi-tenant file permissions (chmod, chown, chgrp, sudo), and automated telemetry scripts (sysinfo.sh & census.sh).
- **AR:** يركز هذا المشروع على إدارة نظام لينكس، والتحكم في هويات المستخدمين والمجموعات، وإدارة الصلاحيات الأمنية للملفات (chmod, chown, chgrp, sudo)، وبناء سكربتات الفحص المؤتمتة (sysinfo.sh و census.sh).

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Inspect user identities, groups, and system hardware resources.
  - Enforce the Principle of Least Privilege using chmod 750/700, chown, and chgrp.
  - Build automated bash scripts (sysinfo.sh & census.sh) using command substitution $().
  - Troubleshoot cross-user path resolution and WSL storage locks.
- **AR:**
  - فحص هويات المستخدمين والمجموعات وموارد النظام الأساسية.
  - تطبيق مبدأ الحد الأدنى من الصلاحيات (Least Privilege) باستخدام chmod 750/700, chown, و chgrp.
  - بناء سكربتات أتمتة بلغة Bash (sysinfo.sh و census.sh) باستخدام استبدال الأوامر $().
  - تشخيص وحل مشكلات المسارات بين المستخدمين المختلفين وأقفال نظام الملفات.

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: Ubuntu Linux (WSL) | Scripting: Bash | Security: Linux DAC (chmod / chown / chgrp / sudo)
- **AR:** نظام التشغيل: Ubuntu Linux (WSL) | لغة السكربتات: Bash | الأمان: صلاحيات لينكس (chmod / chown / chgrp / sudo)

---

## ⚙️ Commands Used / الأوامر المستخدمة
whoami, id, uname -a, df -h, du -sh, ree -h, 	op, ps aux, chmod 700, chmod 750, chown, chgrp, sudo, su - teammate, ind, wc -l

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** Enforcing 700 and 750 permission masks protects sensitive scripts from unauthorized users. / **AR:** تطبيق صلاحيات 700 و 750 يحمي السكربتات الحساسة من الوصول غير المصرح به.
2. **EN:** Using chgrp enables secure collaboration across shared engineering groups (	oolkit-team). / **AR:** استخدام chgrp يتيح التعاون الآمن بين أعضاء الفريق الهندسي الواحد (	oolkit-team).
3. **EN:** Command substitution $(...) embeds live telemetry directly inside automated reports. / **AR:** استبدال الأوامر $(...) يدمج بيانات النظام الحية مباشرة داخل التقارير المؤتمتة.
4. **EN:** Always use absolute paths (/home/hisoka/...) instead of ~ when sharing files across different user accounts. / **AR:** استخدام المسارات المطلقة (/home/hisoka/...) بدلاً من الرمز ~ عند مشاركة الملفات بين حسابات مستخدمين مختلفة.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** Relative path ~/report.txt failed after su - teammate<br>**AR:** فشل المسار النسبي ~/report.txt عند التبديل لحساب زميل العمل | **EN:** Use explicit absolute path (/home/hisoka/devops-journey/...) and grant parent traversal (o+x).<br>**AR:** استخدام المسار المطلق الكامل مع منح صلاحية العبور (o+x) للمجلدات الأبوية. |
| **EN:** WSL Input/Output error dropping filesystem to Read-Only<br>**AR:** خطأ إدخال/إخراج في WSL أدى لتحول النظام للقراءة فقط | **EN:** Restart WSL hypervisor service via elevated PowerShell (
et stop LxssManager ; net start LxssManager).<br>**AR:** إعادة تشغيل خدمة LxssManager من نافذة PowerShell كمسؤول لفك قفل الملفات. |
| **EN:** Unauthorized access to administrative scripts<br>**AR:** وصول غير مصرح به لسكربتات الإدارة | **EN:** Restrict script permissions to owner-only (chmod 700 sysinfo.sh census.sh).<br>**AR:** تقييد صلاحيات السكربتات للمالك فقط عبر الأمر chmod 700. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** Multi-tenant security and the Principle of Least Privilege on Linux servers mirror AWS IAM security governance in production cloud environments.
- **AR:** عزل الصلاحيات وتطبيق مبدأ الحد الأدنى من الصلاحيات على خوادم لينكس يمثل الأساس العملي لحوكمة الأمان في AWS IAM داخل بيئات العمل السحابية.

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **NextWork Reference:** [NextWork Level 2: Control Your System](https://nextwork.ai/refreshed_olive_vibrant_plum/docs/d005387c-1f07-4574-af7a-975b712870d0)
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
