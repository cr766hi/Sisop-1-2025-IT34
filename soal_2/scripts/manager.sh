#!/bin/bash

CRON_FILE="$HOME/cron_jobs"
CPU_SCRIPT="$(pwd)/scripts/core_monitor.sh"
RAM_SCRIPT="$(pwd)/scripts/frag_monitor.sh"

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

    if crontab -l | grep -q "$script_path"; then
        draw_box "⚠️ Error: Job sudah ada di crontab!"
        return 1
    fi

    update_cron
    echo "* * * * * bash $script_path" >> "$CRON_FILE"
    crontab "$CRON_FILE"
    draw_box "✅ Job added successfully!"
}

remove_cron_job() {
    local script_path="$1"

    if ! crontab -l | grep -q "$script_path"; then
        draw_box "⚠️ Error: Job tidak ditemukan di crontab!"
        return 1
    fi

    update_cron
    grep -v "$script_path" "$CRON_FILE" > "$CRON_FILE.tmp" && mv "$CRON_FILE.tmp" "$CRON_FILE"
    crontab "$CRON_FILE"
    draw_box "🗑 Job removed successfully!"
}

view_jobs() {
    draw_box "=== Active Cron Jobs ==="
    crontab -l || draw_box "⚠️ No scheduled monitoring jobs"
}

while true; do
    clear
    echo "╔═════════════════════════════════════════════════════╗"
    echo "║                  🌌 ARCAEA MONITOR 🌌                ║"
    echo "╠════╦════════════════════════════════════════════════╣"
    echo "║ ID ║ OPTION                                         ║"
    echo "╠════╬════════════════════════════════════════════════╣"
    echo "║  1 ║ ➕ Add CPU [Core] Monitoring (every minute)     ║"
    echo "║  2 ║ ❌ Remove CPU [Core] Monitoring                ║"
    echo "║  3 ║ ➕ Add RAM [Fragment] Monitoring (every minute)║"
    echo "║  4 ║ ❌ Remove RAM [Fragment] Monitoring            ║"
    echo "║  5 ║ 📜 View Active Jobs                            ║"
    echo "║  6 ║ 🚪 Exit                                       ║"
    echo "╚════╩════════════════════════════════════════════════╝"
    read -p "Enter option [1-6]: " choice

    case $choice in
        1) add_cron_job "$CPU_SCRIPT" ;;
        2) remove_cron_job "$CPU_SCRIPT" ;;
        3) add_cron_job "$RAM_SCRIPT" ;;
        4) remove_cron_job "$RAM_SCRIPT" ;;
        5) view_jobs ;;
        6) draw_box "🚀 Exiting..."; exit 0 ;;
        *) draw_box "❌ Invalid option. Try again." ;;
    esac

    read -p "Press enter to return to menu..."
done
