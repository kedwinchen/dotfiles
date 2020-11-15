#!/bin/bash

polybar-msg cmd quit
killall polybar
pkill polybar

polybar -r top -c ~/.config/polybar/config.ini &
polybar -r bottom -c ~/.config/polybar/config.ini &

if [[ $(polybar -m | wc -l) -gt 1 ]] ; then
    polybar -r ext-top -c ~/.config/polybar/config.ini &
    polybar -r ext-bottom -c ~/.config/polybar/config.ini &
fi
