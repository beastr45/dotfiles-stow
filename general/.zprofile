if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep chadwm || startx
fi

# Created by `pipx` on 2025-02-16 20:08:41
export PATH="$PATH:/home/bear/.local/bin"
