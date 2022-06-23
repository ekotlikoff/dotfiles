set completeopt-=preview
set omnifunc=syntaxcomplete#Complete
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
    else
      return "\<C-X>\<C-O>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
