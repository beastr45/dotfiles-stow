#!/bin/sh
if [ "$DESKTOP_SESSION" = "" ]; then 
   sleep 0s
   killall conky
   cd "$HOME/.conky/Sirius"
   conky -c "$HOME/.conky/Sirius/Sirius.conf" &
   cd "$HOME/.conky/Sirius"
   conky -c "$HOME/.conky/Sirius/Sirius2.conf" &
   cd "$HOME/.conky/battery"
   conky -c "$HOME/.conky/battery/battery.conf" &
   cd "$HOME/.conky/quote"
   conky -c "$HOME/.conky/quote/quote.conf" &
   exit 0
fi
