#!/usr/bin/env bash
PROMFILE="/path/textfile/ttl.prom"
PROMCANDFILE="/path/textfile/ttl.prom.cand"

tcpdump -Qin -nlv "tcp[tcpflags] & tcp-syn != 0"|awk -f ttl.awk| while read b
do barr=($b)
    if grep -q ${barr[1]%.*} $PROMCANDFILE
    then 
        echo "already in file"
    else 
        echo "hop_distance{src=\"${barr[1]%.*}\"} ${barr[0]}">>$PROMCANDFILE
        if _=("$(date +%s)" - "$(stat -L --format %Y $PROMFILE)") >= 10
        then
            mv $PROMCANDFILE $PROMFILE
            touch $PROMCANDFILE
        fi
    fi
done