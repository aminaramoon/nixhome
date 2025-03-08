#!/bin/bash
#
# set ultrawide monitor to three screens
#
#

has_ultrawide=$(xrandr --listactivemonitors | grep 5120)
has_hidpi=$(xrandr --listactivemonitors | grep 3456)
if [ ! -z "$has_ultrawide" ]; then
	# turn off built-in monitor
	xrandr --output eDP-1 --off
	# create virtual monitors
	xrandr --setmonitor e-DP-1-l 1280/300x1440/340+0+0 none
	xrandr --setmonitor e-DP-1-c 2560/600x1440/340+1280+0 DP-1
	xrandr --setmonitor e-DP-1-r 1280/300x1440/340+3840+0 none
	has_virtual="yes"
elif [[ ! -z "$has_hidpi" ]]; then
	xrandr --dpi 220
fi

# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
has_virtual=$(xrandr --listactivemonitors | grep e-DP-1-c)
if [ ! -z "$has_virtual" ]; then
	echo "---" | tee -a /tmp/centerbar.log /tmp/leftbar.log /tmp/rightbar.log
	# start polybar
	polybar left --config=$HOME/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/leftbar.log &
	disown
	polybar center --config=$HOME/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/centerbar.log &
	disown
	polybar right --config=$HOME/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/rightbar.log &
	disown
else
	echo "---" | tee -a /tmp/centerbar.log
	polybar center --config=$HOME/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/centerbar.log &
	disown
fi
