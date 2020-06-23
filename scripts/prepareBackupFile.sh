#!/bin/bash

[ $# -eq 0 ] && { echo "Please provide directory to backup as a first argument."; exit 1; }
DIR_TO_BACKUP=$1
[ ! -e $DIR_TO_BACKUP ] && { echo "Directory \"$DIR_TO_BACKUP\" does not exist."; exit 1; }
[ ! -d $DIR_TO_BACKUP ] && { echo "\"$DIR_TO_BACKUP\" is NOT a directory."; exit 1; }

echo "Checking is required tools are installed ..."
command -v createContentInfo.sh  || { echo "Please add \"createContentInfo.sh\" script to path first."; exit 2; }
command -v gpg || { echo "Please install \"gpg\" first."; exit 2; }

echo "Generating content summary ..."
cd $DIR_TO_BACKUP
bash createContentInfo.sh
cd ..

