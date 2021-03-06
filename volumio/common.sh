
log() {
	echo `date +"%Y-%m-%d-%H:%M:%S:"` "$1" 
}

say() {
    if [ -x "$(command -v espeak)" ]; then
        espeak -a 200 "$1" --stdout | aplay -Dhw:1,0
    else
        echo "Command espeak not installed. Ignoring message: $1"
    fi
}

logAndSay() {
    log "$1"
    say "$1"
}

