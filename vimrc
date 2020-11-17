" Packages sourced as per https://shapeshed.com/vim-packages/
" Specifically, included as a submodule at the vim start package path.

"" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

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
" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif
" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif
if has('mouse')
"  set mouse=a " Enable the mouse
endif
if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif
set belloff=all " Turn off sounds

" Mappings
map ,m :noh<CR> " Remove highlighted search terms with ,m
imap jj <ESC> " Exit insert mode
nmap ; :
" Set Perl syntax for regex
nnoremap / /\v
vnoremap / /\v
map Q gq " Don't use Ex mode, use Q for formatting.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

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
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround
set smarttab
set autoindent

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

" Only do this part when Vim was compiled with the +eval feature.
if 1

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

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

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
" Lexplore to toggle netrw
" ma -> 'a to set / go to mark
" <C-r> " to paste unamed register
" Use the above to :vim {search_text} * to search for files containing text
" Then :copen or :cw to browse the files and open in window or new window

" Things to read
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" https://stevelosh.com/blog/2010/09/coming-home-to-vim

