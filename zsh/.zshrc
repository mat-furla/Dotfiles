# .zshrc

## THEME
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## OPTIONS
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt prompt_subst

autoload -U compinit colors zcalc
compinit -d
colors

## COMPLETION
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.cache/zsh

## HISTORY
HISTFILE=$HOME/.config/zsh/history
HISTSIZE=1000
SAVEHIST=1000

## SEARCH HISTORY
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

## AUTO SUGGESTIONS
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#949ab7"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

## SYNTAX HIGHLIGHT
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=001,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=014,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=012,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=004,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=006,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=004,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=200,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=010,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=129,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=006
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=006
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=200
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=011
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=003
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=013,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=013,bold
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=fg=009
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=fg=009,bold
ZSH_HIGHLIGHT_STYLES[assign]=fg=009,bold

## HOME, END, DELETE
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# WORDS NAVIGATION
bindkey '^[Oc'    forward-word
bindkey '^[Od'    backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H'      backward-kill-word                                 
bindkey '^[[Z'    undo

## ALIASES
source $HOME/.config/zsh/aliases

## EXPORTS
source $HOME/.config/zsh/exports
