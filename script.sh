#!/bin/bash

INTERVAL=10
LOG_FILE="monitor.log"

if ! command -v free >/dev/null 2>&1; then
	echo "Error: команда free не найдена"
	exit 1
fi

if ! command -v df >/dev/null 2>&1; then
	echo "Error: команда df не найдена"
	exit 1
fi

if ! command -v uptime >/dev/null 2>&1; then
	echo "Error: команда uptime не найдена"
	exit 1
fi

if ! touch "$LOG_FILE" 2>/dev/null; then
	echo "Error: невозможно создать файл $LOG_FILE"
	exit
fi

while true
do
	echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOG_FILE"

	echo "=== MEMORY ===" >> "$LOG_FILE"
	free -h >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	echo "=== DISK ===" >> "$LOG_FILE"
	df -h >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	echo "=== UPTIME ===" >> "$LOG_FILE"
	uptime >> "$LOG_FILE"
	echo "" >> "$LOG_FILE"

	sleep "$INTERVAL"
done
