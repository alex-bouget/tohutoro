#!/bin/bash

# This script is used to build the project.

read -p "Enter the version number: " version

url="https://github.com/MisterMine01/tohutoro/releases/download/${version}/micro_setup.sh"

cuttly="https://cutt.ly/api/api.php"

key=$(cat private)

name="tohutoro"

link="https://cutt.ly/${name}"

urlencode() {
    local input=${1? Missing the data to URL encode...}

    local data="$(curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "${input}" "")"

    echo "${data##/?}"
}

#curl -d "{\"key\":\"${key}\",\"edit\":\"${name}\", \"delete\": \"1\"}" ${cuttly} > url.json


url1="${cuttly}?key=${key}&edit=${name}&name=tohutoro${RANDOM}"
url1resp=$(curl -X GET "${url1}")

url2="${cuttly}?key=${key}&name=tohutoro&short=$(urlencode ${url})"
url2resp=$(curl -X GET "${url2}")

echo "${url1}"
echo "${url1resp}"
echo "${url2}"
echo "${url2resp}"