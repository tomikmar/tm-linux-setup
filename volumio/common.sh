
log() {
	echo `date +"%Y-%m-%d-%H:%M:%S:"` "$1" 
}

say() {
	espeak -a 200 "$1" --stdout | aplay -Dhw:1,0
}

logAndSay() {
	log "$1"
	say "$1"
}

