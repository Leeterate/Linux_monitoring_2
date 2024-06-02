#!/bin/bash

log_path=$(pwd)

. ./functions.sh
check1 $@

if [[ $1 -eq 1 ]]; then
    grep New_folder ${log_path/03/02}/log.txt | awk '{print $2}' | xargs sudo rm -rf
fi

if [[ $1 -eq 2 ]]; then
    while read -r line; do
        folder_check=$(echo $line | awk '{print $1}')
        if [[ $folder_check == "New_folder" ]]; then
            tmp=$(echo $line | awk '{print $5}')
            tmp=${tmp//:/}
            time_from=${3//:/}
            time_to=${4//:/}
            if [[ tmp -ge time_from && tmp -le time_to ]]; then
                deletedfile=$(echo $line | awk '{print $2}')
                sudo rm -rf $deletedfile
            fi
        fi
    done <${log_path/03/02}/log.txt
fi

if [[ $1 -eq 3 ]]; then
    grep New_folder ${log_path/03/02}/log.txt | awk '{print $2}' | xargs sudo rm -rf
fi

rm -rf ${log_path/03/02}/log.txt
