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

## COLORS
xrdb -load $HOME/.Xresources

## BACKGROUND
hsetroot -solid "#000000"

## CURSOR
xsetroot -cursor_name left_ptr

## NOTIFICATIONS
dunst > /dev/null 2>&1 &

## COMPOSITOR
picom --backend glx --vsync --unredir-if-possible  --glx-no-stencil --glx-no-rebind-pixmap --use-damage &

## URXVT
urxvtd -q -f -o

## WM
sxhkd &
exec dbus-launch bspwm
