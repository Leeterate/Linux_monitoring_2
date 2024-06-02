#!/bin/bash

function methodgen {
methods_list="GET POST PUT PATCH DELETE"
local methods=$(echo $methods_list | awk '{
    total = 1
    while (total<=NF)
    {
        print $total
        total++
        
    }
}' | shuf -n 1)
echo "$methods"
}

function codegen {
answer_code="200 201 400 401 403 404 500 501 502 503"
local code=$(echo $answer_code | awk '{
    total = 1
    while (total<=NF)
    {
        print $total
        total++
        
    }
}' | shuf -n 1)
echo "$code"
}

function browsergen {
browsers_list="Mozilla/Google Chrome/Opera/Safari/Internet Explorer/Microsoft Edge/Crawler and bot/Library and net tool"
local browsers=$(echo $browsers_list | awk 'BEGIN{FS="/"}{
    total = 1
    while (total<=NF)
    {
        print $total
        total++
        
    }
}' | shuf -n 1)
echo "$browsers"
}
