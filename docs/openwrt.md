## OpenWrt

Tested on OpenWrt 24.10.



## System

  * Administration / SSH-Keys
  * Administration / SSH Access
    ```bash
    uci show dropbear.@dropbear[0].PasswordAuth
    uci show dropbear.@dropbear[0].RootPasswordAuth
    uci set dropbear.@dropbear[0].PasswordAuth='off'
    uci set dropbear.@dropbear[0].RootPasswordAuth='off'
    uci commit dropbear
    ```



## Services

  * Dynamic DNS -> Disable
  * Wifi Schedule



## Network

  * DHCP and DNS / Static leases



## Configure uhttpd to listen on LAN port 443 only (No IPv6)

    uci show uhttpd.main.listen_http
    uci show uhttpd.main.listen_https
    uci delete uhttpd.main.listen_http
    uci delete uhttpd.main.listen_https
    # Use only LAN interface instead of 0.0.0.0
    uci add_list uhttpd.main.listen_https='192.168.100.1:443'
    # Disable http -> https redirection
    uci set uhttpd.main.redirect_https='0'
    uci commit uhttpd
    /etc/init.d/uhttpd restart
    uci show uhttpd.main.listen_http
    uci show uhttpd.main.listen_https



## Disable IPv6

    # Disable IPv6 on LAN and WAN
    uci set network.lan.ipv6='0'
    uci set network.wan.ipv6='0'
    # (?)
    uci set network.lan.delegate="0"

    # Disable DHCPv6 and RA on LAN
    uci set dhcp.lan.dhcpv6='disabled'
    uci set dhcp.lan.ra='disabled'
    # Neighbor Discovery Protocol (?)
    uci set dhcp.lan.ndp='disabled'

    # This is also needed (see: ip -6 addr)
    uci delete network.lan.ip6assign

    # Disable IPv6 in kernel
    echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
    sysctl -p 
 
    # Disable odhcpd service
    /etc/init.d/odhcpd status    
    /etc/init.d/odhcpd disable
    /etc/init.d/odhcpd stop

    uci commit
    /etc/init.d/network restart



## Set custom DNS servers for DHCP

    uci show dhcp.lan.dhcp_option
    # 6 = DHCP option code for specifying DNS servers
    uci add_list dhcp.lan.dhcp_option="6,1.1.1.2,1.0.0.2"
    uci commit dhcp
    /etc/init.d/dnsmasq restart
    uci show dhcp.lan.dhcp_option



## Set custom DNS servers for router
    
    cat /etc/resolv.conf
    uci show dhcp.@dnsmasq[0].server
    uci show network.wan.peerdns
    cat /tmp/resolv.conf.d/resolv.conf.auto
    uci show network.wan.dns
    uci set network.wan.peerdns='0'
    uci set network.wan.dns='1.1.1.3 1.0.0.3'
    uci commit network
    /etc/init.d/network restart
    uci show network.wan



## Disable Web Services for Devices (wsdd2)

    /etc/init.d/wsdd2 status
    /etc/init.d/wsdd2 stop
    /etc/init.d/wsdd2 disable
    /etc/init.d/wsdd2 status

Ports used by wsdd2:

  * TCP 5355, 3702
  * UDP 5355, 3702



## Limit dnsmask interfaces

    # Clear previous settings
    uci show dhcp.@dnsmasq[0].interface
    uci show dhcp.@dnsmasq[0].notinterface
    uci show dhcp.@dnsmasq[0].listen_address
    uci delete dhcp.@dnsmasq[0].interface
    uci delete dhcp.@dnsmasq[0].notinterface
    uci delete dhcp.@dnsmasq[0].listen_address
    # Configure dnsmasq to listen on specific interfaces and IP
    uci add_list dhcp.@dnsmasq[0].interface='br-lan'
    uci add_list dhcp.@dnsmasq[0].notinterface='wan'
    uci add_list dhcp.@dnsmasq[0].listen_address='192.168.100.1'
    uci set dhcp.@dnsmasq[0].bind_interfaces='1'
    uci set dhcp.@dnsmasq[0].localservice='1'
    uci set dhcp.@dnsmasq[0].noresolv='0'
    uci commit dhcp
    /etc/init.d/dnsmasq restart
    /etc/init.d/dnsmasq status
    ping -c3 dns.quad9.net



