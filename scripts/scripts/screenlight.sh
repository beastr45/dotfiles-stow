#!/bin/bash
# backlight up icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
# backlight down icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
# Credit from https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a & https://wiki.archlinux.org/title/Dunst  .

# You can call this script like this:
# $./screenlight.sh up
# $./screenlight.sh down

function get_brightness {
    brightnessctl get
}
#max brightness on andromeda:
#96000


function send_notification {
    brightness=$((`get_brightness`/960))
    # Send the notification
     dunstify -i /home/bear/Pictures/sysicon/brightness-up.png -t 1000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}%"
}

function send_notification1 {
    brightness=$((`get_brightness`/960))
    # Send the notification
     dunstify -i /home/bear/Pictures/sysicon/brightness-down.png -t 1000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}%"
}
case $1 in
    up)
	# Set the brightness on 
	
	# Up the brightness (+ 5%)
    brightnessctl set +2%
	send_notification
	;;
    down)
	brightnessctl set 2%-
	send_notification1
	;;
esac
