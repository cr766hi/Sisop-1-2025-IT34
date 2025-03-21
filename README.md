# Sisop-1-2025-IT34
Member :
Aldo
Danis
Naila

<div align=center>

# Soal Modul 1

</div>

## 1. poppo_siroyo.sh
Di sebuah desa kecil yang dikelilingi bukit hijau, Poppo dan Siroyo, dua sahabat karib, sering duduk di bawah pohon tua sambil membayangkan petualangan besar. Poppo, yang ceria dan penuh semangat, baru menemukan kesenangan dalam dunia buku, sementara Siroyo, dengan otaknya yang tajam, suka menganalisis segala hal. Suatu hari, mereka menemukan tablet ajaib berisi catatan misterius bernama reading_data.csv. Dengan bantuan keajaiban awk, mereka memutuskan untuk menjelajahi rahasia di balik data itu, siap menghadapi tantangan demi tantangan dalam petualangan baru mereka.

```bash
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv
```

Buat sebuah *file* poppo_siroyo.sh

```bash
$ nano poppo_siroyo.sh
```

Simpan dan ubah *permission* *file* *script* agar dapat dieksekusi.

```bash
$ chmod +x poppo_siroyo.sh
```

Eksekusi *file script* dengan cara `./poppo_siroyo.sh`.

### a. Chris Hemsworth membaca 56 buku
Poppo baru saja mulai melihat tablet ajaib dan terpukau dengan kekerenan orang bernama “Chris Hemsworth”. Poppo jadi sangat ingin tahu berapa banyak buku yang dibaca oleh “Chris Hemsworth”. Bantu Poppo menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.

```bash
#!/bin/bash

file="/home/na-ux315/reading_data.csv"

awk 'BEGIN {FS=","; hitung=0}
    /Chris Hemsworth/ {hitung++}
    END {
        if (hitung > 0)
            print "Chris Hemsworth membaca", hitung, "buku";
        else
            print "Chris Hemsworth tidak membaca buku.";
    }' "$file"
```

### b. Rata-rata durasi membaca dengan Tablet adalah 152.38 menit 
Setelah menemukan tablet ajaib, Siroyo mulai penasaran dengan kebiasaan membaca yang tersimpan di dalamnya. Ia mulai menggunakan tablet ajaib dan bergumam sambil meneliti, “Aku ingin tahu berapa lama rata-rata mereka membaca dengan benda ini”. Bantu Siroyo untuk menghitung rata-rata durasi membaca (Reading_Duration_Minutes) untuk buku-buku yang dibaca menggunakan “Tablet”.

```bash
awk 'BEGIN {FS=","; sum=0; hitung=0}
    $8 ~ /Tablet/ {sum += $6; hitung++}
    END {
        if (hitung > 0)
            printf "Rata-rata durasi membaca dengan Tablet: %.2f menit\n", sum/hitung;
        else
            print "Tidak ada durasi membaca dengan Tablet.";
    }' "$file"
```

### c. Pembaca dengan rating tertinggi adalah Deep Space Mysteries berjudul Robert Downey Jr. dengan rating 6.0
Sementara Siroyo sibuk menganalisis tablet ajaib, Poppo duduk disampingnya dengan ide cemerlang. “Kalau kita sudah tahu cara mereka membaca, aku ingin memberi hadiah ke temen yang paling suka sama bukunya!”. Ia pun mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title).

```bash
awk 'BEGIN {FS=","; max=0}
    NR > 1 {if ($7 > max) {max = $7; name = $3; book_title = $2}}
    END {
        if (max > 0)
            print "Pembaca dengan rating tertinggi adalah", name, "berjudul", book_title, "dengan rating", max;
        else
            print "Tidak ada pembaca dengan rating tertinggi.";
    }' "$file"
```

### d. Genre paling populer di Asia setelah 2023 adalah Mystery dengan 14 buku
Siroyo mengusap keningnya dan berkata, "Petualangan kita belum selesai! Aku harus bikin laporan untuk klub buku besok." Ia ingin membuat laporan yang istimewa dengan tablet ajaib itu, fokus pada teman-teman di Asia. "Aku penasaran genre apa yang paling populer di sana setelah tahun 2023," katanya, membuka reading_data.csv sekali lagi. Bantu Siroyo menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya, agar laporannya jadi yang terbaik di klub.

