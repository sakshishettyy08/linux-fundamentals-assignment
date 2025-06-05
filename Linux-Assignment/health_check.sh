#!/bin/bash

echo "Load Average"
uptime

echo "Memory Availability"
free -h

echo "SSH is running"
systemctl status ssh
