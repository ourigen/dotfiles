" setlocal makeprg=Rscript\ -e\ 'rmarkdown::render(\"%:p\")'
setlocal expandtab
setlocal tabstop&
setlocal shiftwidth=4
setlocal softtabstop=-1 " use value of shiftwidth

let rmd_syn_hl_chunk = 1
let rmd_fenced_languages = ['r', 'python']
let rmd_include_html = 1

command! -buffer -bang -nargs=*
      \ -complete=custom,rmarkdown#command#complete
      \ RMarkdown call rmarkdown#command#call('<bang>', '<args>')
