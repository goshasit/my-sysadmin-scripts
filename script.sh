#!/bin/bash

INTERVAL=10
LOG_FILE="monitor.log"

while true
do
	echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOG_FILE"

	echo "=== MEMORY ===" >> "$LOG_FILE"
	free -h >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	echo "=== DISK ===" >> "$LOG_FILE"
	df -h >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	echo "=== UPTIME ==="
	uptime >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	sleep "$INTERVAL"
done
