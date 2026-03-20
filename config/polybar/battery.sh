#!/bin/bash

# Check if battery exists
battery=$(ls /sys/class/power_supply/ 2>/dev/null | grep -i "bat" | head -1)

# If no battery found (desktop PC) show nothing
if [ -z "$battery" ]; then
    echo ""
    exit 0
fi

# Get battery info
capacity=$(cat /sys/class/power_supply/$battery/capacity 2>/dev/null || echo "0")
status=$(cat /sys/class/power_supply/$battery/status 2>/dev/null || echo "Unknown")

# Choose icon based on status and level
if [ "$status" = "Charging" ]; then
    if [ "$capacity" -ge 90 ]; then icon="󰂅"
    elif [ "$capacity" -ge 70 ]; then icon="󰂈"
    elif [ "$capacity" -ge 50 ]; then icon="󰂆"
    elif [ "$capacity" -ge 30 ]; then icon="󰂄"
    else icon="󰢜"
    fi
    echo "%{F#98c379}$icon $capacity%%%{F-}"
elif [ "$status" = "Full" ]; then
    echo "%{F#98c379}󰁹 Full%{F-}"
else
    if [ "$capacity" -ge 90 ]; then icon="󰂂"
    elif [ "$capacity" -ge 70 ]; then icon="󰂀"
    elif [ "$capacity" -ge 50 ]; then icon="󰁾"
    elif [ "$capacity" -ge 30 ]; then icon="󰁼"
    elif [ "$capacity" -ge 15 ]; then icon="󰁺"
    else icon="󰂃"
    fi
    # Low battery warning
    if [ "$capacity" -le 15 ]; then
        notify-send -u critical "Battery Low" "Battery at $capacity%!"
        echo "%{F#e06c75}$icon $capacity%%%{F-}"
    else
        echo "%{F#89DCEB}$icon $capacity%%%{F-}"
    fi
fi

