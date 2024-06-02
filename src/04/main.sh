#!/bin/bash

. ./functions.sh

log_path=$(pwd)

for i in 1 2 3 4 5; do
years=$(( $RANDOM % 22 + 2000 ))
months=$(echo "Jan Feb Mar Apr Jun Jul Aug Sep Oct Nov Dec")
days=$(( $RANDOM % 31 + 1 ))
date_for_log=$(echo $months | awk '{
    total = 1
    while (total<=NF)
    {
        print $total
        total++
        
    }
}' | shuf -n 1)

log_counter=$(( $RANDOM % 900 + 101 ))

while [[ log_counter -gt 0 ]]; do

node_ip_counter=0
while [[ node_ip_counter -le 3 ]]; do
    random_ip_node=$(( $RANDOM % 256 ))
    complete_ip=$(echo $complete_ip$random_ip_node)
    if [[ node_ip_counter -ne 3 ]]; then
    complete_ip=$(echo "$complete_ip.")
    fi
    node_ip_counter=$(( $node_ip_counter + 1 ))
done


code="$(codegen)"

method="$(methodgen)"

complete_date=$(date +[$days/$date_for_log/$years:%H:%M:%S\ %z])

bytes=$(( $RANDOM ))

browser="$(browsergen)"


url="downlaoads/data/products/main/version/frame"
url_counter=0

while [[ $url_counter -lt 3 ]]; do
url_block[url_counter]=$(echo $url | awk 'BEGIN{FS="/"}{
    total = 1
    while (total<=NF)
    {
        print $total
        total++
        
    }
}' | shuf -n 1)
url_counter=$(( $url_counter + 1 ))
done
complete_url=$(echo "${url_block[0]}/${url_block[1]}/${url_block[2]}")

echo "$complete_ip - - $complete_date \"$method $complete_url HTTP/1.1\" $code $bytes \"-\" \"$browser\"">>$log_path/$i.log

complete_ip=""
log_counter=$(( $log_counter - 1 ))
done
done

# (c) https://developer.mozilla.org
# 200 - Код ответа об успешном статусе "The HTTP 200 OK" указывает, что запрос выполнен успешно. Ответ 200 может кешироваться по умолчанию.
# 201 - Код ответа об успешном статусе указывает, что запрос выполнен успешно и привёл к созданию ресурса. Новый ресурс эффективно создаётся до отправки этого ответа. И новый ресурс возвращается в теле сообщения, его местоположение представляет собой либо URL-адрес запроса, либо содержимое заголовка Location.
# 400 - Код состояния ответа "HTTP 400 Bad Request" указывает, что сервер не смог понять запрос из-за недействительного синтаксиса. Клиент не должен повторять этот запрос без изменений.
# 401 - Код ответа на статус ошибки  HTTP 401 Unauthorized клиента указывает, что запрос не был применён, поскольку ему не хватает действительных учётных данных для целевого ресурса.
# 403 - Код ответа на статус ошибки "HTTP 403 Forbidden" указывает, что сервер понял запрос, но отказывается его авторизовать.
# 404 - Код ответа на ошибку HTTP 404 Not Found указывает, что сервер не может найти запрошенный ресурс. Ссылки, ведущие к коду 404, часто называются сломанными или мёртвыми связями и приводят к ссылочной гнили.
# 500 - Код ответа сервера указывает на то, что сервер столкнулся с неожиданной ошибкой, которая помешала ему выполнить запрос.
# 501 - Серверный код ответа на ошибку указывает, что метод запроса не поддерживается сервером и не может быть обработан. Единственными методами, которые необходимы серверам для поддержки (и, следовательно, не должны возвращать этот код), являются GET и HEAD.
# 502 - Код ответа на ошибку указывает, что сервер, действуя как шлюз или прокси, получил неверный ответ от восходящего сервера.
# 503 - Код состояния сервера, указывающий на то, что сервер не готов обработать данный запрос.