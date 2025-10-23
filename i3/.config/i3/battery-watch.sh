#!/usr/bin/env bash

# battery-watch.sh
#
# Usage:
#   battery-watch.sh         # normal mode, monitors battery
#   battery-watch.sh --test  # simulate low battery notification

# Configuration
THRESHOLD_PERCENT=15                                                        # when battery drops to this (or below) and discharging → alert
INTERVAL_SEC=60                                                             # how often to check (in seconds)
NOTIFY_SOUND="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga" # or your preferred sound file
LOCKFILE="/tmp/battery-watch.lock"
TEST_MODE=0

# Parse args
if [[ "$1" == "--test" ]]; then
    TEST_MODE=1
fi

# Ensure only one instance
if [[ -e "$LOCKFILE" ]]; then
    # already running
    exit 0
fi
touch "$LOCKFILE"
trap 'rm -f "$LOCKFILE"; exit' INT TERM EXIT

# Function to send alert
send_alert() {
    local percent=$1
    notify-send -u critical "Battery low: ${percent}%" \
        "Your battery is at ${percent}% and discharging. Plug in charger!" \
        -i battery-caution
    # Play sound (if file exists)
    if [[ -f "$NOTIFY_SOUND" ]]; then
        paplay "$NOTIFY_SOUND" &
    fi
}

# Main loop
while true; do
    if [[ $TEST_MODE -eq 1 ]]; then
        percent=$THRESHOLD_PERCENT
        status="Discharging"
    else
        bat_dir="/sys/class/power_supply/BAT0"

        if [[ ! -d "$bat_dir" ]]; then
            echo "Battery directory not found at $bat_dir" >&2
            break
        fi

        status=$(<"$bat_dir/status")

        if [[ -f "$bat_dir/energy_now" && -f "$bat_dir/energy_full" ]]; then
            now=$(<"$bat_dir/energy_now")
            full=$(<"$bat_dir/energy_full")
        else
            echo "Battery info format unsupported in $bat_dir" >&2
            break
        fi

        percent=$((now * 100 / full))
    fi

    # Check condition: discharging AND below threshold
    if [[ "$status" == "Discharging" && "$percent" -le "$THRESHOLD_PERCENT" ]]; then
        send_alert "$percent"
        # Here we persist until charger plugged:
        # Wait until status changes (to Charging or Full)
        while true; do
            sleep $INTERVAL_SEC
            status2=$(cat "$bat_dir/status")
            if [[ "$status2" != "Discharging" ]]; then
                break
            fi
            # you could also re-send every N minutes if you want persistent reminders
            send_alert "$percent"
        done
    fi

    sleep $INTERVAL_SEC
done

rm -f "$LOCKFILE"
