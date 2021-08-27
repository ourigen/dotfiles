require('iron').core.set_config {
	repl_open_cmd = "botright 20 split"
}
vim.api.nvim_set_keymap("n", "gss", "<Plug>(iron-send-line)", {noremap = false})
vim.api.nvim_set_keymap("n", "gs", "<Plug>(iron-send-motion)", {noremap = false})
vim.api.nvim_set_keymap("v", "gs", "<Plug>(iron-visual-send)", {noremap = false})
