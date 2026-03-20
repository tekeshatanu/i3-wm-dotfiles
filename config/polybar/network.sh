#!/bin/bash

# Get active connection
wifi=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep "^yes" | cut -d: -f2)
ethernet=$(nmcli -t -f device,state dev 2>/dev/null | grep "ethernet.*connected" | cut -d: -f1)
usb=$(nmcli -t -f device,state dev 2>/dev/null | grep "enp0s26\|usb.*connected" | cut -d: -f1)

if [ -n "$wifi" ]; then
    echo "󰤨  $wifi"
elif [ -n "$ethernet" ]; then
    echo "󰈀  Ethernet"
elif [ -n "$usb" ]; then
    echo "󰕒  USB"
else
    echo "󰤭  offline"
fi

