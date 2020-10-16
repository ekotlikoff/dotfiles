" Get common defaults
source $VIMRUNTIME/defaults.vim

" Packages sourced as per https://shapeshed.com/vim-packages/
" Specifically, included as a submodule at the vim start package path.

" Visual settings

" Show 80 character column
:set colorcolumn=80
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Solarized
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set nu

" Highlight trailing whitespaces
highlight RedundantSpaces ctermbg=red guibg=red
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

if has("autocmd")
  " Load base template file per extension
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | normal G
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py | normal G
  augroup END
  " Automatically open directory view with netrw
  augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * Vexplore | wincmd l
  augroup END
endif

