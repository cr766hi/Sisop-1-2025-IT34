#!/bin/bash

CRON_FILE="$HOME/cron_jobs"
CPU_SCRIPT="$HOME/scripts/core_monitor.sh"
RAM_SCRIPT="$HOME/scripts/frag_monitor.sh"

draw_box() {
    local text="$1"
    local width=$(( ${#text} + 4 ))
    printf "\n\033[1;36m%s\n" "╔$(printf '═%.0s' $(seq 1 $width))╗"
    printf "║ %s ║\n" "$text"
    printf "╚$(printf '═%.0s' $(seq 1 $width))╝\033[0m\n\n"
}

update_cron() {
    crontab -l > "$CRON_FILE" 2>/dev/null
}

add_cron_job() {
    local script_path="$1"
    local schedule="$2"
    update_cron
    echo "$schedule bash $script_path" >> "$CRON_FILE"
    crontab "$CRON_FILE"
    draw_box "✅ Job added successfully!"
}

remove_cron_job() {
    local script_path="$1"
    update_cron
    grep -v "$script_path" "$CRON_FILE" > "$CRON_FILE.tmp" && mv "$CRON_FILE.tmp" "$CRON_FILE"
    crontab "$CRON_FILE"
    draw_box "🗑️ Job removed successfully!"
}

view_jobs() {
    draw_box "=== Active Cron Jobs ==="
    crontab -l
}

while true; do
    draw_box "=== Arcaea Crontab Manager ==="
    echo -e "\033[1;35m1. Add CPU [Core] Monitoring (every 5 mins)\033[0m"
    echo -e "\033[1;35m2. Remove CPU [Core] Monitoring\033[0m"
    echo -e "\033[1;35m3. Add RAM [Fragments] Monitoring (every 5 mins)\033[0m"
    echo -e "\033[1;35m4. Remove RAM [Fragments] Monitoring\033[0m"
    echo -e "\033[1;35m5. View Active Jobs\033[0m"
    echo -e "\033[1;31m6. Exit\033[0m"
    
    read -p "Choose an option: " choice
    
    case $choice in
        1) add_cron_job "$CPU_SCRIPT" "*/5 * * * *" ;;
        2) remove_cron_job "$CPU_SCRIPT" ;;
        3) add_cron_job "$RAM_SCRIPT" "*/5 * * * *" ;;
        4) remove_cron_job "$RAM_SCRIPT" ;;
        5) view_jobs ;;
        6) draw_box "Exiting..."; exit 0 ;;
        *) draw_box "❌ Invalid option. Try again." ;;
    esac

done
