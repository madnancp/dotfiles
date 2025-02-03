#!/bin/bash

STATE=$(nmcli radio wifi)

if [ "$STATE" = "enabled" ]; then
    nmcli radio wifi off
    notify-send "Wi-Fi Disabled"
else
    nmcli radio wifi on
    notify-send "Wi-Fi Enabled"
fi

