#!/bin/bash

set -euo pipefail



exiftool -fileOrder MediaCreateDate -if 'not $XMP-xmpMM:PreservedFileName' '-XMP-xmpMM:PreservedFileName<$FileName' -overwrite_original -preserve -extension mp4 -ignoreCase .

# MediaCreateDate - timezone missing (inconsitent with pictures)
#exiftool -fileOrder MediaCreateDate '-FileName<MediaCreateDate' -d '%Y-%m-%d_%H%M%S%%-3c.%%le' -extension mp4 -ignoreCase .

# Only for my case - verify FileModifyDate content first !
#exiftool -fileOrder MediaCreateDate '-FileName<FileModifyDate' -d '%Y-%m-%d_%H%M%S%%-3c.%%le' -extension mp4 -ignoreCase .

