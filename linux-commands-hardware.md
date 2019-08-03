X
-
    xinput list
    xinput --list-props "PS/2 Generic Mouse"



Bluetooth
---------

    apt list --installed | grep "blue"
    apt list --installed | grep "rfkill"

    rfkill
    rfkill list
    #sudo apt-get install bluetooth bluez bluez-tools rfkill --not tested

    service bluetooth status
    apt install blueman
    hciconfig hci0 up
    hcitool scan
    sdptool browse 83:xx:xx:xx:xx:xx
    bluetoothctl
            [bluetooth]# info <mac>
    l2ping 83:xx:xx:xx:xx:xx

Links
* https://askubuntu.com/questions/1065335/bluetooth-mouse-constantly-disconnects-and-reconnects
* https://www.maketecheasier.com/setup-bluetooth-in-linux/
* https://askubuntu.com/questions/1040497/bluetooth-problem-ubuntu-18-04-lts
* https://www.pcsuggest.com/linux-bluetooth-setup-hcitool-bluez/
* https://unix.stackexchange.com/questions/269661/how-to-turn-off-wireless-power-management-permanently



dmidecode
---------
    dmidecode -s system-product-name
    dmidecode



