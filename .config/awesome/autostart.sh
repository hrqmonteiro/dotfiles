#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

xrdb ~/.Xresources
run picom --experimental-backends -b &
run nm-applet &
run pa-applet &
run nitrogen --restore &
run mpd &
run mpdas &
