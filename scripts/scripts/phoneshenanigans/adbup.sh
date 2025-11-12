#!/usr/bin/bash
#Fuck no root access, I hate locked OEMs.

# Source for pin number and hostname/ports
source ~/.samsung_env

ANDROID_DEVICE=$(adb devices | grep -w "device" | awk 'NR==1{print $1}')

adb -s "$ANDROID_DEVICE" shell input keyevent KEYCODE_WAKEUP
adb -s "$ANDROID_DEVICE" shell input swipe 300 1000 300 100
#Please remember not to publish this online
adb -s "$ANDROID_DEVICE" shell input text "$PHONE_PIN"
adb  -s "$ANDROID_DEVICE" shell input keyevent 66
# while ! adb -s "$ANDROID_DEVICE" shell pidof com.sec.android.app.launcher >/dev/null; do
#     sleep 1
# done

adb  -s "$ANDROID_DEVICE" shell monkey -p com.tailscale.ipn -c android.intent.category.LAUNCHER 1
adb -s "$ANDROID_DEVICE" tcpip 5555

# adb -s "$ANDROID_DEVICE" shell input keyevent 3
# turn the screen back off
# adb -s "$ANDROID_DEVICE" shell input keyevent 26
