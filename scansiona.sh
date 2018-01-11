#!/bin/sh

cd /data/https/italia

# Aggiornati

git pull

# Media

curl "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=0&format=csv" | grep -v Domain | awk -F, '{ print $2}' > media.csv

/usr/local/bin/pshtt media.csv --output media-risultati.csv

rm -f media.csv

# Politica
curl "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=1181765951&format=csv" | grep -v Domain | awk -F, '{ print $2}' > politica.csv

/usr/local/bin/pshtt politica.csv --output politica-risultati.csv

rm -f politica.csv

# Aggiorna lo scan
git commit -am "update scan"

# Pusha lo scan

git push
