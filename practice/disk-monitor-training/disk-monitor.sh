#!/bin/bash
usage=$(df -h / | tail -n 1 | awk '{ print $5 }' | tr -d '%')
if [ $usage -gt 80 ] ;then
echo "$(date) $usage warning" >> /var/log/disk-monitor/disk-monitor.log
fi

