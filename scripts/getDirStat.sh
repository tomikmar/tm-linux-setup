#!/bin/bash

set -euo pipefail



echo \
`find . -type f | wc -l`";"\
`du -hs --block-size=MiB | cut -f1`";"`du -hs --block-size=MB | cut -f1`";"\
`du -hs --block-size=GiB | cut -f1`";"`du -hs --block-size=GB | cut -f1`

