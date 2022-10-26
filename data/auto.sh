#!/bin/bash

savePWD=$PWD
baseDir=$(dirname "$0")
cd $baseDir

data=$(cat autostart.data)
OIFS="$IFS"
function setIFS {
    IFS=$1
}
setIFS $'\n'


for i in $data;
do
    exec=$(cut -d' ' -f1 <<< $i)
    setIFS $OIFS
    param=$(cut -d' ' -f2- <<< $i)
    if [ -f "function/${exec}.sh" ]; then
        echo "Running ${exec}.sh ${param}"
        bash "function/${exec}.sh" ${param}
    else
        echo "ERROR 666: ${exec} doesn't exist"
    fi
    setIFS $'\n'
done
IFS="$OIFS"