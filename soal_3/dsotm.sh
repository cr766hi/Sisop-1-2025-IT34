$ sudo apt update && sudo apt install -y curl jq

$ nano dsotm.sh

$ chmod +x dsotm.sh

if [[ "$1" == --play=* ]]; then
    TRACK="${1#--play=}"
else
    echo ""
    exit 1
fi
affirmation_text() {
clear
    while true; do
        curl -s https://www.affirmations.dev/ | jq -r '.affirmation'
        sleep 1
    done
}
progress_bar() {
    local width=$(tput cols)
    local progress=0
    local total=100
    while [ $progress -le $total ]; do
    local filled=$(( progress * width / total ))
clear
 printf "\r[%-${width}s] %d%%" "$(printf '#%.0s' $(seq 1 $filled))" "$progress"
        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
        progress=$((progress + RANDOM % 5 + 1))
    done
}
jam() {
    while true; do
        clear
        date '+%Y-%m-%d %H:%M:%S'
        sleep 1
    done
}
case "$TRACK" in
    "Speak To Me")
        affirmation_text
        ;;
    "On the Run")
        progress_bar
        ;;
    "Time")
        jam
        ;;
    *)
        echo "Judul tidak ditemukan: $TRACK"
        exit 1
        ;;
esac
