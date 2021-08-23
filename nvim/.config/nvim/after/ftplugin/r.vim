" let r_syntax_folding = 1
" let r_syntax_fun_pattern = 1

" if executable('R')
"   setlocal formatprg=Rscript\ -e\ 'library(\"styler\");style_file(\"%:p\")'
"   setlocal makeprg=Rscript\ -e\ 'lintr::lint(\"%:p\",cache=FALSE)'
"   setlocal errorformat=%E%f:%l:%c:\ %trror:\ %m,%-C%.%#,%-Z%p^
"   setlocal errorformat=%E%f:%l:%c:\ style:\ %m,%-C%.%#,%-Z%p^
" endif

setlocal textwidth=80
setlocal expandtab
" setlocal tabstop&
" setlocal shiftwidth=4
" setlocal softtabstop=-1  " use value of shiftwidth
