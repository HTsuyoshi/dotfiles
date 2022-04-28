#!/bin/bash

xwinwrap_args="-ni -nf -b -ov -d"
folder="$HOME/opt/animated_wallpapers/$wallpaper/"
mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

screen_1="1920x1080"
screen_2="1600x900+1920"

random_1=$(ls $folder |sort -R |tail -n 1)
random_2=$(ls $folder |sort -R |tail -n 1)

function kill_wallpaper() {
	( pidof -q mpv ) && pkill -9 mpv 2> /dev/null
	sleep 1
}

function animated_wallpaper() {
	wallpaper="$1"

	align="--video-align-x=-1 --video-align-y=-1"
	scale="--video-scale-x=0.86 --video-scale-y=0.86"

	nice -n 15 xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args "$folder/$random_1" &
	nice -n 15 xwinwrap -g $screen_2 $xwinwrap_args -- mpv $scale $align $mpv_args "$folder/$random_2" &
}

function animated_wallpaper_one_screen() {
	[[ ! -z "$1" ]] && wallpaper="$1" || wallpaper="favourite"

	nice -n 15 xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args "$folder$1/$random_1" &
}

function usage() {
	local CategoryList=("$(ls $folder/1920)")
	echo ''
	echo 'These categories are avaliable:'
	echo ''
	echo "$CategoryList"
	echo ''
	echo 'Run:'
	echo '	animated_wallpaper.sh your_category'
	echo ''
}

#until $(echo xwininfo -root) | grep "IsViewable" > /dev/null; do sleep 1; done

kill_wallpaper
[[ ! -z "$1" ]] && animated_wallpaper_one_screen "1920/$1" || usage
