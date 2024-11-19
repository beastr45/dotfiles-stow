#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)


#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#keyboard shortcuts without recompiling
sxhkd &

# Map capslock key to escape
sleep 1;setxkbmap -option caps:escape &
sleep 1;setxkbmap -option compose:ralt &
#to change .fehbg just run feh --bg-fill -> whatever
~/.fehbg &
feh --bg-fill ~/Pictures/Wallpapers/*.current &
#ulauncher &

picom -b --vsync &
~/.conky/conky-startup.sh &
xautolock -time 5 -locker ~/scripts/lockscreen &
# slstatus &
# /home/bear/Applications/filen &
# filen &

/home/bear/scripts/lowbatteryremind.sh &

caffeine &
# tilda &
nm-applet &
volctl &
unclutter &
keepassxc &


#use wmname to fix java applications not rendering properly source is at suckless website not always enabled
wmname LG3D &

#enable dunst notifs y exposing DISPLAY variable and fixes a lot of other things
systemctl --user import-environment DISPLAY &
dunst &
# xrdb merge ~/.Xresources &
#xbacklight -set 10 &

#change rate of keyboard repitition
# xset r rate 500 50 &

#disable acidental touchpad typing
# syndaemon -i 3 -t -K -R &
#

~/.config/chadwm/scripts/bar.sh &
# while type dwm >/dev/null; do dwm && continue || break; done
# exec dwm
exec chadwm

# invoke global X session script
# . /etc/X11/Xsession
