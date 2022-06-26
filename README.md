### Description

This repo configures the below components for a nice developer setup. It is currently only tested on macos.

### Components
- Alacritty terminal emulator
  - Lightweight and configurable
- Vim text editor
  - Try to minimize plugins to what vim is not natively good at
    - [Nerdtree](https://github.com/preservim/nerdtree) for simple file system manipulation (move files, etc).
    - [CoC](https://github.com/neoclide/coc.nvim) for multi language lsp support. This lets me set [maps](vim/vim.symlink/plugin/coc.vim) that apply to all languages (`gd` for go to definition, `gr` for get references, etc). To onboard a new lang simply add the CoC extension to [coc_extensions](vim/install.sh). No new vim configs/mappings required.
    - [vim-commentary](https://github.com/tpope/vim-commentary) for slick comment/uncomment command `gc`
- Tmux terminal multiplexer
  - This is [configured](tmux/config/vim.conf) to be vim-like in its mappings.
- ZSH configs
  - typewritten for a nice prompt that we could probably prune down into our own lighter version (with less git information displayed)
  - zsh-syntax-highlighting for syntax highlighting as you type
- various other configs

### Installation

1. Clone the repo `git clone https://github.com/ekotlikoff/dotfiles.git $HOME/.dotfiles`
1. `~/.dotfiles/script/bootstrap`

#### Credits to https://github.com/holman/dotfiles for the dotfiles design
