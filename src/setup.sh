#!/bin/bash


savePWD=$PWD
baseDir=$(dirname "$0")
cd $baseDir

desktopFile=$(cat "autostart/auto.desktop")
desktopFile=$(sed "s|Exec=.*|Exec=$PWD/autostart/auto.sh|" <<< "$desktopFile")
echo "$desktopFile" > ~/.config/autostart/tohutoro.desktop

bashrc=$(cat ~/.bashrc)
if [[ $(grep "#tohutoro.setupInstalled" <<< "$bashrc") == "" ]]; then
    echo "" >> ~/.bashrc
    echo "#tohutoro.setupInstalled=true" >> ~/.bashrc
    echo ". $PWD/bashrc/bashrc.sh" >> ~/.bashrc
fi
cd $savePWD