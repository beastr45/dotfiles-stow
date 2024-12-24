#!/bin/sh
killall conky
sleep 2s
# conky -c "$HOME/.conky/Sirius/Sirius.conf" &
# conky -c "$HOME/.conky/Sirius/Sirius2.conf" &
conky -c $HOME/.config/conky/conky.conf &> /dev/null &
conky -c $HOME/.config/conky/battery/battery.conf &> /dev/null &
conky -c $HOME/.config/conky/quote/quote.conf &> /dev/null &
conky -c $HOME/.config/conky/conky.conf &> /dev/null &
conky -c $HOME/.config/conky/Fuyue/Fuyue.conf &> /dev/null &

exit 0
