#!/bin/bash

#
# Based on: https://github.com/ch007m/my-volumio-dev
#

source common.sh

PLAYLIST_MORNING="default-morning.json"
PLAYLIST_AFTERNOON="default-morning.json"
PLAYLIST_EVENING="default-evening.json"
VOLUMIO_BASE_URL=http://localhost:3000/api/v1/commands


until $(curl --silent --output /dev/null --head --fail ${VOLUMIO_BASE_URL}); do
   log "Waiting till Volumio is up and running ..."
   sleep 10s
   espeak -a 200 "Just a moment." --stdout | aplay -Dhw:1,0
done

sleep 10s
espeak -a 200 "Almost ready." --stdout | aplay -Dhw:1,0
sleep 10s

log "Volumio server is running, so we can launch our playlist ..."
espeak -a 200 "Volumio is running. Starting playlist." --stdout | aplay -Dhw:1,0


HOUR=`date +%H`
if [ $HOUR -lt 11 ]; then
  log "Starting morning playlist $PLAYLIST_MORNING ..."
  volumio volume 40
  curl "${VOLUMIO_BASE_URL}/?cmd=playplaylist&name=$PLAYLIST_MORNING"
elif [ $HOUR -lt 19 ]; then
  log "Starting afternoon playlist $PLAYLIST_MORNING ..."
  volumio volume 40
  curl "${VOLUMIO_BASE_URL}/?cmd=playplaylist&name=$PLAYLIST_MORNING"
else
  log "Starting evening playlist $PLAYLIST_AFTERNOON ..."
  volumio volume 30
  curl "${VOLUMIO_BASE_URL}/?cmd=playplaylist&name=$PLAYLIST_AFTERNOON"
fi
echo

log "Playlist started."
[ -f /opt/volumio-scripts/illuminate.sh ] && /opt/volumio-scripts/illuminate.sh 5

