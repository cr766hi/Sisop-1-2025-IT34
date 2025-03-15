# Sisop-1-2025-IT34

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
