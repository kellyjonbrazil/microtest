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
        curl -s -X POST "$1":"$2"/request_number_"$i" | jq .
    else
        curl "$1":"$2"/request_number_"$i"
    fi
done
