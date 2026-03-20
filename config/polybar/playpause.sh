#!/bin/bash
if mpc status 2>/dev/null | grep -q '\[playing\]'; then
    echo "⏸"
else
    echo "▶"
fi
