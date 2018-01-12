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

# Mozilla HTTP Observatory scan - double pass
for sito in `cat media.csv` ; do /usr/local/bin/observatory --rescan $sito ; sleep 5; done
for sito in `cat media.csv` ; do /usr/local/bin/observatory --rescan $sito ; sleep 5; done

# TODO: Comporre un CSV sintetico con i siti, rating e link ad analisi di dettaglio
# Per etrarre i risultati sintetici del rating usare
#  curl -s https://http-observatory.security.mozilla.org/api/v1/analyze?host=www.mozilla.org | jq -r '.grade'


rm -f media.csv

# Politica
curl -s "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=1181765951&format=csv" | grep -v Domain | awk -F, '{ print $2}' > politica.csv

# PSHTT
/usr/local/bin/pshtt politica.csv --output politica-risultati.csv
/usr/local/bin/pshtt politica.csv --output politica-risultati.json --json 

# Mozilla HTTP Observatory scan - double pass
for sito in `cat politica.csv` ; do /usr/local/bin/observatory --rescan $sito ; sleep 5; done
for sito in `cat politica.csv` ; do /usr/local/bin/observatory --rescan $sito ; sleep 5; done

rm -f politica.csv

# Aggiorna lo scan
git commit -am "update scan"

# Pusha lo scan

git push
