## ABREVIATIONS
abbr sd 'sudo'
abbr ls 'n'
abbr N 'sudo -E nnn'
abbr dl 'cd $HOME/Downloads'
abbr doc 'cd $HOME/Documents'
abbr dev 'cd $HOME/Dev'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr ..... 'cd ../../../..'
abbr chx 'chmod +x'
abbr rb 'sudo shutdown -r now'
abbr p 'sudo shutdown -h now'

abbr q 'apt search'
abbr i 'sudo apt install'
abbr u 'sudo apt update && sudo apt upgrade'
abbr r 'sudo apt purge'
abbr c 'sudo apt autoremove'

abbr gs 'git status'
abbr ga 'git add --all'
abbr gl 'git pull'
abbr gc 'git commit -m'
abbr gp 'git push --set-upstream origin master'

abbr xload 'xrdb -load $HOME/.Xresources'


## EXPORT
set fish_greeting

set PATH $HOME/.local/bin $PATH
set PATH $HOME/.yarn/bin $PATH

set -gx NNN_BMS 'd:/home/matheus/Downloads/;D:/home/matheus/Dev'
set -gx NNN_OPENER $HOME/.config/nnn/plugins/nuke
set -gx NNN_FCOLORS '02030b020005060f0d0b0d09'
set -gx NNN_PLUG 'm:-_|mousepad $nnn;c:-_|code $nnn;f:fzopen'
set -gx NNN_TRASH 1

set -gx QT_QPA_PLATFORMTHEME gtk3
set -gx _JAVA_AWT_WM_NONREPARENTING 1

set -gx BROWSER brave-browser
set -gx VISUAL mousepad
set -gx EDITOR nano


## PROMPT
starship init fish | source
