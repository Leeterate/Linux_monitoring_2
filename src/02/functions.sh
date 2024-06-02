#!/bin/bash

function check1() {
    if [ $# -ne 3 ]; then
        echo "enter 3 arguments"
        exit
    fi

    if ! [[ $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
        echo "Enter up to 7 characters for folders names"
        exit
    fi

    if ! [[ $2 =~ ^[a-zA-Z]{1,7}.[a-zA-Z]{1,3}$ ]]; then
        echo "Enter correct characters for names"
        exit
    fi

    if ! [[ $3 =~ ^[0-9]{1,3}[mM][bB]$ && ${3/[mM][bB]/} -ge 1 && ${3/[mM][bB]/} -le 100 ]]; then
        echo "Enter correct size for each file 1-100 in mb"
        exit
    fi
}
