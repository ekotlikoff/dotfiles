map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <expr> <leader>a  empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'
