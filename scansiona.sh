#!/bin/sh
#
# https://github.com/dhs-ncats/pshtt
# pip install pshtt
#
# https://github.com/mozilla/observatory-cli
# npm install -g observatory-cli

cd /data/https/italia

# Aggiornati

git pull

# Media

curl -s "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=0&format=csv" | grep -v Domain | awk -F, '{ print $2}' > media.csv

#PSHTT
/usr/local/bin/pshtt media.csv --output media-risultati.csv 
/usr/local/bin/pshtt media.csv --output media-risultati.json --json 

# Mozilla HTTP Observatory scan
for sito in `cat media.csv` ; do /usr/local/bin/observatory --rescan $sito; done



rm -f media.csv

# Politica
curl -s "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=1181765951&format=csv" | grep -v Domain | awk -F, '{ print $2}' > politica.csv

# PSHTT
/usr/local/bin/pshtt politica.csv --output politica-risultati.csv
/usr/local/bin/pshtt politica.csv --output politica-risultati.json --json 

# Mozilla HTTP Observatory scan
for sito in `cat politica.csv` ; do /usr/local/bin/observatory --rescan $sito; done

rm -f politica.csv

# Aggiorna lo scan
git commit -am "update scan"

# Pusha lo scan

git push
