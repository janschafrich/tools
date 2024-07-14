#!/bin/bash

# Define the file paths
start_threshold_file="/sys/class/power_supply/BAT0/charge_start_threshold"
stop_threshold_file="/sys/class/power_supply/BAT0/charge_stop_threshold"

# Read the values from the files
OLD_START=$(<$start_threshold_file)
OLD_STOP=$(<$stop_threshold_file)

NEW_START=$1
NEW_STOP=$2

if [[ $NEW_STOP -ge $OLD_STOP ]]; then
	CHANGE="Increasing"
	echo $NEW_STOP > $stop_threshold_file
	echo $NEW_START > $start_threshold_file
else 
	CHANGE="Decreasing"
	echo $NEW_START > $start_threshold_file
	echo $NEW_STOP > $stop_threshold_file
fi

CONFIRM_START=$(<$start_threshold_file)
CONFIRM_STOP=$(<$stop_threshold_file)
echo "$CHANGE (start,stop): ($OLD_START,$OLD_STOP) -> ($CONFIRM_START,$CONFIRM_STOP)"
