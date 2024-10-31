#!/bin/sh

pamixer &
/usr/lib/polkit-kde-authentication-agent-1 &

while true; do
    time=$(date "+%I:%M:%S %p")

    status="  $time"

    xsetroot -name "$status"

    sleep 1s
done &

hsetroot -solid "#1E1E2E"

exec dwm
