#!/bin/bash

function check1() {
    if [[ $1 -eq 1 || $1 -eq 3 ]]; then
        if [[ $# -ne 1 ]]; then
            echo "In 1 or 3 case only one parameter needed"
        fi
    elif [[ $1 -eq 2 ]]; then
        if [[ $# -ne 4 ]]; then
            echo "In case 2 add date and time of start and end in format \"YYYY.MM.DD HH:MM HH:MM\""
            exit
        else
            if ! [[ $2 =~ ([0-9][0-9][0-9][0-9]).([0][1-9]|[1][0-2]).(0[1-9]|[1-2][0-9]|3[0,1]) ]]; then
                echo "Enter valid date. Example: YYYY.MM.DD"
                exit
            fi
            if ! [[ $3 =~ ([0,1][0-9]|[2][0-3]):([0-5][0-9]) && $4 =~ ([0,1][0-9]|[2][0-3]):([0-5][0-9]) ]]; then
                echo "Enter valid time. Example: HH:MM"
                exit
            fi
        fi
    else
        echo "Invalid parameter"
    fi
}
