#!/usr/bin/env bash
# Bash script that changes your desktop wallpaper by picking a random one from the DIR folder
# Schedule this script with a cronjob to get a wallpaper slideshow

DIR="/home/masoko/Pictures/wallpapers/reddit"
RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})
PIC=$(ls $DIR/* | shuf -n1)
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
exit
