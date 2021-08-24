" if executable('chktex')
"     setlocal makeprg=chktex\ --inputfiles\ --quiet\ -v0\ --\ %:S
"     setlocal errorformat=%f,\ line\ %l.%c:\ %m
" endif

" :h syntax tex.vim
let g:tex_flavor = 'latex'
let g:tex_conceal = 'abdmgs'
let g:tex_fold_enabled=1
let g:tex_comment_nospell= 1
let g:tex_verbspell= 1
let g:tex_fast= 'bcmMps'
