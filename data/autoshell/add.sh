#!/bin/bash

function help {
    echo "AutoShell v1.0"
    echo "by MisterMine01"
    echo ""
    echo "Function of AutoShell/add"
    echo ""
    echo "list - List all functions"
    echo "info [Function] - Show the informations of a function"
    echo "addf [Function] - Set the function to add"
    echo "addp [Parameter] - Set the parameter to add"
    echo "movep [index1] [index2] - Move a parameter"
    echo "removep [index] - Remove a parameter"
    echo "view - View the function and his parameters to add"
    echo "help - Show this help"
    echo "save - Save the function and his parameters"
    echo "return - return to the AutoShell"
}

data=$(cat autostart.data)
useraddrep=""
while [[ $useraddrep != "exit" ]]; do
    read -p "autoShell/add>" useraddrep
    if [ $useraddrep = "help" ]; then
        help
    fi
    if [ $useraddrep = "add" ]; then
        add
    fi
done