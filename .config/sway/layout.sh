# layout.sh
#!/usr/bin/bash
num=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

if [ ! -z $1 ]
then
    : # path was given
    i3-msg "workspace $num; append_layout ~/.config/i3/layouts/workspace-1.json" & 
    alacritty --class=Left -t=A1 --working-directory=$1 &
    alacritty --class=TopRight -t=A2 --working-directory=$1 & 
    alacritty --class=BottomRight -t=A3 --working-directory=$1
else
    : # path was not given
    i3-msg "workspace $num; append_layout ~/.config/i3/layouts/workspace-1.json" & 
    alacritty --class=Left -t=A1 --working-directory=$HOME/source &
    alacritty --class=TopRight -t=A2 --working-directory=$HOME/source & 
    alacritty --class=BottomRight -t=A3 --working-directory=$HOME/source
fi
