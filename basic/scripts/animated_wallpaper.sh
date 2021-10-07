#!/bin/bash

function animated_wallpapers() {
    pkill mpv

	#xwinwrap_args="-ni -b -nf -fs" # 1 screen
	xwinwrap_args="-ni -b -nf -ov"
	mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

    folder="$HOME/opt/animated_wallpapers/"
    random_1=$(ls $folder |sort -R |tail -n 1)
    random_2=$(ls $folder |sort -R |tail -n 1)

    screen_1="1920x1080"
    screen_2="1600x900+1920"
    margin="--video-align-x=-1 --video-align-y=-1"
    scale="--video-scale-x=0.86 --video-scale-y=0.86"

    nice -n 15 xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args $folder$random_1 &
    nice -n 15 xwinwrap -g $screen_2 $xwinwrap_args -- mpv $scale $margin $mpv_args $folder$random_2 &
}

until $(echo xwininfo -root) | grep "IsViewable"; do :; done
animated_wallpapers
