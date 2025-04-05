#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <playlist_uuid>"
  echo "You must provide a playlist UUID as a parameter."
  exit 1
fi

PLAYLIST_UUID=$1

if ! [[ $PLAYLIST_UUID =~ ^[0-9a-fA-F\-]{36}$ ]]; then
  echo "Error: The provided UUID is invalid. Make sure it is in the UUID format (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)."
  exit 1
fi


curl "https://embed.tidal.com/playlists/$PLAYLIST_UUID" | \
    sed -n 's/<span[^>]*slot="\(artist\|title\)"[^>]*>\(.*\)<\/span>/\2/p'| \
    sed -E 's/<a[^>]*>([^<]*)<\/a>/\1/g' | \
    sed 's/^ *//;s/ *$//' | sed 's/$/;/' | \
    awk 'NR%2{printf "%s ", $0; next} {print $0}'


