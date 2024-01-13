#!/usr/bin/env bash

script="$(slurp -pf '
first(
    recurse(.floating_nodes[]?, .nodes[]?)
        | select(.visible)
        | select(.rect
            | select(%x >= .x)
            | select(%x <= .x + .width)
            | select(%y >= .y)
            | select(%y <= .y + .height)))
')"

[ "$script" != "" ] &&
swaymsg -t get_tree | jq "$script"
