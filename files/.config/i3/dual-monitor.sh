#!/bin/bash
mons --primary DP-1-0
mons -o
nitrogen --set-color=000000 --set-centered ~/wallpaper.png
mons -e right
i3-msg restart
