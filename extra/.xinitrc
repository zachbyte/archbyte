#!/bin/sh

pamixer &
/usr/lib/polkit-kde-authentication-agent-1 &

prev_date=""
prev_time=""

while true; do
    current_date=$(date "+%Y-%m-%d")
    current_time=$(date "+%I:%M %p")

    if [ "$current_date $current_time" != "$prev_date $prev_time" ]; then
        date_status="󰃭  $current_date"
        time_status="  $current_time"
        xsetroot -name "$date_status  $time_status"
        prev_date=$current_date
        prev_time=$current_time
    fi

    sleep 1
done &

hsetroot -solid "#1E1E2E"
exec dwm

