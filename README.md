### Description

This repo configures the below components for a nice developer setup. It is currently only tested on macos.

### Components
- Alacritty terminal emulator
  - Lightweight and configurable
- Vim text editor
  - Mostly config and vimscript plugins other than CoC which runs a node process per vim session and fzf which is an external go executable
    - [CoC](https://github.com/neoclide/coc.nvim) for multi language lsp support. This lets us set [maps](vim/vim.symlink/plugin/coc.vim) that apply to all languages (`gd` for go to definition, `gr` for get references, etc). To onboard a new lang simply add the CoC extension to [coc_extensions](vim/install.sh#L13)
    - [vim-go](https://github.com/fatih/vim-go) for go commands `,c`, `,t` and quickfix parsing
    - [fzf](https://github.com/junegunn/fzf) and [fzf.vim](https://github.com/junegunn/fzf.vim) for fuzzy finding
    - [vim-vinegar](https://github.com/tpope/vim-vinegar) and [vim-eunuch](https://github.com/tpope/vim-eunuch) for netrw improvements and simple filesystem commands like `:Move`
    - [vim-commentary](https://github.com/tpope/vim-commentary) for slick comment/uncomment command `gc`
    - [vim-fugitive](https://github.com/tpope/vim-fugitive) for `:Git` fun
    - [vim-surround](https://github.com/tpope/vim-surround) for surround commands like `cs"'` "hello" -> 'hello' and `ysiw"` hello -> "hello"
    - [vim-speeddating](https://github.com/tpope/vim-speeddating) for improved increment/decrement `C-S` and `C-X`, C-S is [configured](vim/vim.symlink/plugin/speeddating.vim) instead of the default C-A because that is the chosen tmux prefix here
    - [vim-sleuth](https://github.com/tpope/vim-sleuth) for auto tab sizing
    - [vim-unimpaired](https://github.com/tpope/vim-unimpaired) for various handy binds like `[f`, `[x`, `[e`, `[ ` etc
    - [vim-repeat](https://github.com/tpope/vim-repeat) to nicely support `.` with vim-surround, vim-speeddating, vim-unimpaired commands
    - [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) to give a visual indicator for yanked text
    - [splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim) for `gS` and `gJ`
- Tmux terminal multiplexer
  - This is [configured](tmux/config/vim.conf) to be vim-like in its mappings
- ZSH shell
  - [typewritten](https://github.com/reobin/typewritten) for a nice prompt that we could probably prune down into our own lighter version (with less git information displayed)
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) for syntax highlighting as you type
  - [fzf](https://github.com/junegunn/fzf) for `/` history search, `**` + `^F` file search, and `^R` ripgrep search
  - [glow](https://github.com/charmbracelet/glow) to render markdown, e.g. `glow README.md`
- [Git configs](git/gitconfig.symlink)
- Some [macOS defaults](macos/set-defaults.sh)

### Special files

- **bin/** Anything in bin/ will get added to your $PATH
- **topic/install.sh** Any file named install.sh is executed when you run `bin/dot`
- **topic/\*.symlink** Any file ending in .symlink gets symlinked into your $HOME
- **topic/path.zsh**: Any file named path.zsh is loaded first via [zsh.rc](zsh/zshrc.symlink) and is expected to setup $PATH or similar, e.g. [path.zsh](system/path.zsh)
- **topic/\*.zsh** Any files ending in .zsh get loaded into your zsh environment, e.g. [aliases.zsh](zsh/config/aliases.zsh) or [env.zsh](system/env.zsh)
- **topic/completion.zsh** Any file named completion.zsh is loaded last and is expected to setup autocomplete, e.g. [completion.zsh](zsh/config/completion.zsh)

### Installation

1. Clone the repo `git clone https://github.com/ekotlikoff/dotfiles.git $HOME/.dotfiles`
1. `~/.dotfiles/bin/dot`
