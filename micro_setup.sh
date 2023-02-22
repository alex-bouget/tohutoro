#!/bin/bash

# tohutoro_version 1.1

url="https://github.com/MisterMine01/tohutoro/releases/download/v1.1/tohutoro.zip"
curl -L -o /tmp/tohutoro.zip $url
unzip /tmp/tohutoro.zip -d /tmp/tohutoro
if [ ! -d ~/.tohutoro ] ; then
    mkdir ~/.tohutoro
else 
    echo "Directory ~/.tohutoro already exists"
    rm /tmp/tohutoro/autostart/autostart.data
    for file in $HOME/.tohutoro/bashrc/* ; do
        shaHOME=$(sha256sum $file | awk '{print $1}')
        shaTMP=$(sha256sum /tmp/tohutoro/bashrc/$(basename $file) | awk '{print $1}')
        if [ "$shaHOME" == "$shaTMP" ] ; then
            echo "File $file doesn't change, it will be updated"
        else
            echo "File $file has changed, it will not be updated"
            rm /tmp/tohutoro/bashrc/$(basename $file)
        fi
    done
fi
#cp -r /tmp/tohutoro/* ~/.tohutoro

#chmod +x -R ~/.tohutoro
rm -rf /tmp/tohutoro
rm /tmp/tohutoro.zip
#~/.tohutoro/setup.sh