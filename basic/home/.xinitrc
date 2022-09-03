#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[[ -f $sysresources ]] && xrdb -merge $sysresources
[[ -f $sysmodmap ]] && xmodmap $sysmodmap
[[ -f "$userresources" ]] && xrdb -merge "$userresources"
[[ -f "$usermodmap" ]] &&xmodmap "$usermodmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

function set_scripts() {
	[[ -f ~/.xprofile ]] && source ~/.xprofile
	# Battery Notification
	[[ -f ~/.scripts/battery/battery.sh ]] && source ~/.scripts/battery/battery.sh &
	# Wallpaper
	#[[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 1080 a
	[[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 1080/games/wallpaperflare.com_wallpaper.jpg
	#feh --bg-fill /usr/share/backgrounds/Images/doIt.png
	# Animated Wallpaper
	 [[ -f ~/.scripts/animated_wallpaper.sh ]] && ~/.scripts/animated_wallpaper.sh favourite &
	# DWM status
	[[ -f ~/.scripts/dwm_bar.sh ]] && ~/.scripts/dwm_bar.sh &
}

function start_programs() {
	# Notifications
	dunst &
	# Set Keyboard
	setxkbmap br
	xrandr --output eDP-1 --brightness 0.6
	picom &
}


# Set PATH
PATH=$PATH:/home/azz/.scripts

# Start Programs
start_programs

# Set Scripts
set_scripts

# Execute WM
#exec bspwm
exec dwm
