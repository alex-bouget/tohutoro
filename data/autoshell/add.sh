#!/bin/sh

function help {
    echo "AutoShell v1.0"
    echo "by MisterMine01"
    echo ""
    echo "Function of AutoShell/add"
    echo ""
    echo "list - List all functions"
    echo "info [Function] - Show the informations of a function"
    echo "addf [Function] - Set the function to add"
    echo "addp *[Parameter] - Set multiple parameter to add"
    echo "movep [index1] [index2] - Move a parameter"
    echo "removep [index] - Remove a parameter"
    echo "view - View the function and his parameters to add"
    echo "help - Show this help"
    echo "save - Save the function and his parameters"
    echo "return - return to the AutoShell"
}

function list {
    echo "List of functions:"
    for i in $(ls function); do
        echo $(cut -d'.' -f1 <<< $i)
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

data=$(cat autostart.data)
func_data=""
useraddrep=""
while [[ $useraddrep != "exit" ]]; do
    read -p "autoShell/add>" useraddrep
    command=$(cut -d' ' -f1 <<< $useraddrep)
    if [ $command = "help" ]; then
        help
    fi
    if [ $command = "list" ]; then
        list
    fi
    if [ $command = "info" ]; then
        function=$(cut -d' ' -f2- <<< $useraddrep)
        info $function
    fi
    if [ $command = "addf" ]; then
        function=$(cut -d' ' -f2- <<< $useraddrep)
        if [ -f function/$function.sh ]; then
            echo "Function $function added"
            func_data="$function"
        fi
    fi
    if [ $command = "addp" ]; then
        parameter=$(cut -d' ' -f2- <<< $useraddrep)
        func_data="$func_data $parameter"
    fi
    if [ $command = "movep" ]; then
        index1=$(cut -d' ' -f2 <<< $useraddrep)
        index2=$(cut -d' ' -f3 <<< $useraddrep)
        if [ -z $index1 ] || [ -z $index2 ]; then
            echo "You need to specify two index"
        else
            if [ $index1 -gt 0 ] && [ $index2 -gt 0 ]; then
                if [ $index1 -le $(wc -w <<< $func_data) ] && [ $index2 -le $(wc -w <<< $func_data) ]; then
                    func_data=$(echo $func_data | awk -v i1=$index1 -v i2=$index2 '{for(i=1;i<=NF;i++)if(i==i1)printf $i2" ";else if(i==i2)printf $i1" ";else printf $i" "}')
                else
                    echo "The index is out of range"
                fi
            else
                echo "The index need to be greater than 0"
            fi
        fi
    fi
    if [ $command = "removep" ]; then
        index=$(cut -d' ' -f2 <<< $useraddrep)
        if [ -z $index ]; then
            echo "You need to specify an index"
        else
            if [ $index -gt 0 ]; then
                if [ $index -le $(wc -w <<< $func_data) ]; then
                    func_data=$(echo $func_data | awk -v i=$index '{for(j=1;j<=NF;j++)if(j!=i)printf $j" "}')
                else
                    echo "The index is out of range"
                fi
            else
                echo "The index need to be greater than 0"
            fi
        fi
    fi
    if [ $command = "view" ]; then
        echo "Function to add: ${func_data}"
    fi
    if [ $command = "save" ]; then
        if [[ -z $func_data ]]; then
            echo "You need to specify a function"
        else
            data="$data\n$func_data"
            echo -e $data > autostart.data
            echo "Function saved"
            func_data=""
        fi
    fi
done
