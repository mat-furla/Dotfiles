#!/bin/sh

# menu (dmenu, rofi, fzf, etc.)
menu_cmd='rofi -dmenu -i -p favs -theme themes/bookmarksmenu.rasi'

# browser
browser_cmd='chromium'

# bookmarks json file
bookmarks=~/.config/chromium/Default/Bookmarks

# parse bookmarks, show menu and open selected bookmark in browser
jq -r '.roots.bookmark_bar.children[], .roots.synced.children[] | .name, .url' $bookmarks \
| paste -d "$"  - - | column -t -s$ | $menu_cmd \
| grep -Eo '(http|https)://.*' | xargs -r -I {} $browser_cmd {}