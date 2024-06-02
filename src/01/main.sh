#!/bin/bash

log_path=$(pwd)

. ./functions.sh
check1 $@

folder_ctr=1
file_ctr=1
date_for_name=$(date +%d%m%y)
date_of_creation=$(date +%Y.%m.%d\ %H:%M)
folder_name=$3
file_name=${5/.*/}
file_exten=${5/*./}
size=${6/[kK][bB]/}
size_name=$(echo $6 | tr -d [0-9] | tr [:lower:] [:upper:])

while [[ ${#folder_name} -le 3 ]]; do
    folder_name+=${3:${#3}-1}
done

while [[ ${#file_name} -le 3 ]]; do
    file_name+=${file_name:${#file_name}-1}
done

complete_file_name=$file_name

while [ $folder_ctr -le $2 ]; do
    disk_space=$(df -h -m / | awk 'NR==2 {print $4}')
    if [[ disk_space -le 1024 ]]; then
        echo "Free space left"
        exit
    fi

    mkdir $1/$folder_name'_'$date_for_name
    echo "New_folder $1/$folder_name""_$date_for_name New_folder_date $date_of_creation" >>$log_path/log.txt
    cd $1/$folder_name'_'$date_for_name

    while [ $file_ctr -le $4 ]; do
        disk_space=$(df -h -m / | awk 'NR==2 {print $4}')
        if [[ disk_space -le 1024 ]]; then
            echo "Free space left"
            exit
        fi
        fallocate -l $size$size_name $file_name'_'$date_for_name.$file_exten
        echo "New_file $1/$folder_name""_$date_for_name/$file_name""_$date_for_name.$file_exten New_file_date $date_of_creation File_size $size$size_name" >>$log_path/log.txt
        file_ctr=$(($file_ctr + 1))
        file_name+=${file_name:${#file_name}-1}
    done

    cd ..
    file_ctr=1
    file_name=$complete_file_name
    folder_name+=${3:${#3}-1}
    folder_ctr=$(($folder_ctr + 1))
done