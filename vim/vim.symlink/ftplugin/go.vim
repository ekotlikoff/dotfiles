if exists("b:did_goftplugin") | finish | endif
let b:did_goftplugin = 1

" CoC organize imports on writes.
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Let CoC handle most things, vim-go for go commands and quickfix parsing
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_auto_sameids = 0
let g:go_fmt_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_diagnostics_enabled = 0
let g:go_echo_go_info = 0
let g:go_metalinter_enabled = 0
nmap <leader>t <Plug>(go-test)
nmap <Leader>c <Plug>(go-coverage-toggle)
