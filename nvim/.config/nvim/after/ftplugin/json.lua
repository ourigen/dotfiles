-- setlocal expandtab
-- if executable('jq')
-- 	setlocal formatprg=jq
-- endif
vim.opt_local.expandtab = true
if vim.fn.executable('jq')
then
	vim.opt_local.formatprg = 'jq'
end
