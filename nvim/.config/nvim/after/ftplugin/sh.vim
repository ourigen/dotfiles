setlocal iskeyword+=$

" if executable('shellcheck')
"     setlocal makeprg=shellcheck\ -f\ gcc\ %:S
"     setlocal errorformat=%f:%l:%c:\ %trror:\ %m\ [SC%n]
"     setlocal errorformat+=%f:%l:%c:\ %tarning:\ %m\ [SC%n]
"     setlocal errorformat+=%f:%l:%c:\ note:\ %m\ [SC%n]
" endif

" setlocal &textwidth=79
