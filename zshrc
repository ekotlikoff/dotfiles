# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Add vcs info to promp as per https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
# Add working directory to prompt
export PS1="%d %% "

# Dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"
bindkey -v
# Remap jj to entering cmd mode
bindkey -M viins 'jj' vi-cmd-mode
# Bind / and C-R to reverse search
bindkey -M vicmd '/' vi-history-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/.dotfiles/bin"

