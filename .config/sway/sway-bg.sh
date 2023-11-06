#!/usr/bin/bash
new_wallpaper=`find /home/USERNAME/Pictures/Wallpapers -type f | shuf -n 1`
/usr/bin/wal -i "$new_wallpaper"
swaybg -o '*' -i $new_wallpaper -c "#000000" &
