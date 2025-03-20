#!/bin/bash

LOG_FILE="./logs/core.log"
TIMESTAMP=$(date "+[%Y-%m-%d %H:%M:%S]")

# Ambil penggunaan CPU dalam persen
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_MODEL=$(lscpu | grep "Model name" | sed -E 's/Model name:\s+//')

# Simpan log dengan format yang sesuai
echo "$TIMESTAMP -- Core Usage [$(printf "%.5f" "$CPU_USAGE")%] -- Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
