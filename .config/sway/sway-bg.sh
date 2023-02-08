#!/usr/bin/bash
killall swaybg &
new_wallpaper=`find /home/USERNAME/Pictures/Wallpapers -type f | shuf -n 1`
/home/USERNAME/.local/bin/wal -i "$new_wallpaper"
swaybg -o '*' -i $new_wallpaper 
