bindkey -v # vi mode

# Edit command with an external editor
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# CTRL-R redo
bindkey -M vicmd '^R' redo
