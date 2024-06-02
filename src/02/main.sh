#!/bin/bash

log_path=$(pwd)

. ./functions.sh
check1 $@

folder_ctr=1
file_ctr=1
date_for_name=$(date +%d%m%y)
date_of_creation=$(date +%Y.%m.%d\ %H:%M)
folder_name=$1
file_name=${2/.*/}
file_exten=${2/*./}
size=${3/[mM][bB]/}
size_name=$(echo $3 | tr -d [0-9] | tr [:lower:] [:upper:])

while [[ ${#folder_name} -le 4 ]]; do
    folder_name+=${1:${#1}-1}
done

while [[ ${#file_name} -le 4 ]]; do
    file_name+=${file_name:${#file_name}-1}
done

complete_file_name=$file_name
complete_folder_name=$folder_name

while [[ 1 ]]; do
    tmp_path=$(sudo find / -type d | grep -v bin | grep -v sbin | grep -v sys | grep -v dev | grep -v proc | grep -v run | grep -v snap | shuf -n 1)
    cd $tmp_path

    random_number_for_folder=$(($RANDOM % 230 + 1))
    while [[ $folder_ctr -le $random_number_for_folder ]]; do
        disk_space=$(df -h -m / | awk 'NR==2 {print $4}')
        if [[ disk_space -le 1024 ]]; then
            echo "Free disk space -le 1024"
            exit
        fi
        sudo mkdir $tmp_path/$folder_name'_'$date_for_name
        echo "New_folder $tmp_path/$folder_name""_$date_for_name New_folder_date $date_of_creation" >>$log_path/log.txt
        cd $tmp_path/$folder_name'_'$date_for_name

        random_number_for_file=$(($RANDOM % 230 + 1))
        while [[ $file_ctr -le $random_number_for_file ]]; do
            disk_space=$(df -h -m / | awk 'NR==2 {print $4}')
            if [[ disk_space -le 1024 ]]; then
                echo "Free disk space -le 1024"
                exit
            fi
            sudo fallocate -l $size$size_name $file_name'_'$date_for_name.$file_exten
            echo "New_file $tmp_path/$folder_name""_$date_for_name/$file_name""_$date_for_name.$file_exten New_file_date $date_of_creation File_size $size$size_name" >>$log_path/log.txt
            file_ctr=$(($file_ctr + 1))
            file_name+=${file_name:${#file_name}-1}
        done
        cd ..
        folder_name+=${1:${#1}-1}
        file_name=$complete_file_name
        file_ctr=1
        folder_ctr=$(($folder_ctr + 1))
    done
    folder_name=$complete_folder_name
done