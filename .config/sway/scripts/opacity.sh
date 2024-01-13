for script in $(pgrep -f 'python\s(\/.+)+\/inactive-windows-transparency'); do
    echo "Killing $script"
    kill -9 "$script";
done

python /usr/share/sway/scripts/inactive-windows-transparency.py --opacity 0.85
