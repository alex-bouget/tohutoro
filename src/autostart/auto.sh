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

oldPATH=$PATH
PATH="$PATH:$PWD/function"

. autostart.data

PATH=$oldPATH
IFS="$OIFS"
cd $savePWD