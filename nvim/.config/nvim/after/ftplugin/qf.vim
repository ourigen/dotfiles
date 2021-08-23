setlocal nolist
setlocal number
setlocal norelativenumber
setlocal nobuflisted                  " Don't show qf on buffer list
" setlocal statusline=%#StatusLineNC#\ %t%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}

" Close if qf is the only buffer
augroup QfClose
  autocmd!
  autocmd BufEnter <buffer> if tabpagenr('$') == 1 && winnr('$') == 1 | quit | endif
augroup END
