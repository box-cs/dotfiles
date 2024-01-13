swaymsg -t get_outputs | \
  jq -r \
  'sort_by(.make) | [.[] | "\(.name)"] | to_entries | .[] | "set $display\(.key) \(.value)"' \
  > ~/.config/sway/monitor-layout.conf
