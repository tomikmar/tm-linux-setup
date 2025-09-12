Ctrl+C, Ctrl+V
--------------

    stty -a
    stty intr ^J



Pictures - exiftool
-------------------

    # Show metadata
    exiftool img1.jpg 
 
    # Remove metadata
    exiftool -all= img1.jpg 
    
    # Add "PreservedFileName" tag with original file name if tag doesn't exist
    #   - preserve modification date
    exiftool -fileOrder DateTimeOriginal -if 'not $XMP-xmpMM:PreservedFileName' '-XMP-xmpMM:PreservedFileName<$FileName' -overwrite_original -preserve -extension jpg *.jpg

    # Batch rename by capture date
    #   - add additional number (e.g. -001) if file with new name already exists
    #   - write extension in lowercase
    exiftool -fileOrder DateTimeOriginal '-FileName<DateTimeOriginal' -d '%Y-%m-%d_%H%M%S%%-3c.%%le' -extension jpg *.jpg



Pictures - ImageMagick
----------------------

    convert -resize 25% img1.jpg img2.jpg
    identify -verbose m.jpg



Video
-----

    ffmpeg -i infile -vf "scale=iw/2:ih/2" outfile
    ffmpeg -i infile -vf "scale=iw/2:ih/2" -b:v 150k outfile
    ffmpeg -i infile -vf "scale=iw/4:ih/4" -b:v 140k -b:a 64k outfile



Memory
------

    free -g / free -m
    top -o %MEM
    top -> f -> up/down -> s -> q  (sort by something)
    top -> e/E (units)



X
-

    xdg-open https://github.com
    xsel



pdf - merge and split
---------------------

    pdfunite *.pdf 2018.pdf
    qpdf input.pdf --pages . 1-13 -- output.pdf



pdf - decrypt and save attachments
----------------------------------

    read -s -p "Password: " PASS
    pdfinfo -upw $PASS TwojeDokumenty.pdf
    qpdf --show-encryption --password="$PASS" TwojeDokumenty.pdf
    qpdf --decrypt --password="$PASS" TwojeDokumenty.pdf TwojeDokumenty-decrypted.pdf
    pdfdetach -list TwojeDokumenty-decrypted.pdf
    pdfdetach -saveall TwojeDokumenty-decrypted.pdf



TTS - festival
--------------

    apt install festival festvox-en1 festvox-us1 festvox-us2 festvox-us3 festvox-us-slt-hts festvox-kdlpc16k
    echo "Hello world" | festival --tts
    echo '(SayText "Hello World")' | festival --pipe
    festival --tts my-text.txt

    stty intr ^C  (go back to default ctrl+c handling, without this festival doesn't work properly)
    festival
        help
        (voice.list)
        (tts "text.txt" nil)
        (voice_en1_mbrola)
        (voice_cmu_us_slt_arctic_hts)



TTS - espeak-ng
---------------

    apt install espeak-ng
    espeak-ng --voices=en
    espeak-ng -s 150 -f text.txt
    espeak-ng -s 140 -f text.txt -v us-mbrola-1
    espeak-ng "Hello world"
    echo "Hello world" | espeak-ng



TTS - pico
----------

    apt install libttspico-utils
    pico2wave -w a.wav "Hello world" 
    aplay a.wav
    cat text.txt | pico2wave -w a.wav 
    aplay a.wav



Prepare flash drive
-------------------

    lsblk -f
    dmesg
    hexdump -C /dev/MY-DISK
    fdisk -l
    fdisk /dev/MY-DISK
	ntfs,exfat -> 7 HPFS/NTFS/exFAT
    mkfs.exfat /dev/MY-DISK-PARTITION



Apk certificate
---------------

    keytool -printcert -jarfile SOME-APP.apk
    java -jar apksigner.jar verify -verbose --print-certs SOME-APP.apk



Network info
------------

    nmcli device status
    nmcli device show <device>



GPG
---

    gpg --list-keys --with-subkey-fingerprints --with-keygrip
    gpg --list-secret-keys --with-subkey-fingerprints --with-keygrip
    gpg --keyserver hkp://keyserver.ubuntu.com --search-key cdimage@ubuntu.com
    gpg --sign-key <keyId>

