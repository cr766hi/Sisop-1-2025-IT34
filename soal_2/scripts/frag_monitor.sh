#!/bin/bash

LOG_FILE="./logs/fragment.log"
TIMESTAMP=$(date "+[%Y-%m-%d %H:%M:%S]")

# Ambil total dan penggunaan RAM dalam MB
TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
USED_RAM=$(free -m | awk '/Mem:/ {print $3}')
AVAILABLE_RAM=$(free -m | awk '/Mem:/ {print $7}')
RAM_USAGE=$(awk "BEGIN {print ($USED_RAM/$TOTAL_RAM)*100}")

# Simpan log dengan format yang sesuai
echo "$TIMESTAMP -- Fragment Usage [$(printf "%.2f" "$RAM_USAGE")%] -- Fragment Count [${USED_RAM}.00 MB] -- Details [Total: ${TOTAL_RAM} MB, Available: ${AVAILABLE_RAM} MB]" >> "$LOG_FILE"
