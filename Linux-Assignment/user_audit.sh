echo "user UID>1000"
getent passwd | awk -F: '$3 >= 1000 {print $1}'

echo "Sudo access"
getent group sudo

echo "24 hrs"
last -s "$(date -d '24 hours ago' '+%Y-%m-%d %H:%M:%S')"
