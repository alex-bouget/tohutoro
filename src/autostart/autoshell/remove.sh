#!/bin/sh

function help {
    echo "AutoShell v1.0"
    echo "by MisterMine01"
    echo ""
    echo "Function of AutoShell/remove"
    echo ""
    echo "list - List all functions"
    echo "info [Function] - Show the informations of a function"
    echo "remove [index] - Set the function to remove"
    echo "help - Show this help"
    echo "return - return to the AutoShell"
}

data=$(cat autostart.data)

function list {
    echo "List of functions:"
    x=1
    for i in $data; do
        echo "$x: $i"
        x=$((x+1))
    done
}

function info {
    if [ -z $1 ]; then
        echo "You need to specify a function"
    else
        if [ -f function/$1.sh ]; then
            echo "Info of $1:"
            bash "./function/$1.sh" -h
        else
            echo "The function $1 doesn't exist"
        fi
    fi
}


OIFS="$IFS"
function setIFS {
    IFS=$1
}
setIFS $'\n'

userremoverep=""
while [[ $userremoverep != "exit" ]]; do
    read -p "autoShell/remove>" userremoverep
    command=$(cut -d' ' -f1 <<< $userremoverep)
    if [ $command = "help" ]; then
        help
    fi
    if [ $command = "list" ]; then
        list
    fi
    if [ $command = "info" ]; then
        function=$(cut -d' ' -f2- <<< $userremoverep)
        info $function
    fi
    if [ $command = "remove" ]; then
        index=$(cut -d' ' -f2 <<< $userremoverep)
        if [ -z $index ]; then
            echo "You need to specify an index"
        else
            if [ $index -gt 0 ] && [ $index -le $(wc -l <<< $data) ]; then
                data=$(sed "$index d" <<< $data)
                echo "Function removed"
            else
                echo "The index is out of range"
            fi
        fi
    fi
done
echo $data > autostart.data
setIFS "$OIFS"