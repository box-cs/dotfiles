wallpaper_path="$HOME/Pictures/Wallpapers/"
if [ ! -f /tmp/current_wallpaper ]; then
    echo "" > /tmp/current_wallpaper
fi

current_wallpaper="$(cat /tmp/current_wallpaper)"
new_wallpaper=$(find "$wallpaper_path" -type f ! -name "$current_wallpaper" -printf "%f\n"| shuf -n 1)
echo "$new_wallpaper" > /tmp/current_wallpaper
new_wallpaper_path="$wallpaper_path$new_wallpaper"
/usr/bin/wal -i "$new_wallpaper_path"
swaybg -o '*' -i $new_wallpaper_path -c "#000000" &
