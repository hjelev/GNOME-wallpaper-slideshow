#!/usr/bin/env bash
# Get the Real Username
RUID=$(who | awk 'FNR == 1 {print $1}')

# Translate Real Username to Real User ID
RUSER_UID=$(id -u ${RUID})

DIR="/home/masoko/Pictures/wallpapers/reddit"
PIC=$(ls $DIR/* | shuf -n1)


# Set gsettings for the Real User
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

# /usr/bin/gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
exit
