-- setlocal iskeyword+=$

vim.opt_local.iskeyword:append('$')
-- if vim.fn.executable('shellcheck')
-- then
--     vim.opt_local.makeprg = 'shellcheck\ -f\ gcc\ %:S'
-- 	vim.opt_local.errorformat = {
-- 		'%f:%l:%c:\ %trror:\ %m\ [SC%n]',
-- 		'%f:%l:%c:\ %tarning:\ %m\ [SC%n]',
-- 		'%f:%l:%c:\ note:\ %m\ [SC%n]'
-- 	}
-- end
