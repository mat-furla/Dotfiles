#!/bin/bash
handler=$(dirname $0)/handler
[ ! -f "$handler" ] && echo "invalid path to handler script" && exit 1

case "$(printf "Bookmarks\\nGoogle\\nYoutube" | rofi -show -dmenu -p menu -theme themes/bookmarksmenu.rasi 2>/dev/null)" in 
    "Google") API=google ;;
    "Youtube") API=youtube ;;
    "Bookmarks") bookmarksmenu ;;
    *) echo "unrecognized API" && exit 1 ;;
esac

logfile="$(dirname $handler)/logfile.tmp"
printf "$API" > "$logfile"
rofi -modi blocks -show blocks -blocks-wrap $handler -theme themes/bookmarksmenu.rasi -display-blocks "Search" 2>/dev/null
[ -f $logfile ] && selection="$(cat "$logfile")" || exit 0

case "$API" in 
    "google")  chromium "https://www.google.com/search?q=$selection" ;;
    "youtube") playermenu.sh -r "$selection" ;;
esac

exit 0
