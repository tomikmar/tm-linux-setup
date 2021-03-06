#!/bin/bash

# Script version
VERSION="1.0.1 (2020.11.30)"


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
# Decryption examples
#   gpg --decrypt file.txt.gpg > file.txt
#   gpg --decrypt my-dir.tar.gz.gpg | tar xvz
# Show algorithms
#   gpg --version
#

[ $# -eq 0 ] && { echo "Please provide directory to backup as the first argument."; exit 1; }
DIR_TO_BACKUP=$1
[ $# -eq 1 ] && { echo "Please provide gpg recipent as the second argument."; exit 1; }
RECIPIENT=$2
[ ! -e $DIR_TO_BACKUP ] && { echo "Directory \"$DIR_TO_BACKUP\" does not exist."; exit 1; }
[ ! -d $DIR_TO_BACKUP ] && { echo "\"$DIR_TO_BACKUP\" is NOT a directory."; exit 1; }

echo "Checking is required tools are installed ..."
command -v createContentInfo.sh  || { echo "Please add \"createContentInfo.sh\" script to path first."; exit 2; }
command -v gpg || { echo "Please install \"gpg\" first."; exit 2; }

echo "Checking if public key is available for recipient \"$RECIPIENT\" ..."
gpg --list-key $RECIPIENT || exit 3


echo "[`date +"%Y-%m-%d-%H:%M:%S"`] Preparing backup file (script version: $VERSION) ..."

echo "[`date +"%Y-%m-%d-%H:%M:%S"`] Generating content summary ..."
cd $DIR_TO_BACKUP
bash createContentInfo.sh
cd ..

echo "[`date +"%Y-%m-%d-%H:%M:%S"`] Generating archive ..."
CREATION_TIME=`date +"%Y-%m-%d-%H%M%S"`
ARCHIVE_FILE=$DIR_TO_BACKUP-$CREATION_TIME.tar.gz
tar cvzf $ARCHIVE_FILE $DIR_TO_BACKUP
ls -l $ARCHIVE_FILE

echo "[`date +"%Y-%m-%d-%H:%M:%S"`] Encrypting archive (first pass) ..."
gpg --encrypt --cipher-algo AES256 --recipient "$RECIPIENT" $ARCHIVE_FILE
rm $ARCHIVE_FILE
echo "[`date +"%Y-%m-%d-%H:%M:%S"`] Encrypting archive (second pass) ..."
gpg --encrypt --cipher-algo CAST5 --recipient "$RECIPIENT" $ARCHIVE_FILE.gpg
rm $ARCHIVE_FILE.gpg

echo "[`date +"%Y-%m-%d-%H:%M:%S"`] All done."

