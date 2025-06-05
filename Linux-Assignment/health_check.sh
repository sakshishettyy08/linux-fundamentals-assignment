#!/bin/bash
echo "Load Average" >> /var/tmp/health_log.log
uptime | awk -F'load average:' '{print $2}' >> /var/tmp/health_log.log

echo "Memory Availability" >> /var/tmp/health_log.log
free -h | awk 'NR>1 {print $1 " " $4}' >> /var/tmp/health_log.log

echo "SSH is running" >> /var/tmp/health_log.log
systemctl status ssh >> /var/tmp/health_log.log
