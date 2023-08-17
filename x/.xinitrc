#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# Map capslock key to escape
setxkbmap -option caps:escape &
#feh --bg-scale ~/Pictures/Wallpapers/bearndeer.png &
#feh --bg-fill ~/Pictures/Wallpapers/dracula-leaves-6272a4-dark.png &
#to change the feh bg just run feh --bg-fill -> whatever
~/.fehbg &
#ulauncher &

picom -b --vsync &
~/.conky/conky-startup.sh &
#xscreensaver -nosplash &
# xautolock -time 3 -locker alacritty -e cava && slock &
xautolock -time 3 -locker lockscreen &
# xautolock -time 3 -locker slock
# slstatus &
caffeine &
# /home/bear/Applications/filen &
/home/bear/.dwm/lowbatteryremind.sh &
tilda &
filen &

#if u uninstall udiskie remember to fis the unix groups
#go to like a udiskie tutorial or smth
udiskie -tn &

#use wmname to fix java applications not rendering properly source is at suckless website
#not always enabled
#wmname LG3D

#enable dunst notifs y exposing DISPLAY variable and fixes a lot of other things
systemctl --user import-environment DISPLAY &
# dunst &

# xrdb merge ~/.Xresources
# xbacklight -set 10 &
# # feh --bg-fill ~/Pictures/wall/gruv.png &
# xset r rate 200 50 &

~/.config/chadwm/scripts/bar.sh &
# while type dwm >/dev/null; do dwm && continue || break; done
# exec dwm
exec chadwm

# invoke global X session script
. /etc/X11/Xsession
