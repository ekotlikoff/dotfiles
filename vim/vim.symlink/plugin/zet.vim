function ZetWrapper()
    let arg = input('')
    call Zet(arg)
endfunction

function! Zet(...)
    silent let output = substitute(system('$HOME/.dotfiles/bin/zet --vimode '.join(a:000)), '\e\[[0-9;]*m', '', 'g')
    if filereadable(output)
        execute 'edit '.output
    else
        redraw
        echo output
    endif
endfunction

nnoremap <Leader>z :call ZetWrapper()<CR>
