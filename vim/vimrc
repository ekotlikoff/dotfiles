" Packages sourced as per https://shapeshed.com/vim-packages/
" Specifically, included as a submodule at the vim start package path.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
let skip_defaults_vim=1
set nocompatible

syntax enable
let c_comment_strings=1

" Visual settings

" Show 80 character column
:set colorcolumn=80
set textwidth=80

" Solarized
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set number
set cursorline

" Highlight trailing whitespaces
highlight RedundantSpaces ctermbg=grey guibg=grey
match RedundantSpaces /\s\+$/

" Directory view with netrw as per https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" General options
set nocompatible
set incsearch
set smartcase
set ignorecase
set gdefault " Global substitutions by default
set showmode
set backspace=indent,eol,start
set showmatch
set autowrite
set scrolloff=10 " Guaranteed context lines
set history=200 " Keep 200 lines of command line history
set ruler " Show the cursor position all the time
set showcmd " Display incomplete commands
set ttimeout " Time out for key codes
set ttimeoutlen=100 " Wait up to 100ms after Esc for special key
set display=truncate " Show @@@ in the last line if it is truncated.
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set noswapfile
set icon
" Text search
set incsearch
set hlsearch
" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif
if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif
set belloff=all " Turn off sounds

" Mappings (only a few of these to make working on remote hosts with default
" configs easier)
nmap ; :
map Y y$ " make Y consistent with D and C (yank til end)
"map ,m :noh<CR> " Remove highlighted search terms with ,m
"imap jj <ESC> " Exit insert mode, use <C-[> instead

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Vim autocmds
if has("autocmd")
  " Load base template file per extension
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | normal G
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py | normal G
  augroup END
endif

" Tabs
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shiftround
set smarttab
set autoindent
set smartindent

" Smart tab complete (uses vim's native tab completion if there is text)
function! Smart_TabComplete()
  let line = getline('.')
  let line_to_cursor = strpart(line, -1, col('.'))
  let word_to_cursor = matchstr(line_to_cursor, "[^ \t\(\[]*$")
  if (strlen(word_to_cursor)==0)
    return "\<tab>"
  endif
  let has_period = match(word_to_cursor, '\.') != -1
  let has_slash = match(word_to_cursor, '\/') != -1
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>" " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>" " file matching
  else
    return "\<C-X>\<C-O>" " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Configure tabcomplete
set completeopt=longest,menu
set wildmode=longest,list,full
set wildmenu

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Revert with ":filetype off".
filetype plugin indent on

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

augroup END

" autoset :paste (bracketed paste)
" https://github.com/ConradIrwin/vim-bracketed-paste/blob/master/plugin/bracketed-paste.vim
let &t_ti .= "\<Esc>[?2004h"
let &t_te = "\e[?2004l" . &t_te

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

" Commands I am getting familiar with
" Lexplore to toggle netrw (t to open a file in new tab, p in pane)
" ma -> 'a to set / go to mark
" <C-r> " to paste unamed register
" Use the above to :vim {search_text} * to search for files containing text
" Then :copen or :cw to browse the files and open in window or new window
" ! to execute text in vim against any shell command, e.g. !!python,
" !}bash, etc
" "* is the system clipboard register, slick!

" Things to read
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" https://stevelosh.com/blog/2010/09/coming-home-to-vim

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END
