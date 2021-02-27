#!/bin/bash

#
# Based on: https://github.com/ch007m/my-volumio-dev
#

PLAYLIST="default.json"
VOLUMIO_BASE_URL=http://localhost:3000/api/v1/commands

echo `date +"%Y-%m-%d-%H:%M:%S:"` "Starting playlist: $PLAYLIST ..."

until $(curl --silent --output /dev/null --head --fail ${VOLUMIO_BASE_URL}); do
   echo "Waiting till Volumio is up and running ..."
   sleep 5s
done

sleep 20s

echo "Volumio server is running, so we can launch our playlist ..."
curl "${VOLUMIO_BASE_URL}/?cmd=playplaylist&name=$PLAYLIST"

volumio volume 35

echo
echo `date +"%Y-%m-%d-%H:%M:%S:"` "Playlist: $PLAYLIST started."

