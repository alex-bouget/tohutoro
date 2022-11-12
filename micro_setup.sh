#!/bin/bash

# tohutoro_version 1.1

url="https://github.com/MisterMine01/tohutoro/releases/download/v1.1/tohutoro.zip"
curl -L -o /tmp/tohutoro.zip $url
unzip /tmp/tohutoro.zip -d /tmp/tohutoro
if [ ! -d ~/.tohutoro ] ; then
    mkdir ~/.tohutoro
else 
    echo "Directory ~/.tohutoro already exists"
fi
cp -r /tmp/tohutoro/* ~/.tohutoro

chmod +x -R ~/.tohutoro
rm -rf /tmp/tohutoro
rm /tmp/tohutoro.zip
~/.tohutoro/setup.sh