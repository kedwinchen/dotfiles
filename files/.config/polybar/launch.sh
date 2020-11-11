#!/bin/bash

polybar-msg cmd quit
killall polybar
pkill polybar

polybar -r top -c ~/.config/polybar/bars/top.ini &
polybar -r bottom -c ~/.config/polybar/bars/bottom.ini &
