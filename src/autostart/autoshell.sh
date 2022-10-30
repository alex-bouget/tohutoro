#!/bin/bash

savePWD=$PWD
baseDir=$(dirname "$0")
cd $baseDir

OIFS="$IFS"
function setIFS {
    IFS=$1
}
setIFS $'\n'

function help {
    echo "AutoShell v1.0"
    echo "by MisterMine01"
    echo ""
    echo "Function of AutoShell"
    echo ""
    echo "add - Add a new function to the autostart"
    echo "remove - Remove a function from the autostart"
    echo "help - Show this help"
    echo "exit - Exit AutoShell"
}


userrep=""
while [[ $userrep != "exit" ]]; do
    read -p "autoShell>" userrep
    if [ $userrep = "help" ]; then
        help
    fi
    if [ $userrep = "add" ]; then
        nano autostart.data
    fi
    if [ $userrep = "remove" ]; then
        nano autostart.data
    fi
done

IFS="$OIFS"
cd $savePWD