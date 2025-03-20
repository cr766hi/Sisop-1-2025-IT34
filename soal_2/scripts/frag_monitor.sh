#!/bin/bash

echo "=== Arcaea Fragments Monitoring ==="

TOTAL_RAM=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
AVAILABLE_RAM=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')

USED_RAM=$((TOTAL_RAM - AVAILABLE_RAM))

TOTAL_RAM_MB=$((TOTAL_RAM / 1024))
USED_RAM_MB=$((USED_RAM / 1024))

RAM_USAGE_PERCENT=$((USED_RAM * 100 / TOTAL_RAM))

echo " Total RAM    : ${TOTAL_RAM_MB} MB"
echo " RAM Usage    : ${USED_RAM_MB} MB (${RAM_USAGE_PERCENT}%)"

exit 0
