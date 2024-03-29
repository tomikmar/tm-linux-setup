
# Android 11 / 2021.12



## Settings

### Network & internet

* [+] Wi-Fi / Wi-Fi preferences / Turn on Wi-Fi automatically

* [-] Mobile network / Roaming
* [c] Mobile network / App data usage / S / Mobile data usage cycle
* [c] Mobile network / Data warning & limit
* [+] Mobile network / MMS messages (Mobile data above must be switched off to access this option)
* [-] Mobile network / Wi-Fi calling 
* [?] Mobile network / Carrier video calling 
* [c] Mobile network / Access Point Names

* [c] Hotspot & tethering / Wi-Fi hotspot / Hotspot name

* [c] Private DNS


### Connected devices

* [c] Connection preferences / Bluetooth / Device name
* [+] Connection preferences / NFC
* [+] Connection preferences / Cast / ... / Enable wireless display
* [+] Connection preferences / Android Beam
* [?] Connection preferences / Printing / Default Print Service


### Apps & Notifications

* [-] Notifications / Sensitive notifications
* [c] Notifications / Default notification sound
* [c] Notifications / Do Not Disturb / Schedules / Sleeping

* [c] Default apps
* [-] Default apps / Opening links / Instant apps

* [r] Permission manager
* [r] Special app access


### Battery

* [c] Battery saver and performance / Automatic power saver (25%)


### Disaplay

* [c] Night Light / Schedule & Start time (22:30) & End time (06:00)
* [c] Styles & wallppers
* [c] Screen timeout (1 minute)
* [c] Screen server
* [c] Lock screen / Notifications on lock screen / Show sensitive content only when unlocked
* [c] Lock screen / Add text on lock screen
* [+] Lock screen / Display music visualizer
* [+] Lock screen / Show lockdown options
* [+] Tap to wake
* [+] Prevent accidental wake-up
* [+] Tap to sleep
* [+] Wake on plug



### Sound

* [+] Link ring & notification volumes
* [c] Increasing ring volume
* [c] Do Not Disturb (already set above)
* [c] Phone ringtone
* [c] Default notification sound (already set above)
* [c] Default alarm sound
* [-] Touch sounds


### Storage

* [-] Storage manager


### Privacy

* [r] Permission manager (already reviewed above)
* [+] Show passwords
* [+] Trust / Restrict USB


### Location

* [+] Wi-Fi and Bluetooth scanning / Wi-Fi scanning 
* [-] Wi-Fi and Bluetooth scanning / Bluetooth scanning


### Security

* [c] Screen lock
* [-] Screen lock / S / Make pattern visible
* [c] Screen lock / S / Lock after screen timeout (30s)
* [+] Screen lock / S / Power button instantly locks

* [c] SIM card lock / Lock SIM card


### Accessibility

* [c] System navigation / Gesture navigation


### System

* [c] Languages & input / Languages
* [c] Languages & input / On-screen keyboard

* [c] Status bar / Quick pulldown / Right
* [c] Status bar / Network trafic monitor / Display mode (Upload and download)
* [+] Status bar / Network trafic monitor / Auto hide
* [c] Status bar / Network trafic monitor / Traffic measurment units (MB/s)

* [+] Status bar / Show seconds

* [c] Status bar / Batery status style (Text)

* [c] Gestures / Quickly open camera (On)
* [c] Gestures / System navigation (already set above)
* [c] Gestures / Prevent ringing (Off)

* [+] Date & time / Use network-provided time
* [+] Date & time / Use network-provided time zone
* [+] Date & time / Use 24-hour format

* [c] Backup

* [-] Developer options / USB debugging


### About phone

* [c] Emergency information / Emergency contacts



## Messaging

* [+] Settings / Advanced / SMS delivery reports



## ADB backup (tested on Android 9)

### Get selected apps without data

* adb shell pm
* adb shell pm list packages -f -3 > my-apps1.txt
  * -f: see their associated file
  * -3: filter to only show third party packages
* vim my-apps1.txt
* get apps without data

  for APP in $(cat my-apps1.txt)
  do
    adb pull $( echo ${APP} | sed "s/^package://" | sed "s/base.apk=/base.apk /").apk
  done


### Get selected apps data

* adb shell pm list packages -3 | sed "s/^package://" > my-apps2.txt
* vim my-apps2.txt
* Get data

  for APP in $(cat my-apps2.txt)
  do
    echo "Downloading data for ${APP} ..."
    adb backup -f ${APP}.backup3 ${APP}
  done


### Restore app (partially works)

* adb install application.apk
* adb restore application.backup


### More examples

* https://gist.github.com/AnatomicJC/e773dd55ae60ab0b2d6dd2351eb977c1


