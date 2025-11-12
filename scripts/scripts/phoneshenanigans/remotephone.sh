#!/usr/bin/bash

# Source for pin number and hostname/ports
source ~/.samsung_env

adb connect "$ANDROID_DEVICE"
#connect via usb instead if is option
ANDROID_DEVICE=$(adb devices | grep -w "device" | awk 'NR==1{print $1}')

adb -s "$ANDROID_DEVICE" shell input keyevent KEYCODE_WAKEUP
adb  -s "$ANDROID_DEVICE" shell input swipe 300 1000 300 100
#Please remember not to publish this online
adb -s "$ANDROID_DEVICE" shell input text "$PHONE_PIN"
adb  -s "$ANDROID_DEVICE" shell input keyevent 66
# scrcpy -s "$ANDROID_DEVICE" --turn-screen-off --power-off-on-close --kill-adb-on-close --stay-awake
scrcpy -s "$ANDROID_DEVICE" --turn-screen-off  --kill-adb-on-close --stay-awake
