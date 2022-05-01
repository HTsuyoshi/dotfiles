#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

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
	# [[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 1080 a

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
exec dwm
