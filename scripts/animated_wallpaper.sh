function animated_wallpapers() {
	xwinwrap_args="-ni -b -nf -un -o 1.0 -ov -debug"
	mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

    folder="opt/my-graphical-interface/animated_wallpaper/"
    video_1="screen_1/tokyo_revengers_end_1.mp4"
    video_2="screen_2/tokyo_revengers_end_2.mp4"

    screen_1="1920x1080"
    screen_2="1600x900+1920"

    nice xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args $folder$video_1 &
    nice xwinwrap -g $screen_2 $xwinwrap_args -- mpv $mpv_args $folder$video_2 &
}

until $(echo xwininfo -root) | grep "IsViewable"; do :; done
animated_wallpapers
