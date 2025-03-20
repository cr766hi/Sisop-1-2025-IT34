#!/bin/bash

echo "=== Arcaea Core Monitoring ==="

# Cek CPU Usage (gunakan top atau mpstat)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Cek CPU Model
CPU_MODEL=$(grep -m 1 "model name" /proc/cpuinfo | cut -d ':' -f2 | sed 's/^ //')

# Tampilkan informasi ke "Player"
echo "🖥️  CPU Model  : $CPU_MODEL"
echo "⚙️  CPU Usage  : $CPU_USAGE%"

exit 0

