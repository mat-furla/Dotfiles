#!/bin/sh

# ▒██   ██▒ ██▓ ███▄    █  ██▓▄▄▄█████▓ 
# ▒▒ █ █ ▒░▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒ 
# ░░  █   ░▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░ 
#  ░ █ █ ▒ ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░  
# ▒██▒ ▒██▒░██░▒██░   ▓██░░██░  ▒██▒ ░  
# ▒▒ ░ ░▓ ░░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    
# ░░   ░▒ ░ ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     
#  ░    ░   ▒ ░   ░   ░ ░  ▒ ░  ░       
#  ░    ░   ░           ░  ░            

## DBUS
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  eval `dbus-launch --sh-syntax --exit-with-session`
  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

## XRESOURCES
## xrdb -merge $HOME/.Xresources

## BACKGROUND
hsetroot -cover "$HOME/Desktop/dracula.jpg"

## CURSOR
xsetroot -cursor_name left_ptr

## BACKLIGHT
light -S 2

## COMPOSITOR
picom --experimental-backends -b --config $HOME/.config/picom/picom.conf &

## WM
sxhkd &
exec dbus-launch bspwm