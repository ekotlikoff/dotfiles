" Get common defaults
source $VIMRUNTIME/defaults.vim

" Packages sourced as per https://shapeshed.com/vim-packages/
" Specifically, included as a submodule at the vim start package path.

" Visual settings

" Show 80 character column
:set colorcolumn=80

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
" exit insert mode
imap jj <ESC>
nmap ; :
" Set Perl syntax for regex
nnoremap / /\v
vnoremap / /\v

" Vim autocmds
if has("autocmd")
  " Load base template file per extension
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | normal G
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py | normal G
  augroup END
endif

" Smart tab complete (uses vim's native tab completion if there is text)
function! Smart_TabComplete()
  let line = getline('.')
  let line_to_cursor = strpart(line, -1, col('.'))
  let word_to_cursor = matchstr(line_to_cursor, "[^ \t]*$")
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
set completeopt=preview,longest
set wildmode=longest,list,full
set wildmenu

" Commands I am getting familiar with
" Lexplore to toggle netrw
" ma -> 'a to set / go to mark

" Things to read
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" https://stevelosh.com/blog/2010/09/coming-home-to-vim

