#!/bin/sh

pamixer &
/usr/lib/polkit-kde-authentication-agent-1 &

while true; do
    time=$(date "+%Y-%m-%d %I:%M %p")

    status="  $time"

    xsetroot -name "$status"

    sleep 1m
done &

hsetroot -solid "#1E1E2E"

exec dwm
