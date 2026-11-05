# ⚙️ Project 3: Software & Processes Governance (dmin-toolkit) | إدارة الحزم البرمجية والتحكم في العمليات

> Prepared & Documented by: **إبراهيم أحمد السيد (Ibrahim Ahmed Elsayed)** — Cloud & DevOps Engineering Journey.

---

## 🌟 Overview / نظرة عامة
- **EN:** This project implements an automated Linux system administration toolkit (sysinfo.sh) focusing on package lifecycle management (pt) and real-time process governance (ps, htop, background jobs, and Unix signals).
- **AR:** يطبّق هذا المشروع حزمة أدوات مؤتمتة لإدارة أنظمة لينكس (sysinfo.sh) تركز على إدارة دورة حياة الحزم البرمجية (pt) والحوكمة الفورية للعمليات الجارية (ps, htop, العمليات الخلفية، وإشارات النظام).

---

## 🎯 Objectives / الأهداف
- **EN:**
  - Master software package installation, auditing, and purging using pt.
  - Monitor CPU-intensive processes and manage background/foreground jobs (&, jobs, g).
  - Handle unresponsive processes safely using Unix signals (SIGTERM vs SIGKILL).
  - Automate system health telemetry into persistent reports (sysinfo.sh -> 
eport.txt).
- **AR:**
  - إتقان تثبيت الحزم البرمجية وفحصها وإزالتها بالكامل باستخدام أداة pt.
  - مراقبة العمليات الأكثر استهلاكاً للمعالج وإدارة المهام في الخلفية والواجهة (&, jobs, g).
  - التعامل الآمن مع العمليات المتوقفة عبر إشارات النظام (SIGTERM مقابل SIGKILL).
  - أتمتة تقارير حالة النظام وحفظها في ملفات دائمة (sysinfo.sh -> 
eport.txt).

---

## 🛠️ Technologies Used / التقنيات المستخدمة
- **EN:** OS: Ubuntu Linux (WSL) | Scripting: Bash (sysinfo.sh) | Package Manager: APT | Process Tools: ps, htop, kill
- **AR:** نظام التشغيل: Ubuntu Linux (WSL) | لغة السكربتات: Bash (sysinfo.sh) | مدير الحزم: APT | أدوات العمليات: ps, htop, kill

---

## ⚙️ Commands Used / الأوامر المستخدمة
sudo apt update, pt search, pt show, sudo apt install, sudo apt remove, sudo apt purge, sudo apt autoremove, ps aux --sort=-%cpu, htop, jobs, g, kill -15 (SIGTERM), kill -9 (SIGKILL), chmod +x, ./sysinfo.sh > report.txt

---

## 💡 Key Learnings / الدروس المستفادة الرئيسية
1. **EN:** Clean package removal using pt purge and utoremove prevents configuration bloat. / **AR:** الإزالة النظيفة للحزم باستخدام pt purge و utoremove تمنع تراكم ملفات الإعدادات اليتيمة.
2. **EN:** Suppressing noisy stderr warnings via 2>/dev/null keeps automated telemetry pipelines clean. / **AR:** كتم رسائل التحذير الجانبية عبر 2>/dev/null يحافظ على نظافة مخرجات السكربتات المؤتمتة.
3. **EN:** Always attempt graceful termination (SIGTERM - 15) before forcing kernel kill (SIGKILL - 9). / **AR:** البدء دائماً بالإغلاق الآمن (SIGTERM - 15) لحفظ البيانات قبل اللجوء للإغلاق الإجباري (SIGKILL - 9).
4. **EN:** Sorting process tables (ps aux --sort=-%cpu | head -11) isolates performance bottlenecks instantly. / **AR:** ترتيب جدول العمليات حسب استهلاك المعالج يعزل الاختناقات البرمجية فوراً.

---

## ⚠️ Challenges & Solutions / التحديات والحلول

| Challenge (المشكلة) | Solution (الحل المقترح) |
|---|---|
| **EN:** pt list warning polluting script output<br>**AR:** رسائل تحذير pt list تشوّه مخرجات التقرير | **EN:** Redirect stderr to null (pt list --installed 2>/dev/null \| wc -l).<br>**AR:** توجيه مخرجات الأخطاء إلى 2>/dev/null للحصول على العدد الصافي فقط. |
| **EN:** Terminal blocked by long-running process<br>**AR:** توقف الطرفية بسبب عملية طويلة المدى | **EN:** Run asynchronously in background using & and manage with jobs / g.<br>**AR:** تشغيل العملية في الخلفية بإضافة & وإدارتها عبر أوامر jobs و g. |
| **EN:** Unresponsive process ignoring normal close<br>**AR:** عملية متجمدة لا تستجيب للإغلاق العادي | **EN:** Escalate from kill -15 <PID> (SIGTERM) to kill -9 <PID> (SIGKILL).<br>**AR:** التدرج من الإغلاق الآمن kill -15 إلى الإيقاف الفوري kill -9 عند الضرورة. |

---

## ☁️ Why It Matters for Cloud Engineers / لماذا يهم هذا مهندسي السحابة؟
- **EN:** In production AWS EC2 servers, diagnosing high CPU spikes, automating health reports, and patching packages cleanly without leaving orphaned dependencies are core daily responsibilities of a Cloud/DevOps Engineer.
- **AR:** في خوادم الإنتاج السحابية (AWS EC2)، يُعد تشخيص الارتفاع المفاجئ في استهلاك المعالج، وأتمتة تقارير الفحص، وتحديث الحزم بأمان دون ترك ملفات مهملة من أهم المهام اليومية لمهندس السحابة.

---

## 🔗 Project & Resource Links / روابط المشروع والمرجع
- **NextWork Reference:** [NextWork Level 3: Software & Processes](https://nextwork.ai/refreshed_olive_vibrant_plum/docs/fdb1eb2a-54bf-49d7-baf8-a214e82405e2)
- **GitHub Repository:** [Hisoka Cloud & DevOps Portfolio](https://github.com/ibrahim-a-elsayed-eng)

---
*Documented and verified with precision by Ibrahim Ahmed Elsayed.*
