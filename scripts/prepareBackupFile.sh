#!/bin/bash


# Key generation
#   gpg [--expert] --full-generate-key
#   gpg --list-keys
#   gpg --list-secret-keys
# Key export
#   gpg --export -a "backup-test" > backup-test-public.key
#   gpg --export-secret-key -a "backup-test" > backup-test-private.key
# Key import
#   gpg --allow-secret-key-import --import backup-test-private.key
#   gpg --import backup-test-public.key


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


#gpg -e -r "backup-test" myfile.txt
#gpg -d file.txt.gpg > file.txt

