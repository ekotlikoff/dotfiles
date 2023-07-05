function ZetWrapper()
    let arg = input('')
    call Zet(arg)
endfunction

function! Zet(...)
    let output = system('$HOME/.dotfiles/bin/zet --vimode '.join(a:000))
    if filereadable(output)
        execute 'edit '.output
    else
        echo output
    endif
endfunction

nnoremap <Leader>z :call ZetWrapper()<CR>
