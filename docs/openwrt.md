## System

  * Administration / SSH Access



## Services

  * Dynamic DNS -> Disable
  * Wifi Schedule



## Disable listening on port 80 (also IPv6)

    uci show uhttpd.main.listen_http
    uci delete uhttpd.main.listen_http='0.0.0.0:80'
    uci delete uhttpd.main.listen_http='[::]:80'
    uci delete uhttpd.main.listen_http='[::]:443'
    uci commit uhttpd
    /etc/init.d/uhttpd restart
    uci show uhttpd.main.listen_http

