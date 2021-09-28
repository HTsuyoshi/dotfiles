function animated_wallpapers() {
	xwinwrap_args="-ni -b -nf -un -o 1.0 -ov -debug"
	mpv_args="-wid WID --loop --no-audio --no-resume-playback --panscan=1.0"

    folder="$HOME/opt/my-graphical-interface/animated_wallpaper/"
    random_1=$(ls $folder |sort -R |tail -n 1)
    random_2=$(ls $folder |sort -R |tail -n 1)

    screen_1="1920x1080"
    screen_2="1600x900+1920"

    nice xwinwrap -g $screen_1 $xwinwrap_args -- mpv $mpv_args $folder$random_1 &
    nice xwinwrap -g $screen_2 $xwinwrap_args -- mpv $mpv_args $folder$random_2 &
}

until $(echo xwininfo -root) | grep "IsViewable"; do :; done
animated_wallpapers
