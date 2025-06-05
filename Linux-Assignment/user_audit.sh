echo "user UID>1000"
getent passwd | awk -F: '$3 >= 1000 {print $1}'

echo "Sudo access"
getent group sudo
