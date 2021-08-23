vim.g.nvim_tree_width = 35
-- vim.g.nvim_tree_auto_open = 1     -- opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1    -- closes the tree when it's the last window
vim.g.nvim_tree_add_trailing = 1  -- append trailing slash to folders
vim.g.nvim_tree_highlight_opened_files = 1  -- enable folder and file icon highlight for opened files/directories
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_update_cwd = 1 -- update CWD when changing directory (DirChanged event)
vim.g.nvim_tree_hijack_cursor = 0 -- when moving cursor in the tree, don't position the cursor at the start of the file
vim.g.nvim_tree_window_picker_exclude = {
	filetype = {
		'packer', 'qf'
	},
	buftype = {
		'terminal'
	}
}
vim.g.nvim_tree_symlink_arrow = ' » '
vim.g.nvim_tree_icons = {
	default = '',
	symlink = "",
	git = {
		unstaged = '',
		staged = '',
		renamed = '',
		deleted = '',
	},
}
vim.g.nvim_tree_gitignore = 1
