## OpenWrt

Tested on OpenWrt 24.10.



## System

  * Administration / SSH Access



## Services

  * Dynamic DNS -> Disable
  * Wifi Schedule



## Disable listening on port 80 (also IPv6)

    uci show uhttpd.main.listen_http
    uci show uhttpd.main.listen_https
    uci delete uhttpd.main.listen_http
    uci delete uhttpd.main.listen_https
    uci add_list uhttpd.main.listen_https='0.0.0.0:443'
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

    # Disable DHCPv6 and RA on LAN
    uci set dhcp.lan.dhcpv6='disabled'
    uci set dhcp.lan.ra='disabled'

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

