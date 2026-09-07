#!/bin/bash

MAX_BRIGHTNESS=96000
GAMMA=2.2
STEP=5
STATE_FILE="$HOME/.cache/perceptual_brightness"

get_raw_brightness() {
    brightnessctl get
}

# Convert raw → perceptual (0–100)
raw_to_perceptual() {
    awk -v raw="$1" -v max="$MAX_BRIGHTNESS" -v g="$GAMMA" '
        BEGIN {
            if (raw < 1) raw = 1
            print int(100 * ((raw / max) ^ (1 / g)))
        }'
}

# Convert perceptual (0–100) → raw
perceptual_to_raw() {
    awk -v p="$1" -v max="$MAX_BRIGHTNESS" -v g="$GAMMA" '
        BEGIN {
            print int(max * ((p / 100) ^ g))
        }'
}

send_notification() {
    dunstify \
        -i "$1" \
        -t 1000 \
        -r 2593 \
        -u normal \
        -h int:value:"$2" \
        "Brightness: $2%"
}

# Initialize perceptual state if missing
if [ ! -f "$STATE_FILE" ]; then
    raw=$(get_raw_brightness)
    raw_to_perceptual "$raw" > "$STATE_FILE"
fi

current=$(cat "$STATE_FILE")

case "$1" in
    up)
        new=$((current + STEP))
        icon="/home/bear/Pictures/sysicon/brightness-up.png"
        ;;
    down)
        new=$((current - STEP))
        icon="/home/bear/Pictures/sysicon/brightness-down.png"
        ;;
    *)
        exit 1
        ;;
esac

# Clamp
if [ "$new" -gt 100 ]; then new=100; fi
if [ "$new" -lt 1 ]; then new=1; fi

raw=$(perceptual_to_raw "$new")
brightnessctl set "$raw"

echo "$new" > "$STATE_FILE"
send_notification "$icon" "$new"

##!/bin/bash
## backlight up icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
## backlight down icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
## Credit from https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a & https://wiki.archlinux.org/title/Dunst  .
#
## You can call this script like this:
## $./screenlight.sh up
## $./screenlight.sh down
#
#function get_brightness {
#    brightnessctl get
#}
##max brightness on andromeda:
##96000
#
#
#function send_notification {
#    brightness=$((`get_brightness`/960))
#    # Send the notification
#     dunstify -i /home/bear/Pictures/sysicon/brightness-up.png -t 1000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}%"
#}
#
#function send_notification1 {
#    brightness=$((`get_brightness`/960))
#    # Send the notification
#     dunstify -i /home/bear/Pictures/sysicon/brightness-down.png -t 1000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}%"
#}
#case $1 in
#    up)
#	# Set the brightness on 
#
#	# Up the brightness (+ 5%)
#    brightnessctl set +2%
#	send_notification
#	;;
#    down)
#	brightnessctl set 2%-
#	send_notification1
#	;;
#esac
