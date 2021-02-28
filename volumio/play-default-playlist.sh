#!/bin/bash

#
# Based on: https://github.com/ch007m/my-volumio-dev
#

PLAYLIST="default.json"
VOLUMIO_BASE_URL=http://localhost:3000/api/v1/commands

echo `date +"%Y-%m-%d-%H:%M:%S:"` "Starting playlist: $PLAYLIST ..."

until $(curl --silent --output /dev/null --head --fail ${VOLUMIO_BASE_URL}); do
   echo "Waiting till Volumio is up and running ..."
   sleep 10s
   espeak -a 200 "Just a moment." --stdout | aplay -Dhw:1,0
done

sleep 10s
espeak -a 200 "Almost ready." --stdout | aplay -Dhw:1,0
sleep 10s

echo "Volumio server is running, so we can launch our playlist ..."
espeak -a 200 "Volumio is running. Starting playlist." --stdout | aplay -Dhw:1,0
curl "${VOLUMIO_BASE_URL}/?cmd=playplaylist&name=$PLAYLIST"

volumio volume 35

echo
echo `date +"%Y-%m-%d-%H:%M:%S:"` "Playlist: $PLAYLIST started."

