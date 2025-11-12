#!/usr/bin/bash

# Source secrets for pin number and hostname:ports
source ~/.samsung_env

# Login via a pin, you could do android swipe thingy if you wanted but it would be very tedious
adb connect "$ANDROID_DEVICE"
adb -s "$ANDROID_DEVICE" shell input keyevent KEYCODE_WAKEUP
adb -s "$ANDROID_DEVICE" shell input swipe 300 1000 300 100
adb -s "$ANDROID_DEVICE" shell input text "$PHONE_PIN"
adb -s "$ANDROID_DEVICE" shell input keyevent 66

adb -s "$ANDROID_DEVICE" shell monkey -p com.duosecurity.duomobile -c android.intent.category.LAUNCHER 1

# There is some extra latency sometimes
sleep 3
# This taps the accept button.
# Tweak if your resolution is different than mine.
adb -s "$ANDROID_DEVICE" shell input tap 770 2000

adb -s "$ANDROID_DEVICE" shell input keyevent 3
# turn the screen back off
adb -s "$ANDROID_DEVICE" shell input keyevent 26
