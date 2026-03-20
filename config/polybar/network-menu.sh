#!/bin/bash

chosen=$(printf "Network Settings\nWiFi On/Off\nConnect WiFi\nDisconnect" | \
  rofi -dmenu \
       -p "Network" \
       -theme ~/.config/rofi/topmenu.rasi)

case "$chosen" in
  "Network Settings")
    alacritty -e nmtui ;;
  "WiFi On/Off")
    nmcli radio wifi toggle
    notify-send "Network" "WiFi toggled" ;;
  "Connect WiFi")
    alacritty -e nmtui ;;
  "Disconnect")
    nmcli dev disconnect $(nmcli -t -f device,state dev | grep connected | cut -d: -f1 | head -1)
    notify-send "Network" "Disconnected" ;;
esac
