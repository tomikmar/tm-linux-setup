About
-----

Volumio configuration template.


Configuration - UI
------------------

Sources

  * Disable "UPNP Renderer"
  * Disable "Shairport-sync"
  * Disable "DLNA Browser"

Network

  * Disable Hostspot
  * Change DNS (1.1.1.2, 1.0.0.2)

System

  * Disable sending UI stats



Configuration - SSH
-------------------

  * Temporarily enable SSH: http://192.168.xxx.xxx/dev/

  * Update and fix after the update
    * apt update
    * apt upgrade
    * echo "/opt/vc/lib" >> /etc/ld.so.conf; ldconfig

  * Install tools
    * sudo apt install vim
    * select-editor
    * sudo apt install cron exim4- (install cron without dependencies)

  * Disable the HDMI port (to save some power on battery)
    * https://raspberry-projects.com/pi/pi-hardware/raspberry-pi-zero/minimising-power-consumption
    * echo "/opt/vc/bin/tvservice -o" >>  /etc/rc.local   (and correct file manually)



Decrease volume and stop playing
--------------------------------

Configure Cron (time is UTC)

```
echo " 0 22   * * *   volumio (date && /usr/local/bin/volumio volume 35) >> /home/volumio/cron.log" >> /etc/crontab
echo "30 22   * * *   volumio (date && /usr/local/bin/volumio volume 30) >> /home/volumio/cron.log" >> /etc/crontab 
echo "15 23   * * *   volumio (date && /usr/local/bin/volumio volume 20) >> /home/volumio/cron.log" >> /etc/crontab
echo " 0  0   * * *   volumio (date && /usr/local/bin/volumio stop) >> /home/volumio/cron.log" >> /etc/crontab
```


Autostart web radio
-------------------

Add playlist

```
wget https://github.com/tomikmar/tm-linux-setup/blob/master/volumio/default.json -o /data/playlist/default.json 
```

Add start script

```
export CUSTOM_VOLUMIO=/opt/volumio-scripts
mkdir $CUSTOM_VOLUMIO
cd $CUSTOM_VOLUMIO
wget https://github.com/tomikmar/tm-linux-setup/blob/master/volumio/play-default-playlist.sh
chmod +x play-default-playlist.sh
echo "@reboot volumio $CUSTOM_VOLUMIO/play-default-playlist.sh >> /home/volumio/cron.log" >> /etc/crontab
```


Notes
-----

```
sudo nmap -sS -p 22,80,111,139,445,3000,3001,3005,5000,6599,6600,7777,55669 192.168.xxx.xxx
dpkg -S `which rpcbind`
dpkg -L rpcbind
```

```
ls -l /etc/rc*.d/*smbd
ls -l /etc/rc*.d/*nmbd
ls -l /etc/rc*.d/*winbind
ls -l /etc/rc*.d/*samba-ad-dc
ls -l /etc/rc*.d/*avahi-daemon
ls -l /etc/rc*.d/*rpcbind
```

```
update-rc.d smbd remove
update-rc.d nmbd remove
update-rc.d winbind remove
update-rc.d samba-ad-dc remove

#? update-rc.d avahi-daemon remove
#? update-rc.d rpcbind remove
```

