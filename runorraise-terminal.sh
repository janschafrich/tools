#!/bin/bash

pidof gnome-terminal-server

if [[ $? = 1 ]];    # if previous command returned 1
# if app is not running, launch a new instance
then
    gnome-terminal
else
# if app is already running focus the existing instance
# uses this: https://extensions.gnome.org/extension/5021/activate-window-by-title/
    busctl --user call \
    org.gnome.Shell \
    /de/lucaswerkmeister/ActivateWindowByTitle \
    de.lucaswerkmeister.ActivateWindowByTitle \
    activateByWmClass \
    s 'gnome-terminal-server' 
fi

