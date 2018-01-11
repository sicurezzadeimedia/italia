#!/bin/sh

# Media

curl "https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E/export?gid=0&format=csv" | grep -v Domain | awk -F, '{ print $2}' > domini.csv

