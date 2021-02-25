sudo nmap -sS -p 80,111,139,445,3000,3001,3005,5000,6599,6600,7777,55669 192.168.100.146

dpkg -S `which rpcbind`
dpkg -L rpcbind

ls -l /etc/rc*.d/*smbd
ls -l /etc/rc*.d/*nmbd
ls -l /etc/rc*.d/*winbind
ls -l /etc/rc*.d/*samba-ad-dc
ls -l /etc/rc*.d/*avahi-daemon
ls -l /etc/rc*.d/*rpcbind

update-rc.d smbd remove
update-rc.d nmbd remove
update-rc.d winbind remove
update-rc.d samba-ad-dc remove

update-rc.d avahi-daemon remove
update-rc.d rpcbind remove


https://raspberry-projects.com/pi/pi-hardware/raspberry-pi-zero/minimising-power-consumption
nano /etc/rc.local
    # Disable the HDMI port (to save power)
    /usr/bin/tvservice -o

