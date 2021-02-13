## ALIASES
alias sd='sudo'
alias ls='nnn -d'
alias n='nnn -d'
alias N='sudo -E nnn -d'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias chx='chmod +x'
alias rb='sudo shutdown -r now'
alias p='sudo shutdown -h now'

alias q='apt search'
alias i='sudo apt install'
alias u='sudo apt update && sudo apt upgrade'
alias r='sudo apt purge'
alias c='sudo apt autoremove'

alias gs='git status'
alias ga='git add --all'
alias gl='git pull'
alias gc='git commit -m'
alias gp='git push --set-upstream origin master'

alias xload='xrdb -load $HOME/.Xresources'


## EXPORT
set fish_greeting

set PATH $HOME/.local/bin $PATH
set PATH $HOME/.yarn/bin $PATH

set -gx NNN_BMS 'h:/home/matheus;d:/home/matheus/Downloads/;D:/home/matheus/Dev'
set -gx NNN_OPENER $HOME/.config/nnn/plugins/nuke
set -gx NNN_PLUG 'm:-_|mousepad $nnn;c:-_|code $nnn;x:-_|xarchiver $nnn'
set -gx NNN_TRASH 1

set -gx QT_QPA_PLATFORMTHEME gtk3
set -gx _JAVA_AWT_WM_NONREPARENTING 1

set -gx BROWSER brave-browser
set -gx TERM rxvt-unicode-256color
set -gx VISUAL mousepad
set -gx EDITOR nano
