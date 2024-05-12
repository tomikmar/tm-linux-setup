#!/usr/bin/env bash
#
# Version: 1.0.2 (2024.05.12)
#

set -e

USB_DEVICE=/media/path/to-usb
NUMBER_OF_FILES_TO_COPY=64


RANDOM_FILE=./tmp.remove.me
TEST_DIRECTORY=usb-test-1
mkdir "$USB_DEVICE/$TEST_DIRECTORY"

echo -e "Start time:" `date +"%Y-%m-%d %T %Z"` "\n"

echo "Usb info ******************************************************************"
lsusb -t
echo

echo "Creating test file ... ****************************************************"
dd if=/dev/urandom of=$RANDOM_FILE bs=1M count=1000
echo


n=1
while [ $n -le $NUMBER_OF_FILES_TO_COPY ]; do
    echo -e "\nStarting round $n (" `date +"%Y-%m-%d %T %Z"` ") *****************" 
    time cp -v $RANDOM_FILE "$USB_DEVICE/$TEST_DIRECTORY/tmp_$n.remove.me"
    #sync
    (( n++ ))
done


echo "Sync ... *******************************************************************"
echo -e "Sync start time:" `date +"%Y-%m-%d %T %Z"` 
sync
echo -e "Sync end time:" `date +"%Y-%m-%d %T %Z"`


echo -e "\nStop time:" `date +"%Y-%m-%d %T %Z"` "\n"

