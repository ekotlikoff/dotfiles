" CoC maps that apply to all language extensions.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>r <Plug>(coc-refactor)
nmap <leader>a <Plug>(coc-codeaction)

" Make <CR> auto-select the first completion item and format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

if ($DOT_TYPE == 'corp')
  source $CORPDOT/vim.vim
else
  let g:coc_user_config = {
      \ "suggest.noselect": "true",
      \ "coc.preferences.formatOnSaveFiletypes": [
      \   "go",
      \   "java",
      \   "javascript",
      \   "html",
      \   "json",
      \   "rust",
      \   "yaml"
      \ ],
      \ "go.goplsEnv": {
      \   "GOOS": "js",
      \   "GOARCH": "wasm"
      \ },
      \ "go.goplsOptions": {
      \   "completeUnimported": v:true
      \ },
      \ "java.home": "/usr/local/opt/openjdk",
      \ "java.format.enabled": "true"
      \}
endif
