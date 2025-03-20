#!/bin/bash

CRON_FILE="$HOME/cron_jobs"  # Tempat menyimpan sementara crontab
CPU_SCRIPT="$HOME/scripts/core_monitor.sh"
RAM_SCRIPT="$HOME/scripts/frag_monitor.sh"

update_cron() {
    crontab -l > "$CRON_FILE" 2>/dev/null
}

add_cron_job() {
    local script_path="$1"
    local schedule="$2"
    update_cron
    echo "$schedule bash $script_path" >> "$CRON_FILE"
    crontab "$CRON_FILE"
    echo "✅ Job added successfully!"
}

remove_cron_job() {
    local script_path="$1"
    update_cron
    grep -v "$script_path" "$CRON_FILE" > "$CRON_FILE.tmp" && mv "$CRON_FILE.tmp" "$CRON_FILE"
    crontab "$CRON_FILE"
    echo "🗑️ Job removed successfully!"
}

view_jobs() {
    echo "=== Active Cron Jobs ==="
    crontab -l
}

while true; do
    echo "=== Arcaea Crontab Manager ==="
    echo "1. Add CPU [Core] Monitoring (every 5 mins)"
    echo "2. Remove CPU [Core] Monitoring"
    echo "3. Add RAM [Fragments] Monitoring (every 5 mins)"
    echo "4. Remove RAM [Fragments] Monitoring"
    echo "5. View Active Jobs"
    echo "6. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) add_cron_job "$CPU_SCRIPT" "*/5 * * * *" ;;
        2) remove_cron_job "$CPU_SCRIPT" ;;
        3) add_cron_job "$RAM_SCRIPT" "*/5 * * * *" ;;
        4) remove_cron_job "$RAM_SCRIPT" ;;
        5) view_jobs ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "❌ Invalid option. Try again." ;;
    esac
done
