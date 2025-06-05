
#!/bin/bash

echo "Archive logs"
find /opt/logmanager -type f -mtime +7 -exec tar -czvf /opt/archive_logs/log_archive.tar {} \;

echo "Delete"
find /opt/logmanager -type f -mtime +30 -exec rm -f {} \;



LOG_FILE="/var/tmp/log_alerts.log"
THRESHOLD=80

# Get disk usage and loop through each line
df -hP | awk 'NR>1' | while read -r line; do
    USAGE=$(echo $line | awk '{print $5}' | tr -d '%')
    PARTITION=$(echo $line | awk '{print $6}')
    
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo "$(date): WARNING - Partition $PARTITION is ${USAGE}% full" >> "$LOG_FILE"
    fi
done

