#!/bin/bash

SELECTION="$(printf "\
Lock\\0icon\\x1f/home/adrien/.local/share/icons/Tela-circle/24/actions/system-lock-screen.svg\n\
Suspend\\0icon\\x1f/home/adrien/.local/share/icons/Tela-circle/24/actions/system-suspend.svg\n\
Log out\\0icon\\x1f/home/adrien/.local/share/icons/Tela-circle/24/actions/system-log-out.svg\n\
Reboot\\0icon\\x1f/home/adrien/.local/share/icons/Tela-circle/24/actions/system-reboot.svg\n\
Shutdown\\0icon\\x1f/home/adrien/.local/share/icons/Tela-circle/24/actions/system-shutdown.svg" | fuzzel --dmenu -p "Power Menu: ")"

case $SELECTION in
    *"Lock")
        swaylock;;
    *"Suspend")
        systemctl suspend;;
    *"Log out")
        niri msg action quit -s;;
    *"Reboot")
        systemctl reboot;;
    *"Reboot to UEFI")
        systemctl reboot --firmware-setup;;
    *"Shutdown")
        systemctl poweroff;;
esac
