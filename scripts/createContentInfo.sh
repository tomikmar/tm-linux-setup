#!/bin/bash

CREATION_TIME=`date +"%Y-%m-%d-%H%M"`
CONTENT_FILE=content.${CREATION_TIME}.md5

echo "# Created        :  ${CREATION_TIME}"           | tee ./${CONTENT_FILE}
echo "# Base dir       : " `pwd`                      | tee -a ./${CONTENT_FILE}
echo "# Files and dirs : " `(find . | wc -l)`         | tee -a ./${CONTENT_FILE}
echo "# Files only     : " `(find . -type f | wc -l)` | tee -a ./${CONTENT_FILE}
echo "# Dirs only      : " `(find . -type d | wc -l)` | tee -a ./${CONTENT_FILE}
echo "# Space used (h) : " `(du -sh)`                 | tee -a ./${CONTENT_FILE}
echo "# Space used (b) : " `(du -s)`                  | tee -a ./${CONTENT_FILE}
echo "# Command        : " \
   "find . -type f ! -name content\*.md5 -print0 | sort -z | xargs -0 md5sum -b" | tee -a ./${CONTENT_FILE}
echo "# Script version : 1.0.1 (2020.06.01) "         | tee -a ./${CONTENT_FILE}
echo "#"                                              | tee -a ./${CONTENT_FILE}

find . -type f ! -name content\*.md5 -print0 | sort -z | xargs -0 md5sum -b | tee -a ./${CONTENT_FILE}

