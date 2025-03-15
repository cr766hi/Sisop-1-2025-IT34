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


awk 'BEGIN {FS=","; sum=0; hitung=0}
    $8 ~ /Tablet/ {sum += $6; hitung++}
    END {
        if (hitung > 0)
            printf "Rata-rata durasi membaca dengan Tablet: %.2f menit\n", sum/hitung;
        else
            print "Tidak ada durasi membaca dengan Tablet.";
    }' "$file"


awk 'BEGIN {FS=","; max=0}
    NR > 1 {if ($7 > max) {max = $7; name = $3; book_title = $2}}
    END {
        if (max > 0)
            print "Pembaca dengan rating tertinggi adalah", name, "berjudul", book_title, "dengan rating", max;
        else
            print "Tidak ada pembaca dengan rating tertinggi.";
    }' "$file"


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