```bash
awk 'BEGIN {FS=","; hitung_max=0}
    $9 ~ /Asia/ && $5 > "2023-12-31" {hitung_genre[$4]++}
    END {
        if (length(hitung_genre) > 0) {
            for (genre in hitung_genre) {
                if (hitung_genre[genre] > hitung_max) {
                    hitung_max = hitung_genre[genre];
                    popular_genre = genre;
                }
            }
            print "Genre paling populer di Asia setelah 2023 adalah", popular_genre, "dengan", hitung_max, "buku.";
        } else {
            print "Tidak ada genre populer di Asia setelah 2023.";
        }
    }' "$file"
```

### Output :
![Screenshot 2025-03-14 155958](https://github.com/user-attachments/assets/c6134ffb-c3b1-4dd8-9f01-936daf261cba)

## 2. Anda merupakan seorang “Observer”
Dari banyak dunia yang dibuat dari ingatan yang berbentuk “fragments” - yang berisi kemungkinan yang dapat terjadi di dunia lain. Namun, akhir-akhir ini terdapat anomali-anomali yang seharusnya tidak terjadi, perpindahan “fragments” di berbagai dunia, yang kemungkinan terjadi dikarenakan seorang “Seeker” yang berubah menjadi “Ascendant”, atau dalam kata lain, “God”. Tidak semua “Observer” menjadi “Player”, tetapi disini anda ditugaskan untuk ikut serta dalam menjaga equilibrium dari dunia-dunia yang terbuat dari “Arcaea”.

### a. “First Step in a New World”
Tugas pertama, dikarenakan kejadian “Axiom of The End” yang semakin mendekat, diperlukan sistem untuk mencatat “Player” aktif agar terpisah dari “Observer”. Buatlah dua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password.
pertama buatlah sebuah file `/data/player.csv` dan juga file `register.sh` dan `login.sh` untuk menyimpan script.

```bash
mkdir soal_2 && cd soal_2 && touch register.sh && touch login.sh && mkdir data && mkdir player.csv 
```

### b. “Radiant Genesis”
Sistem login/register untuk para "Player" tentunya memiliki constraint, yaitu validasi email dan password. 
Email harus memiliki format yang benar dengan tanda @ dan titik, sementara password harus memiliki minimal 8 karakter, setidaknya satu huruf kecil, satu huruf besar, dan satu angka untuk menjaga keamanan data di dunia “Arcaea”.

lalu edit `register.sh`

```bash
nano register.sh 
```

dan masukkan script ini

```bash
#!/bin/bash

DATA_FILE="/data/player.csv"
SALT="arcaea123"  # Static salt untuk hashing

sudo mkdir -p /data

if [ ! -f "$DATA_FILE" ]; then
    echo "email,username,hashed_password" | sudo tee "$DATA_FILE" > /dev/null
    sudo chmod 666 "$DATA_FILE"  # Beri izin baca/tulis ke semua user
fi

echo "Enter your email :"
read email

until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
    echo "Email is not valid"
    read -p "Enter your email again: " email
    echo ""
done

if grep -q "^$email," "$DATA_FILE"; then
    echo "Error: Email already registered!"
    exit 1
fi
echo "Enter your username :"
read username

echo "Enter your password :"
read -s password

# Validasi password
until [[ ${#password} -ge 8 && "$password" =~ [0-9] && "$password" =~ [a-zA-Z] ]]; do
    echo "Password must be at least 8 characters, contain at least 1 number, and 1 letter"
    read -s -p "Enter your password again: " password
    echo ""
done

hashed_password=$(echo -n "$SALT$password" | sha256sum | awk '{print $1}')

echo "$email,$username,$hashed_password" | sudo tee -a "$DATA_FILE" > /dev/null

echo "Registration successful!"
```

maka jika dijalankan akan menjalankan program untuk melakukan register dan file akan disimpan di /data/player.csv :
![image](https://github.com/user-attachments/assets/6e0d99d7-9c4f-4e8c-a603-2c141a005ce8)

dan jika kita cek file /data/player.csv maka :
![image](https://github.com/user-attachments/assets/92088329-645e-4101-8234-f010ba6439e2)

File telah dimasukkan :
![image](https://github.com/user-attachments/assets/5b313f83-5cbe-4a3f-b7d5-2420a3bb7d31)

dan ketika memasukkan email tidak valid dan password yang tidak sesuai regulasi maka :
![image](https://github.com/user-attachments/assets/8b1f58ae-9bc2-4ff3-8f50-b30f987c6438)
![image](https://github.com/user-attachments/assets/48577bda-5617-410f-a72e-f16417f31911)

### c. “Unceasing Spirit”
Karena diperlukan pengecekan keaslian “Player” yang aktif, maka diperlukan sistem untuk pencegahan duplikasi “Player”. Jadikan sistem login/register tidak bisa memakai email yang sama (email = unique), tetapi tidak ada pengecekan tambahan untuk username. 

Masukkan kode ini dalam register.sh :
ini untuk mengecek apkaah email sudah ada atau belum

```bash
if grep -q "^$email," "$DATA_FILE"; then
    echo "Error: Email already registered!"
    exit 1
fi
```

Ketika mencoba memasukkan email yang sudah terdaftar maka :
![image](https://github.com/user-attachments/assets/fcf9a572-98cd-44fa-a51a-9c63c6f20255)

### d. “The Eternal Realm of Light”
Password adalah kunci akses ke dunia Arcaea. Untuk menjaga keamanan "Player", password perlu disimpan dalam bentuk yang tidak mudah diakses. Gunakan algoritma hashing sha256sum yang memakai static salt (bebas).

untuk melakukan hash password dapat membuat kode ini pada login.sh dan register.sh agar keduanya dapat mengenali password yang sudah dihashing :

```bash
hashed_password=$(echo -n "$SALT$password" | sha256sum | awk '{print $1}')
```

dan jika dilihat passwordnya akan menjadi seperti ini :
![image](https://github.com/user-attachments/assets/db4d6079-2830-4d1f-ace0-6212410a336f)

### e. “The Brutality of Glass”
Setelah sukses login, "Player" perlu memiliki akses ke sistem pemantauan sumber daya. Sistem harus dapat melacak penggunaan CPU (dalam persentase) yang menjadi representasi “Core” di dunia “Arcaea”. Pastikan kalian juga bisa melacak “terminal” yang digunakan oleh “Player”, yaitu CPU Model dari device mereka. 
Lokasi shell script: `./scripts/core_monitor.sh`

untuk itu pertama membuat directory dalam soal_2 dengan :

```bash
mkdir scripts
```

lalu buat shell bernama `core_monitor.sh` dengan

```bash
nano core_monitor.sh
```

edit core_monitor.sh dan masukkan :

```bash
#!/bin/sh

DIR=$(realpath $(dirname $0))
BASE_DIR=$(realpath "$DIR/../logs")

if [ ! -d "$BASE_DIR" ]; then
    mkdir -p "$BASE_DIR"
fi

CPU_Usage=$(top -bn2 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}' | awk 'NR==2 {print $0}' )
CPU_Model=$(lscpu | grep 'Model name' | awk -F': ' '{print $2}' | xargs)

echo "[$(date +'%Y-%m-%d %H:%M:%S')] - Core Usage [$CPU_Usage] - Terminal Model [$CPU_Model]" >> "$BASE_DIR/core.log"
```

### f. “In Grief and Great Delight”
Selain CPU, “fragments” juga perlu dipantau untuk memastikan equilibrium dunia “Arcaea”. RAM menjadi representasi dari “fragments” di dunia “Arcaea”, yang dimana dipantau dalam persentase usage, dan juga penggunaan RAM sekarang. 
Lokasi shell script: `./scripts/frag_monitor.sh`
Pastikan perhitungan kalian untuk CPU dan RAM memiliki output yang sama dengan suatu package resource checker, ex: top, htop, btop, bpytop.

untuk itu buat shell `frag_monitor.sh`

```bash
nano frag_monitor.sh
```

lalu edit shell :

```bash
#!/bin/bash

LOG_FILE="./logs/fragment.log"
TIMESTAMP=$(date "+[%Y-%m-%d %H:%M:%S]")

TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
USED_RAM=$(free -m | awk '/Mem:/ {print $3}')
AVAILABLE_RAM=$(free -m | awk '/Mem:/ {print $7}')
RAM_USAGE=$(awk "BEGIN {print ($USED_RAM/$TOTAL_RAM)*100}")

echo "$TIMESTAMP -- Fragment Usage [$(printf "%.2f" "$RAM_USAGE")%] -- Fragment Count [${USED_RAM}.00 MB] -- Details [Total: ${TOTAL_RAM} MB, Available: ${AVAILABLE_RAM} MB]" >> "$LOG_FILE"
```

Code ini dijalankan untuk mengetahui berapa total ram, ram yang tesedia, dan ram yang sedang dipakai

### g. “On Fate's Approach”
Pemantauan yang teratur dan terjadwal sangat penting untuk mendeteksi anomali. Crontab manager (suatu menu) memungkinkan "Player" untuk mengatur jadwal pemantauan sistem. 
Hal yang harus ada di fungsionalitas menu:
Add/Remove CPU [Core] Usage
Add/Remove RAM [Fragment] Usage
View Active Jobs
Lokasi shell script: `./scripts/manager.sh`

untuk itu pertama membuat shell `manager.sh`
dan edit dengan kode dibawah ini :

```bash
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
    echo "║                  🌌 ARCAEA MONITOR 🌌              ║"
    echo "╠════╦════════════════════════════════════════════════╣"
    echo "║ ID ║ OPTION                                         ║"
    echo "╠════╬════════════════════════════════════════════════╣"
    echo "║  1 ║ ➕ Add CPU [Core] Monitoring (every minute)    ║"
    echo "║  2 ║ ❌ Remove CPU [Core] Monitoring                ║"
    echo "║  3 ║ ➕ Add RAM [Fragment] Monitoring (every minute)║"
    echo "║  4 ║ ❌ Remove RAM [Fragment] Monitoring            ║"
    echo "║  5 ║ 📜 View Active Jobs                            ║"
    echo "║  6 ║ 🚪 Exit                                        ║"
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
```
Dengan lokasi shell script: `./scripts/manager.sh`

### Output

![image](https://github.com/user-attachments/assets/d0fa81b8-a054-4ee6-bc05-248c475cf654)

yang dapat dipilih untuk dijalankan

### h. “The Disfigured Flow of Time”
Karena tentunya script yang dimasukkan ke crontab tidak mengeluarkan output di terminal, buatlah 2 log file, core.log dan fragment.log di folder ./log/, yang dimana masing-masing terhubung ke program usage monitoring untuk usage tersebut.

CPU
[YYYY-MM-DD HH:MM:SS] - Core Usage [$CPU%] - Terminal Model [$CPU_Model]

RAM
[YYYY-MM-DD HH:MM:SS] - Fragment Usage [$RAM%] - Fragment Count [$RAM MB] - Details [Total: $TOTAL MB, Available: $AVAILABLE MB]

Berikut adalah kode untuk core monitor :

```bash
#!/bin/bash

LOG_FILE="./logs/core.log"
TIMESTAMP=$(date "+[%Y-%m-%d %H:%M:%S]")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_MODEL=$(lscpu | grep "Model name" | sed -E 's/Model name:\s+//')

echo "$TIMESTAMP -- Core Usage [$(printf "%.5f" "$CPU_USAGE")%] -- Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
```

Berikut adalah kode untuk fragment monitor :

```bash
#!/bin/bash

LOG_FILE="./logs/fragment.log"
TIMESTAMP=$(date "+[%Y-%m-%d %H:%M:%S]")

TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
USED_RAM=$(free -m | awk '/Mem:/ {print $3}')
AVAILABLE_RAM=$(free -m | awk '/Mem:/ {print $7}')
RAM_USAGE=$(awk "BEGIN {print ($USED_RAM/$TOTAL_RAM)*100}")

echo "$TIMESTAMP -- Fragment Usage [$(printf "%.2f" "$RAM_USAGE")%] -- Fragment Count [${USED_RAM}.00 MB] -- Details [Total: ${TOTAL_RAM} MB, Available: ${AVAILABLE_RAM} MB]" >> "$LOG_FILE"
```

### Output


### i. “Irruption of New Color”
Sistem harus memiliki antarmuka utama yang menggabungkan semua komponen. Ini akan menjadi titik masuk bagi "Player" untuk mengakses seluruh sistem. 
Dalam shell script tersebut berisi user flow berikut:
- Register
- Login
    - Crontab manager (add/rem core & fragment usage)
    - Exit
- Exit

Di terminal.sh, untuk player melakukan registrasi dan login.

```bash
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
```

### Output


## 3. dsotm.sh
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat.

```bash
$ sudo apt update && sudo apt install -y curl jq
```

Buat sebuah *file* dsotm.sh

```bash
$ nano dsotm.sh
```

Simpan dan ubah *permission* *file* *script* agar dapat dieksekusi.

```bash
$ chmod +x dsotm.sh
```

Eksekusi *file script* dengan cara `./dsotm.sh --play=”<Track>”` dengan Track sebagai nama nama lagu yang kamu pilih.


Buat sebuah fungsi untuk input argumen pertama

```bash
if [[ "$1" == --play=* ]]; then
    TRACK="${1#--play=}"
else
    echo ""
    exit 1
fi
```

Gunakan switch case untuk conditional statement

```bash
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
```

### a. Speak to Me
Untuk lagu ini, kamu memutuskan untuk membuat sebuah fitur yang memanggil API yang baru saja kamu temukan kemarin, https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.

```bash
affirmation_text() {
clear
    while true; do
        curl -s https://www.affirmations.dev/ | jq -r '.affirmation'
        sleep 1
    done
}
```
### Output:
![Image](https://github.com/user-attachments/assets/ba860544-23b1-4e37-896d-d03f4849324c)

### b. On the Run
Selanjutnya, kamu memutuskan untuk membuat sebuah progress bar yang berjalan dengan interval random (setiap progress bertambah dalam interval waktu yang random dengan range 0.1 detik sampai 1 detik).

```bash
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
```
### Output:
![Image](https://github.com/user-attachments/assets/f1b581a3-caaa-4b86-bf2d-75aa5c682ccb)

### c. Time
Singkat saja, untuk time, kamu memutuskan untuk membuat live clock yang menunjukkan tanggal, jam, menit dan detik. Untuk fungsionalitas, jam harus setidaknya menunjukkan tahun, bulan, tanggal, jam, menit, dan detik yang diperbaharui setiap detik.

```bash
jam() {
    while true; do
        clear
        date '+%Y-%m-%d %H:%M:%S'
        sleep 1
    done
}
```
### Output:
![Image](https://github.com/user-attachments/assets/2668cd08-7682-416a-8902-33fd07893872)
![Image](https://github.com/user-attachments/assets/d767596d-b520-43eb-84f1-d00b8a240d65)

Untuk bagian D dan E masih belum selesai dikarenakan ketidakpahaman

## 4. pokemon_analysis.sh
Pada suatu hari, anda diminta teman anda untuk membantunya mempersiapkan diri untuk turnamen Pokemon “Generation 9 OverUsed 6v6 Singles” dengan cara membuatkan tim yang cocok untuknya. Tetapi, anda tidak memahami meta yang dimainkan di turnamen tersebut. Untungnya, seorang informan memberikan anda data pokemon_usage.csv yang bisa anda download dan analisis. 
[Author: Amoes / winter]
Data tersebut memiliki banyak kolom:
a. Nama Pokemon
b. Usage% yang merupakan persentase Pokemon yang disesuaikan dengan Rank pengguna dan Winrate
c. Raw Usage yang merupakan jumlah mentah Pokemon dalam semua tim yang tercatat
d. Type1 dan Type2 Pokemon
e. Statistic Pokemon: HP,Atk,Def,SpAtk,SpDef,Speed

```bash
wget "https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download" -O pokemon_usage.csv
```

Buat sebuah *file* player_analysis.sh

```bash
$ nano player_analysis.sh
```

Simpan dan ubah *permission* *file* *script* agar dapat dieksekusi.

```bash
$ chmod +x player_analysis.sh
```

Eksekusi *file script* dengan cara `./player_analysis.sh`.

### a. Melihat summary dari data
Untuk mengetahui Pokemon apa yang sedang membawa teror kepada lingkungan “Generation 9 OverUsed” anda berusaha untuk membuat sebuah fitur untuk menampilkan nama Pokemon dengan Usage% dan RawUsage paling tinggi. 
untuk itu 
```bash
$ nano player_analysis.sh
```
untuk mengedit scripts yang akan dimasukkan, dan ketikkan :
```bash
if [ "$2" == "--info" ]; then
    TOP_USAGE=$(tail -n +2 "$FILE" | sort -t, -k2 -nr | head -1 | awk -F, '{print $1 " (" $2 "%)"}')
    TOP_RAW=$(tail -n +2 "$FILE" | sort -t, -k3 -nr | head -1 | awk -F, '{print $1 " (" $3 " uses)"}')

    echo " Pokémon Usage Summary"
    echo "=============================="
    echo " Most Popular Pokemon: $TOP_USAGE"
    echo " Most Used Pokémon: $TOP_RAW"
    echo "=============================="
    exit 0
fi
```
Jalankan perintah untuk menampilkan outputnya 
```bash
./pokemon_analysis.sh pokemon_usage.csv --info
```
### Output :
![image](https://github.com/user-attachments/assets/e31bd67f-04ce-4832-92c4-ffd96f6d117e)

### b. Mengurutkan Pokemon berdasarkan data kolom
Untuk memastikan bahwa anda mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda berusaha untuk membuat sebuah fitur untuk sort berdasarkan:
a. Usage%
b. RawUsage
c. Nama
d. HP
e. Atk
f. Def
g. Sp.Atk
h. Sp.Def
i. Speed
j. Sort
dilakukan dengan urutan descending untuk semua angka selain nama, yang diurutkan secara alphabetical. Output harus sesuai dengan format csv yang diberikan.
untuk itu 
```bash
$ nano player_analysis.sh
```
untuk mengedit scripts yang akan dimasukkan, dan ketikkan :
```bash
fi

if [ "$2" == "--sort" ]; then
    if [ -z "$3" ]; then
        echo "masukkan kolom yang ingin diurutkan"
        exit 1
    fi

    echo "Mengurutkan Pokemon berdasarkan '$3'..."
    head -n 1 "$FILE"

    case "$3" in
        usage)  COL=2 ;;
        raw)    COL=3 ;;
        name)   COL=1 ;;
        hp)     COL=6 ;;
        atk)    COL=7 ;;
        def)    COL=8 ;;
        spatk)  COL=9 ;;
        spdef)  COL=10 ;;
        speed)  COL=11 ;;
        *)
            echo "Kolom tidak valid!"
            exit 1
            ;;
    esac

    if [ "$3" == "name" ]; then
        tail -n +2 "$FILE" | sort -t, -k"$COL"
    else
        tail -n +2 "$FILE" | sort -t, -k"$COL" -nr
    fi
    exit 0
fi
```
Jalankan perintah untuk menampilkan outputnya 
```bash
./pokemon_analysis.sh pokemon_usage.csv --info
```
### Output :
![image](https://github.com/user-attachments/assets/138313a8-d36b-4955-b82c-8912502bc4a2)

### c. Mencari nama Pokemon tertentu
Setelah mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda ingin mencari tahu statistik penggunaan dari beberapa Pokemon yang mungkin dapat bertanding baik melawan sebagian besar Pokemon yang ada di Top 10 usage. Oleh karena itu, anda membuat fitur search berdasarkan nama Pokemon. Pastikan agar search yang dimasukkan tidak memunculkan hasil yang tidak diinginkan (seperti memunculkan semua Grass type ketika mengetik search “Grass”), dan output harus sesuai dengan format csv yang diberikan dengan sort Usage%.
untuk itu 
```bash
$ nano player_analysis.sh
```
untuk mengedit scripts yang akan dimasukkan, dan ketikkan :
```bash
if [ "$2" == "--grep" ]; then
    if [ -z "$3" ]; then
        echo "Masukkan nama Pokémon yang ingin dicari"
        exit 1
    fi

    echo "Mencari Pokemon '$3'..."
    echo "Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed"

    grep -i "$3" "$1" | sort -t, -k2 -nr || echo "Pokemon '$3' tidak ditemukan"

    exit 0
fi
```
Jalankan perintah untuk menampilkan outputnya 
```bash
./pokemon_analysis.sh pokemon_usage.csv --grep <nama pokemon>
```
### Output :
![image](https://github.com/user-attachments/assets/b11d07c7-b698-4caa-9408-f125967c1816)

### d. Mencari Pokemon berdasarkan filter nama type
Agar dapat membuat tim yang baik, anda perlu memikirkan kombinasi yang baik dari beberapa Pokemon, hal ini disebut sebagai “core” oleh komunitas Pokemon! Oleh karena itu, anda berpikiran untuk membuat fitur filter berdasarkan Type sebuah Pokemon. Output harus sesuai dengan format csv yang diberikan dengan sort Usage%

```bash
$ nano player_analysis.sh
```
untuk mengedit scripts yang akan dimasukkan, dan ketikkan :
```bash
if [ "$2" == "--filter" ]; then
    if [ -z "$3" ]; then
        echo "Harap masukkan tipe Pokémon yang ingin difilter"
        exit 1
    fi

    echo "Mencari Pokemon dengan Type '$3'..."
    head -n 1 "$FILE"
    tail -n +2 "$FILE" | grep -i ",$3\|,$3," | sort -t, -k2 -nr
    exit 0
fi
```
Jalankan perintah untuk menampilkan outputnya 
```bash
./pokemon_analysis.sh pokemon_usage.csv --grep <type pokemon>
```
### Output :
![image](https://github.com/user-attachments/assets/afbbcddf-107a-4cda-bb69-e0c78a01ffb5)

### e. Error handling
Pastikan program yang anda buat mengecek semua kesalahan pengguna agar dapat memberikan kejelasan kepada pengguna pada setiap kasus.

```bash
$ nano player_analysis.sh
```
untuk mengedit scripts yang akan dimasukkan, dan ketikkan :
```bash
VALID_COMMANDS=("--info" "--sort" "--grep" "--filter")
if [[ ! " ${VALID_COMMANDS[@]} " =~ " $2 " ]]; then
    echo "Perintah '$2' tidak dikenali!"
    echo "Gunakan -h atau --help untuk informasi lebih lanjut."
    exit 1
fi
```
Jalankan perintah untuk menampilkan outputnya(coba asal)
```bash
./pokemon_analysis.sh pokemon_usage.csv --kmlkm
```
### Output :
![image](https://github.com/user-attachments/assets/b7e97656-2194-43bc-88ca-c2290743100e)

### f. Help screen yang menarik
Untuk memberikan petunjuk yang baik pada pengguna program, anda berpikir untuk membuat sebuah help screen yang muncul ketika mengetik -h atau --help sebagai command yang dijalankan. Kriteria yang harus ada dalam help screen pada program ini adalah:
ASCII Art yang menarik! Gunakan kreativitas anda untuk mencari/membuat art yang cocok untuk program yang sudah anda buat!
Penjelasan setiap command dan sub-command

edit kembali player_analysis.sh dengan script dibawah ini dan masukkan script dibawah ini :

![image](https://github.com/user-attachments/assets/334cfe5d-e186-43c3-b6fd-3a3c43aa9087)
### Output :
![image](https://github.com/user-attachments/assets/440742c5-ca20-43d5-918c-33782a0e8abc)















