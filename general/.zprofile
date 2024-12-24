if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep chadwm || startx
fi
