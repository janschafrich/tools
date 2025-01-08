#!/bin/bash
# if calculator is not running, launch a new instance
# if calculator is already running focus the existing instance

pidof firefox

if [[ $? = 1 ]];    # if previous command returned 1
then
    firefox
else
# uses this: https://extensions.gnome.org/extension/5021/activate-window-by-title/
    busctl --user call \
    org.gnome.Shell \
    /de/lucaswerkmeister/ActivateWindowByTitle \
    de.lucaswerkmeister.ActivateWindowByTitle \
    activateBySubstring \
    s 'Firefox'

fi
