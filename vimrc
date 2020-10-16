" Get common defaults
source $VIMRUNTIME/defaults.vim

" Packages sourced as per https://shapeshed.com/vim-packages/
" Specifically, included as a submodule at the vim start package path.

" Solarized
"set background=dark
set t_Co=256
"colorscheme solarized

" General options
set nocompatible
set incsearch
set smartcase
set ignorecase
set hlsearch
set showmode
set backspace=indent,eol,start
set mouse-=a " Turn mouse off
set ai
set showmatch
set autowrite
set scrolloff=10 " Guaranteed context lines

" Style
set sts=2 sw=2 et
set shiftround
set list
set listchars=tab:>-

" Highlight trailing whitespaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Show 80 character column
:set colorcolumn=80
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Mappings
" Remove highlighted search terms with ,m
map ,m :noh<CR>
map ,n :noh<CR>
" exit insert mode
imap jj <ESC>
nmap ; :
" reformat current paragraph
:nmap Q gqap
" reformat current selection
:vmap Q gq
" Ctrl + arrow to switch tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

