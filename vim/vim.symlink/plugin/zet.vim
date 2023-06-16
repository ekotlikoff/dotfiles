function ZetWrapper()
    let arg = input('')
    call Zet(arg)
endfunction

function! Zet(...)
    let output = system('$HOME/.dotfiles/bin/zet --vimode '.join(a:000))
    execute 'edit '.output
endfunction

nnoremap <Leader>z :call ZetWrapper()<CR>
