### Description

This repo configures the below components for a nice developer setup. It is currently setup for macos (various brew installs), it will need some TLC to get it working for linux flavors.

### Components
- Vim text editor
  - Try to minimize plugins to what vim is not natively good at
    - Nerdtree for simple file system manipulation (move files, etc).
    - CoC for multi language support. This lets me set [maps](vim/vim.symlink/plugin/coc.vim) that apply to all languages (`gd` for go to definition, `gr` for get references, etc). To onboard a new lang simply add the CoC extension to [coc_extensions](vim/install.sh). No new vim configs/mappings required.
- Tmux terminal multiplexer
  - This is [configured](tmux/config/vim.conf) to be vim-like in its mappings.

### Installation

1. Clone the repo `git clone https://github.com/ekotlikoff/dotfiles.git $HOME/.dotfiles`
1. `~/.dotfiles/script/bootstrap`

#### Credits to https://github.com/holman/dotfiles for the dotfiles design
