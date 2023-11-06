#!/usr/bin/bash

if [[ $OLD_WALLPAPER == "" ]]
then
  filter="thisisafilter"
else
  filter="$OLD_WALLPAPER"
fi 
new_wallpaper=`find /home/USERNAME/Pictures/Wallpapers -type f | grep -v "$filter" | shuf -n 1`

echo "new_wallpaper"
echo "$new_wallpaper"
echo "OLD_WALLPAPER"
echo "$OLD_WALLPAPER"
killall swaybg &

/usr/bin/wal -i "$new_wallpaper" 
swaybg -o '*' -i $new_wallpaper -c "#000000" & 

export OLD_WALLPAPER="${new_wallpaper}"
