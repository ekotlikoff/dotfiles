export CLICOLOR=true

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

unsetopt beep
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt COMPLETE_IN_WORD
setopt PROMPT_SUBST

setopt SHARE_HISTORY # share history between zsh sessions
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history

# don't expand aliases _before_ completion has finished
#    like: git comm-[tab]
setopt complete_aliases
