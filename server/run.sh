#!/bin/bash
cd /var/www/html/frc
rm -f matches.*
rm -f opr.txt
rm -f opr.full
wget https://raw.githubusercontent.com/supertetelman/frc-data-analysis/master/data/matches.txt
curl -L "https://docs.google.com/spreadsheet/ccc?key=12b11O8jPtzwlBA-8ozXmeime75Qdlcu7OCc8i4loWV4&output=csv" |tail -n +3 |grep -v XXX | awk  -F, '{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10}' > matches.txt
octave run.m
mv opr.txt opr.full
cat opr.full | grep -v ",0" | awk -F, '{print $1" "$2}'| sort -k2 -n > opr.txt
mv opr.txt opr.rank
tac opr.rank > opr.rank.rev
cat -n opr.rank.rev > opr.txt
