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

function set_DE() {

    # Wallpaper
    [[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 2560 a

    # Animated Wallpaper
    [[ -f ~/.scripts/animated_wallpaper.sh ]] && ~/.scripts/animated_wallpaper.sh normal &

    # DWM status
    [[ -f ~/.scripts/dwm_bar.sh ]] && ~/.scripts/dwm_bar.sh &

    picom &
}

# Other Settings
[[ -f ~/.xprofile ]] && source ~/.xprofile

# Notifications
dunst &

# Set Desktop Environment
set_DE

# Set PATH
PATH=$PATH:/home/azz/.scripts

# Execute WM
# exec bspwm
 exec dwm

# Execute DE
# exec budgie-desktop
