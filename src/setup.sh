#!/bin/bash

VERSION="1.1"

savePWD=$PWD
baseDir=$(dirname "$0")
cd $baseDir


# transform to executable files
chmod +x autostart/auto.sh
chmod +x autostart/autostart.data
chmod +x bashrc/bashrc.sh
chmod +x bashrc/command.sh
chmod +x bashrc/tohutoro.sh


# add the autostart script in the autostart folder
desktopFile=$(cat "autostart/auto.desktop")
desktopFile=$(sed "s|Exec=.*|Exec=$PWD/autostart/auto.sh|" <<< "$desktopFile")
echo "$desktopFile" > ~/.config/autostart/tohutoro.desktop

# add configs file
if [ ! -d "configs" ]; then
    mkdir configs
    echo "nano" > "${PWD}/configs/editor"
    echo ${VERSION} > "${PWD}/configs/version"
fi


# add the bashrc script in the bashrc file
bashrc=$(cat ~/.bashrc)
if [[ $(grep "#tohutoro.setupInstalled" <<< "$bashrc") == "" ]]; then
    echo "" >> ~/.bashrc
    echo "#tohutoro.setupInstalled=true" >> ~/.bashrc
    echo ". $PWD/bashrc/bashrc.sh" >> ~/.bashrc
fi


cd $savePWD