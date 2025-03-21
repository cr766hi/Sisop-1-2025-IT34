#!/bin/bash

DATA_FILE="./data/player.csv"
LOG_DIR="./logs"
SCRIPTS_DIR="./scripts"

mkdir -p "$LOG_DIR"
mkdir -p "$(dirname "$DATA_FILE")"

register() {
    bash "$SCRIPTS_DIR/register.sh"
}

login() {
    bash "$SCRIPTS_DIR/login.sh"
    if [ $? -eq 0 ]; then
        crontab_manager
    else
        echo "Login failed. Returning to main menu..."
        sleep 1
    fi
}

crontab_manager() {
    bash "$SCRIPTS_DIR/manager.sh"
}

show_menu() {
    while true; do
        clear
        echo "╔════════════════════════════════════════════════════╗"
        echo "║                  🌌 ARCAEA TERMINAL 🌌            ║"
        echo "╠════╦══════════════════════════════════════════════╣"
        echo "║ ID ║ OPTION                                       ║"
        echo "╠════╬══════════════════════════════════════════════╣"
        echo "║  1 ║ ➕ Register New Account                      ║"
        echo "║  2 ║ 🔑 Login to Existing Account                 ║"
        echo "║  3 ║ ⚙️  Crontab Manager (Core & Fragments)       ║"
        echo "║  4 ║ 🚪 Exit Arcaea Terminal                      ║"
        echo "╚════╩══════════════════════════════════════════════╝"
        read -p "Enter option [1-4]: " choice

        case $choice in
            1) register ;;
            2) login ;;
            3) crontab_manager ;;
            4) echo "Exiting Arcaea Terminal. Goodbye!"; exit 0 ;;
            *) echo "❌ Invalid option! Please choose between 1-4."; sleep 1 ;;
        esac
    done
}

show_menu
