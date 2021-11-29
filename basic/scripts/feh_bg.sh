#!/bin/sh

folder="$HOME/opt/wallpapers/wallpaper"

function usage() {
    local CategoryList=$(ls $folder)

    echo ''
    echo 'These categorys are avaliable:'
    echo ''

    for category in "${CategoryList[@]}";
    do
        echo "$category"
    done

    echo ''
    echo 'Run:'
    echo 'feh_bg.sh your_category'
    echo ''
}

set_wallpaper() {
	local all='feh --recursive --bg-fill --bg-scale --randomize'
	
	$all $folder/$1
}

[[ -z $1 ]] && usage || set_wallpaper $1
