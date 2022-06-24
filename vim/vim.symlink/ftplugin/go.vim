if exists("b:did_goftplugin") | finish | endif
let b:did_goftplugin = 1

" CoC organize imports on writes.
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
