#!/bin/sh
# pip install pshtt

cd /data/https/italia

# Aggiornati

git pull

# Media

curl -s "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=0&format=csv" | grep -v Domain | awk -F, '{ print $2}' > media.csv

/usr/local/bin/pshtt media.csv --output media-risultati.csv --sorted

/usr/local/bin/pshtt media.csv --output media-risultati.json --json --sorted


rm -f media.csv

# Politica
curl -s "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=1181765951&format=csv" | grep -v Domain | awk -F, '{ print $2}' > politica.csv

/usr/local/bin/pshtt politica.csv --output politica-risultati.csv --sorted

/usr/local/bin/pshtt politica.csv --output politica-risultati.json --json --sorted

rm -f politica.csv

# Aggiorna lo scan
git commit -am "update scan"

# Pusha lo scan

git push
