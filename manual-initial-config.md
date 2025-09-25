### Install

    # Tools
    sudo apt install vim colordiff mc pv jq httpie whois hexdiff xclip 
    # Compression
    sudo apt install p7zip-full pigz
    # Hex editor
    sudo apt install wxhexeditor
    # Amator radio soft
    sudo apt install viking gpxviewer gpredict
    # File explorer
    sudo apt install xfe
    # Converters
    sudo apt install dos2unix
    # Network tools
    sudo apt install net-tools hping3 nmap
    # Password manager
    sudo apt install keepassxc
    # Pictures
    apt install exiftool
    # Dev tools
    sudo apt install git gitk openjdk-??-jdk



### Select vim as default editor

    sudo update-alternatives --config editor



### Correct strange sort order for underscore

    Change /usr/share/i18n/locales/iso14651_t1_common
        From : <U005F> IGNORE;IGNORE;IGNORE;<U005F> % LOW LINE
        To   : <U005F> <RES-1>;IGNORE;IGNORE;<U005F> % LOW LINE
    locale-gen
    More info:
        http://svmiller.com/blog/2019/07/notes-to-self-new-linux-installation-r-ubuntu/
        https://unix.stackexchange.com/a/361021/456093



### Correct locale
    Change /usr/share/i18n/locales/en_GB
        mon_decimal_point       "."
        mon_thousands_sep       "<U202F>"

        decimal_point           "."
        thousands_sep           "<U202F>"
    
        d_t_fmt     "%A, %Y.%m.%_d %T %Z"
        d_fmt       "%Y.%m.%_d"
        t_fmt       "%T"
        am_pm       "";""
        t_fmt_ampm  ""
        date_fmt    "%A, %Y.%m.%_d %T %Z"
    locale-gen



### Verify locale

    $ locale
    LANG=en_GB.UTF-8
    LANGUAGE=en_GB:en
    LC_CTYPE="en_GB.UTF-8"
    LC_NUMERIC=en_GB.UTF-8
    LC_TIME=en_GB.UTF-8
    LC_COLLATE="en_GB.UTF-8"
    LC_MONETARY=en_GB.UTF-8
    LC_MESSAGES="en_GB.UTF-8"
    LC_PAPER=en_GB.UTF-8
    LC_NAME=en_GB.UTF-8
    LC_ADDRESS=en_GB.UTF-8
    LC_TELEPHONE=en_GB.UTF-8
    LC_MEASUREMENT=en_GB.UTF-8
    LC_IDENTIFICATION=en_GB.UTF-8
    LC_ALL=



### Install additional soft

  * IntelliJ
  * Beyond Compare
  * Visual Studio Code



### Uninstall

  * apt list --installed | grep thunderbird
  * apt-get purge thunderbird*



### Issues

  * gqrx-sdr

