#!/bin/sh

folder="$HOME/opt/wallpapers/wallpaper1080"

function usage() {
    local CategoryList=$(ls $folder/$1)

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

random_wallpaper() {
	local all='feh --recursive --bg-fill --bg-scale --randomize'
	
	$all $folder/$1
}

set_wallpaper() {
	local all='feh --bg-fill --bg-scale'
	
	$all $folder/$1
}

( [[ -z $1 ]] || [ -d $folder/$1 ]) && usage $1 || set_wallpaper $1
[[ $2 ]] && random_wallpaper $2
