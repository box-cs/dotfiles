#!/usr/bin/bash

new_wallpaper=`find /home/USERNAME/Pictures/Wallpapers -type f | shuf -n 1`

echo "new wallpaper ${new_wallpaper}"
echo "old wallpaper ${OLD_WALLPAPER}"
if [[ $new_wallpaper != $OLD_WALLPAPER ]]
then
  killall swaybg &
  /usr/bin/wal -i "$new_wallpaper"
  swaybg -o '*' -i $new_wallpaper -c "#000000" & 
else
  echo "Found the same wallpaper"
fi
export OLD_WALLPAPER="${new_wallpaper}"
