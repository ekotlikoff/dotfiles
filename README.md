### Description

This repo configures the below components for a nice developer setup. It is currently only tested on macos.

### Components
- Alacritty terminal emulator
  - Lightweight and configurable
- Vim text editor
  - Try to minimize plugins to what vim is not natively good at
    - [CoC](https://github.com/neoclide/coc.nvim) for multi language lsp support. This lets us set [maps](vim/vim.symlink/plugin/coc.vim) that apply to all languages (`gd` for go to definition, `gr` for get references, etc). To onboard a new lang simply add the CoC extension to [coc_extensions](vim/install.sh)
    - [vim-vinegar](https://github.com/tpope/vim-vinegar) and [vim-eunuch](https://github.com/tpope/vim-eunuch) for netrw improvements and simple filesystem commands like `:Move`
    - [vim-commentary](https://github.com/tpope/vim-commentary) for slick comment/uncomment command `gc`
    - [vim-fugitive](https://github.com/tpope/vim-fugitive) for `:Git` fun
    - [vim-surround](https://github.com/tpope/vim-surround) for nice surround commands like `cs"'` "hello" -> 'hello' and `ysiw"` hello -> "hello"
    - [vim-repeat](https://github.com/tpope/vim-repeat) to nicely support `.` with vim-surround commands
- Tmux terminal multiplexer
  - This is [configured](tmux/config/vim.conf) to be vim-like in its mappings
- ZSH configs
  - [typewritten](https://github.com/reobin/typewritten) for a nice prompt that we could probably prune down into our own lighter version (with less git information displayed)
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) for syntax highlighting as you type
- various other configs

### Installation

1. Clone the repo `git clone https://github.com/ekotlikoff/dotfiles.git $HOME/.dotfiles`
1. `~/.dotfiles/script/bootstrap`

#### Credits to https://github.com/holman/dotfiles for the dotfiles design
