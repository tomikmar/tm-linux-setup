#!/bin/bash

# Requires:
#    apt install inotify-tools

set -euo pipefail

SCRIPT_VERSION="1.0.0 (2025.11.15)"

LOG_FILE="$HOME/.file-access.log"

WATCH_DIRS=(
  "$HOME/Desktop"
  "$HOME/Documents"
  "$HOME/Music"
  "$HOME/Pictures"
  "$HOME/Projects"
  "$HOME/Videos"
)

ARGS=()
for dir in "${WATCH_DIRS[@]}"; do
    [[ -d "$dir" ]] && ARGS+=(-r "$dir")
done

echo "*********************************************************************" | tee -a "$LOG_FILE"
echo "Monitoring : ${ARGS[@]}" | tee -a "$LOG_FILE"
echo "Log file   : $LOG_FILE" | tee -a "$LOG_FILE"
echo "Script ver : $SCRIPT_VERSION" | tee -a "$LOG_FILE"

inotifywait -m "${ARGS[@]}" \
       	-e create \
	-e modify \
	-e move \
	-e delete \
	--format '%T %w%f %e' --timefmt '%Y-%m-%d %H:%M:%S' | tee -a "$LOG_FILE"

