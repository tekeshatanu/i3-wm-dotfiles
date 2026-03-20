#!/bin/bash

chosen=$(printf "  Logout\n  Reboot\n  Shutdown\n  Lock" | \
  rofi -dmenu \
       -p "Power" \
       -theme ~/.config/rofi/launcher.rasi)

case "$chosen" in
  "  Logout")    i3-msg exit ;;
  "  Reboot")    systemctl reboot ;;
  "  Shutdown")  systemctl poweroff ;;
  "  Lock")      i3lock -c 0d0d0d ;;
esac
