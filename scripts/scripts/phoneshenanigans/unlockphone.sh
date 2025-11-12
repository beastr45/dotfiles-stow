#!/usr/bin/bash

# Source for pin number and hostname/ports
source ~/.samsung_env

adb -s "$ANDROID_DEVICE" shell input keyevent KEYCODE_WAKEUP
adb -s "$ANDROID_DEVICE" shell input swipe 300 1000 300 100
#Please remember not to publish this online
adb -s "$ANDROID_DEVICE" shell input text "$PHONE_PIN"
adb -s "$ANDROID_DEVICE" shell input keyevent 66
