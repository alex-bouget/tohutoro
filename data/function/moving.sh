function Usage {
    cat <<EOF
Create a link under a directory (source) in the destination.
Usage:
    moving.sh [options]

Options:
    -h | --help     Show this help
    -s | --source   Source directory
    -d | --dest     Destination file
EOF
}


s="NULL"
d="NULL"
while getopts "hs:d:" options # when options was used
do
    case "$options" in
        h)
            Usage
            exit 0
            ;;
        s)
            s="$OPTARG"
            ;;
        d)
            d="$OPTARG"
            ;;
        *)
            cat <<EOF
ERROR 666:
An options didn't exist
EOF
            Usage
            exit 1
            ;;

    esac
done

if [ "$s" = "NULL" ] || [ "$d" = "NULL" ]; then
    Usage
    exit 2
fi

from=$s
folder=$d
if [ -d $folder ]; then
    echo "${folder} already exist"
else
    mkdir $folder
    chmod 700 $folder
fi
if [ -d $from ]; then
    rm -rf $from
fi
ln -s $folder $from
