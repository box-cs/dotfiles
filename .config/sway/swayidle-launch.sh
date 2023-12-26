#!/usr/bin/bash
swayidle -w \
timeout 300 'swaymsg "output * dpms off"' \
timeout 300 'swaylock -f -c 000000' \
resume 'swaymsg "output * dpms on"' \
before-sleep 'swaylock -f -c 000000'
