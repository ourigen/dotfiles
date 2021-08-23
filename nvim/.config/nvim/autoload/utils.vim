function! utils#Breakline()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel('/', -1)
endfunction

function! utils#Visualstar()
    let old_reg = getreg('v')
    normal! gv"vy
    let raw_search = getreg('v')
    call setreg('v', old_reg)
    return substitute(escape(raw_search, '\/.*$^~[]'), '\n', '\\n', 'g')
endfunction

function! utils#TrimTrailing()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
