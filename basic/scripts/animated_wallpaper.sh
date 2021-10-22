#!/bin/bash

function animated_wallpapers() {

    ( pidof -q mpv ) && pkill -9 mpv 2> /dev/null

    wallpaper="$1"

    local xwinwrap_args="-ni -b -nf -ov -d"
    local mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

    local folder="$HOME/opt/animated_wallpapers/$wallpaper/"
    local random_1=$(ls $folder |sort -R |tail -n 1)
    local random_2=$(ls $folder |sort -R |tail -n 1)

    local screen_1="1920x1080"
    local screen_2="1600x900+1920"
    local align="--video-align-x=-1 --video-align-y=-1"
    local scale="--video-scale-x=0.86 --video-scale-y=0.86"

    nice -n 15 xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args $folder$random_1 &
    nice -n 15 xwinwrap -g $screen_2 $xwinwrap_args -- mpv $scale $align $mpv_args $folder$random_2 & 
}

function animated_wallpaper_one_screen() {
    pkill mpv 2> /dev/null

    local wallpaper="perfect"
    [[ ! -z "$1" ]] && wallpaper="$1"

    xwinwrap_args="-ni -b -nf -fs -ov -d" # 1 screen

    local folder="$HOME/opt/animated_wallpapers/$wallpaper/"
    local random_1=$(ls $folder |sort -R |tail -n 1)
    local screen_1="1920x1080"
    local mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

    nice -n 15 xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args $folder$random_1 &
}

function usage() {
    local CategoryList=(
        "blue"
        "colorful"
        "dark"
        "gray"
        "pink_purple"
        "red"
        "white"
        "yellow"
    )

    echo ''
    echo 'These categorys are avaliable:'

    for category in "${CategoryList[@]}";
    do
        echo "    $category"
    done

    echo ''
    echo 'Run:'
    echo '    animated_wallpaper.sh your_category'
    echo ''
}

until $(echo xwininfo -root) | grep "IsViewable" > /dev/null; do :; done

[[ ! -z "$1" ]] && animated_wallpapers "$1" || usage
