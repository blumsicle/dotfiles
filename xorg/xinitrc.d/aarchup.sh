#!/bin/sh
#
# ~/.xinitrc.d/aarchup.sh
#
# pacman notifier -- to allow sudo pacman -Sy to run without a password:
#   in visudo: %wheel ALL=(ALL) NOPASSWD: /usr/bin/pacman -Sy
if [ -z "$(pgrep 'aarchup$')" ];then
	/usr/bin/aarchup --loop-time 60 --icon /usr/share/aarchup/archlogo.svg --aur &
else
    kill -9 $(pgrep 'aarchup$')
    /usr/bin/aarchup --loop-time 60 --icon /usr/share/aarchup/archlogo.svg --aur &
fi
