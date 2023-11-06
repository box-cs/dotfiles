#!/usr/bin/bash

swayidle -w \
    timeout 10000 'swaymsg "output * dpms off"' \
    timeout 10000 'swaylock -f -c 000000' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -f -c 000000'
