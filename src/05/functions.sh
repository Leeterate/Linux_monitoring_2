#!/bin/bash

function monitoring1() {

if [[ $1 -eq 1 ]]; then
    awk '{print $0}' $2/*.log | sort -nk9
fi

if [[ $1 -eq 2 ]]; then
    awk '{print $0}' $2/*.log | sort -k1 -u
fi

if [[ $1 -eq 3 ]]; then
    awk '$9 ~ /[45][0-9][0-9]/{print $0}' $2/*.log
fi

if [[ $1 -eq 4 ]]; then
    awk '$9 ~ /[45][0-9][0-9]/{print $0}' $2/*.log | sort -k1 -u
fi

}
