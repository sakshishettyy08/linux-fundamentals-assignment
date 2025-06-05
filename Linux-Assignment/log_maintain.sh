
#!/bin/bash

echo "Archive logs"
find /opt/logmanager -type f -mtime +7 -exec tar -czvf /opt/archive_logs/log_archive.tar {} \;

echo "Delete"
find /opt/logmanager -type f -mtime +30 -exec rm -f {} \;

echo "Warning for the usage above 80%"

 df -h | awk 'NR>1 {gsub("%","",$5); if ($5 > 80) print $1, $5}' | while read -r partition usage; do
 echo "$(date): WARNING: Partition $partition is at ${usage}% disk usage." >> /var/tmp/disk_usage_warnings.log
 done

