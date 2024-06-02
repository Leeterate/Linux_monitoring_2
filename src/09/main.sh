#!/bin/bash

. ./functions.sh

while [ 1 ]; do
cpu_load_in_1=$(cat /proc/loadavg | awk '{print $1}')
cpu_load_in_5=$(cat /proc/loadavg | awk '{print $2}')
cpu_load_in_15=$(cat /proc/loadavg | awk '{print $3}')
memMEM=$(free -m | awk 'NR==2 {print $7}')
disk_space_available=$(df -m / | awk 'NR==2 {print $4}')

pwd_log=$(pwd)

touch $pwd_log/log.html
echo "# HELP TESTcpu_load_in_1" > $pwd_log/log.html
echo "# TYPE TESTcpu_load_in_1 gauge" >> $pwd_log/log.html
echo TESTcpu_load_in_1 $cpu_load_in_1 >> $pwd_log/log.html

echo "# HELP TESTcpu_load_in_5" >> $pwd_log/log.html
echo "# TYPE TESTcpu_load_in_5 gauge" >> $pwd_log/log.html
echo TESTcpu_load_in_5 $cpu_load_in_5 >> $pwd_log/log.html

echo "# HELP TESTcpu_load_in_15" >> $pwd_log/log.html
echo "# TYPE TESTcpu_load_in_15 gauge" >> $pwd_log/log.html
echo TESTcpu_load_in_15 $cpu_load_in_15 >> $pwd_log/log.html

echo "# HELP TESTmemMEM" >> $pwd_log/log.html
echo "# TYPE TESTmemMEM gauge" >> $pwd_log/log.html
echo TESTmemMEM $memMEM >> $pwd_log/log.html

echo "# HELP TESTdisk_space_available" >> $pwd_log/log.html
echo "# TYPE TESTdisk_space_available gauge" >> $pwd_log/log.html
echo TESTdisk_space_available $disk_space_available >> $pwd_log/log.html

writelog "$pwd_log"

done