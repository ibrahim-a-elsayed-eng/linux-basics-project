#!/bin/bash
log_file="/home/hisoka/devops-journey/practice/log-monitor-training/app.log"
report_file="/home/hisoka/devops-journey/practice/log-monitor-training/report.log"
warn_count=$(grep -c "WARN" "$log_file")
error_count=$(grep -c "ERROR" "$log_file")
echo "DATE=$(date '+%F %T') WARN=$warn_count ERROR=$error_count" >> "$report_file"
