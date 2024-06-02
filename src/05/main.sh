#!/bin/bash

. ./functions.sh

log_path=$(pwd)
log_path=${log_path/05/04}
echo $log_path
if [ $# -ne 1 ];then
    echo "Enter one argument: 1-4"
    exit
fi

if ! [[ $1 -eq 1 || $1 -eq 2 || $1 -eq 3 || $1 -eq 4 ]]; then
    echo "Only 1-4"
    exit
fi

monitoring1 "$1" "$log_path"