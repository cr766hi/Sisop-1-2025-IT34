#!/bin/bash

echo "=== Arcaea Core Monitoring ==="

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_MODEL=$(grep -m 1 "model name" /proc/cpuinfo | cut -d ':' -f2 | sed 's/^ //')

echo " CPU Model  : $CPU_MODEL"
echo " CPU Usage  : $CPU_USAGE%"

exit 0

