set splitbelow
set splitright

" Map ctrl + HJKL
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map meta (alt/option) + -=,. to window resizing. Run cat to determine what character
" your system maps meta + -=,. to as per
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim/15399297#15399297.
nnoremap <silent> ≠ <c-w>+
nnoremap <silent> – <c-w>-
nnoremap <silent> ≥ <c-w>>
nnoremap <silent> ≤ <c-w><
