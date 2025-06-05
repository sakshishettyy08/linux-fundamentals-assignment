#!/bin/bash

LOGFILE="/var/tmp/health_log.log"

echo "--- Health Check Report ----" >> "$LOGFILE"

echo "Load Average" >> "$LOGFILE"
uptime | awk -F'load average:' '{print $2}' >> "$LOGFILE"

echo "Memory Availability" >> "$LOGFILE"
free -h | awk 'NR>1 {print $1 " " $4}' >> "$LOGFILE"

echo "SSH is running" >> "$LOGFILE"
systemctl status ssh >> "$LOGFILE"
