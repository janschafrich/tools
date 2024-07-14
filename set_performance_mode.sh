#!/bin/bash
# corresponding service file: /etc/systemd/system/set_performance_mode.service

is_on_battery(){
	local status=$(cat /sys/class/power_supply/AC*/online)

	if [[ "$status" -eq 0 ]]; then
		return 0	# on battery
	else
		return 1	# on AC power
	fi
}

if [ is_on_battery ]; then
	echo "On battery power, switching to performance mode 'battery'."
	system76-power profile battery

else
	echo "On AC Power, switching to performance mode 'balanced.'"
	system76-power profile balanced
fi
