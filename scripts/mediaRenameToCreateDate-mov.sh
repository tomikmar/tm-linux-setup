#!/bin/bash

set -euo pipefail


exiftool -fileOrder CreationDate -if 'not $XMP-xmpMM:PreservedFileName' '-XMP-xmpMM:PreservedFileName<$FileName' -overwrite_original -preserve -extension MOV *.MOV

exiftool -fileOrder CreationDate '-FileName<CreationDate' -d '%Y-%m-%d_%H%M%S%%-3c.%%le' -extension MOV *.MOV