## Disable ksmbd

    /etc/init.d/ksmbd status
    /etc/init.d/ksmbd stop
    /etc/init.d/ksmbd disable
    /etc/init.d/ksmbd status



## Add separated guest wifi

    # Add interface
    uci delete network.guest
    uci set network.guest=interface
    uci set network.guest.proto='static'
    uci set network.guest.ipaddr='192.168.103.1'
    uci set network.guest.netmask='255.255.255.0'

    # Configure DHCP
    uci delete dhcp.guest
    uci set dhcp.guest=dhcp
    uci set dhcp.guest.interface='guest'
    uci set dhcp.guest.start='100'
    uci set dhcp.guest.limit='30'
    uci set dhcp.guest.leasetime='4h'
    uci add_list dhcp.@dnsmasq[0].interface='guest'
    uci add_list dhcp.@dnsmasq[0].listen_address='192.168.103.1'

    # Add wifi interface
    uci delete wireless.guest_wifi
    uci set wireless.guest_wifi=wifi-iface
    uci set wireless.guest_wifi.device='radio1'
    uci set wireless.guest_wifi.network='guest'
    uci set wireless.guest_wifi.mode='ap'
    # ! UPDATE !
    uci set wireless.guest_wifi.ssid='guest-wifi'
    uci set wireless.guest_wifi.encryption='psk2'
    # ! UPDATE !
    uci set wireless.guest_wifi.key='****************'
    uci set wireless.guest_wifi.isolate='1'

    # Set firewall
    uci delete firewall.guest_zone
    uci set firewall.guest_zone='zone'
    uci set firewall.guest_zone.name='guest'
    uci set firewall.guest_zone.network='guest'
    uci set firewall.guest_zone.input='REJECT'
    uci set firewall.guest_zone.output='ACCEPT'
    uci set firewall.guest_zone.forward='REJECT'

    uci delete firewall.guest_to_wan
    uci set firewall.guest_to_wan='forwarding'
    uci set firewall.guest_to_wan.src='guest'
    uci set firewall.guest_to_wan.dest='wan'

    uci delete firewall.guest_dhcp_rule
    uci set firewall.guest_dhcp_rule='rule'
    uci set firewall.guest_dhcp_rule.name='Guest-DHCP'
    uci set firewall.guest_dhcp_rule.src='guest'
    uci set firewall.guest_dhcp_rule.proto='udp'
    uci set firewall.guest_dhcp_rule.dest_port='67-68'
    uci set firewall.guest_dhcp_rule.target='ACCEPT'

    uci delete firewall.guest_dns_rule
    uci set firewall.guest_dns_rule='rule'
    uci set firewall.guest_dns_rule.name='Guest-DNS'
    uci set firewall.guest_dns_rule.src='guest'
    uci set firewall.guest_dns_rule.proto=''
    uci add_list firewall.guest_dns_rule.proto='udp'
    uci add_list firewall.guest_dns_rule.proto='tcp'
    uci set firewall.guest_dns_rule.dest_port='53'
    uci set firewall.guest_dns_rule.target='ACCEPT'

    # Restart services
    uci commit
    wifi reload
    /etc/init.d/network restart
    /etc/init.d/firewall restart
    /etc/init.d/dnsmasq restart



## Tests

    nslookup dns.quad9.net
    ping -c3 dns.quad9.net
    netstat -antup



## Recovery

    ip link show
    ip addr add 192.168.100.111/24 dev <INTERFACE>
    ping 192.168.100.1
    # Remove static IP after switching back to a wifi connection
    ip addr del 192.168.100.111/24 dev <INTERFACE>

