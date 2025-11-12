#!/bin/bash

set -euo pipefail


exiftool -fileOrder DateTimeOriginal -if 'not $XMP-xmpMM:PreservedFileName' '-XMP-xmpMM:PreservedFileName<$FileName' -overwrite_original -preserve -extension HEIC *.HEIC

exiftool -fileOrder DateTimeOriginal '-FileName<DateTimeOriginal' -d '%Y-%m-%d_%H%M%S%%-3c.%%le' -extension HEIC *.HEIC

