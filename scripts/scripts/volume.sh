#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    # Send the notification
    #dunstify -i /home/bear/Pictures/sysicon/volume-up.png -t 1000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}

function send_notification1 {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    # Send the notification
    #dunstify -i /home/bear/Pictures/sysicon/volume-down.png -t 1000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	# amixer -D pulse sset Master 5%+ > /dev/null
	if is_mute ; then
	    pactl set-sink-volume @DEFAULT_SINK@ +5%
	    pactl set-sink-mute @DEFAULT_SINK@ toggle
        #dunstify -i /home/bear/Pictures/sysicon/mute.png -t 1000 -r 2593 -u normal "Volume: Muted 0%"
	else
	    pactl set-sink-volume @DEFAULT_SINK@ +5%
	    send_notification
	fi
	;;
    down)
	# amixer -D pulse set Master on > /dev/null
	# amixer -D pulse sset Master 5%- > /dev/null
	# send_notification1
	if is_mute ; then
	    pactl set-sink-volume @DEFAULT_SINK@ 0%
        #dunstify -i /home/bear/Pictures/sysicon/mute.png -t 1000 -r 2593 -u normal "Volume: Muted 0%"
	else
	    pactl set-sink-volume @DEFAULT_SINK@ -5%
	    send_notification1
	fi
	;;
    mute)
    	# Toggle mute
	# amixer -D pulse set Master 1+ toggle > /dev/null
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	if is_mute ; then
        nop
        #dunstify -i /home/bear/Pictures/sysicon/mute.png -t 1000 -r 2593 -u normal "Volume: Mute"
	else
	    send_notification
	fi
	;;
esac
