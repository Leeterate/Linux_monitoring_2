#!/bin/bash

function check1() {
    if [ $# -ne 6 ]; then
        echo "enter 6 arguments"
        exit
    fi

    if ! [ -d $1 ]; then
        echo "Enter valid path"
        exit
    fi

    if ! [[ $2 =~ ^[0-9]+$ && $2 -ge 1 ]]; then
        echo "Enter amount of folders"
        exit
    fi

    if ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]]; then
        echo "Enter up to 7 characters for folders names"
        exit
    fi

    if ! [[ $4 =~ ^[0-9]+$ && $4 -ge 1 ]]; then
        echo "Enter amount of files in each folder"
        exit
    fi

    if ! [[ $5 =~ ^[a-zA-Z]{1,7}.[a-zA-Z]{1,3}$ ]]; then
        echo "Enter correct characters for names"
        exit
    fi

    if ! [[ $6 =~ ^[0-9]{1,3}[kK][bB]$ && ${6/[kK][bB]/} -ge 1 && ${6/[kK][bB]/} -le 100 ]]; then
        echo "Enter correct size for each file 1-100 in kb"
        exit
    fi
}
