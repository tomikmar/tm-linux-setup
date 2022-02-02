Ctrl+C, Ctrl+V
--------------
    stty -a
    stty intr ^J



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



pdf
---
    pdfunite *.pdf 2018.pdf



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

