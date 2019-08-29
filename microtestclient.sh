#!/bin/bash
i=0

if [[ "$1" == "" ]]; then
    echo "Usage:"
    echo "$0 <host> <port> [-a]"
    echo
    echo "-a:  send post requests to get a json response"
    exit
fi
    
while true;
do
    ((i++))
    if [[ "$3" == "-a" ]]; then
        curl --connect-timeout 5 --max-time 7 -s -X POST "$1":"$2"/request_number_"$i" | jq .
    else
        curl --connect-timeout 5 --max-time 7 "$1":"$2"/request_number_"$i"
    fi
done
